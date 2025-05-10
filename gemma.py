from unsloth import FastLanguageModel
import torch
from datasets import Dataset
import json
from trl import SFTTrainer
from transformers import TrainingArguments
import os
from concurrent.futures import ThreadPoolExecutor, as_completed
from multiprocessing import cpu_count
import numpy as np
from torch.utils.data import DataLoader

# Enable TF32 for faster training on Ampere GPUs
torch.backends.cuda.matmul.allow_tf32 = True
torch.backends.cudnn.allow_tf32 = True

# Optimize CUDA settings and memory management
torch.cuda.empty_cache()
if torch.cuda.is_available():
    torch.cuda.set_per_process_memory_fraction(0.8)  # Further reduced to prevent OOM
    torch.backends.cudnn.benchmark = True
    torch.backends.cudnn.deterministic = False
    # Enable expandable segments and memory pool to reduce fragmentation
    os.environ['PYTORCH_CUDA_ALLOC_CONF'] = 'expandable_segments:True,max_split_size_mb:256'

max_seq_length = 8192
dtype = None
load_in_4bit = True

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name="unsloth/gemma-3-12b-it-unsloth-bnb-4bit",
    max_seq_length=max_seq_length,
    dtype=dtype,
    load_in_4bit=load_in_4bit,
)

# Set padding_side to 'left' for decoder-only architecture
tokenizer.padding_side = 'left'
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token

model = FastLanguageModel.get_peft_model(
    model,
    r=32,
    target_modules=["q_proj", "k_proj", "v_proj", "o_proj",
                   "gate_proj", "up_proj", "down_proj"],
    lora_alpha=64,
    lora_dropout=0.0,
    bias="none",
    use_gradient_checkpointing="unsloth",
    random_state=3407,
    use_rslora=True,
    loftq_config=None,
)

def load_jsonl_data(filename):
    data = []
    with open(filename, 'r') as f:
        for line in f:
            data.append(json.loads(line.strip()))
    return data

def format_data(examples):
    texts = []
    messages_list = examples['messages']
    
    for messages in messages_list:
        # Use Gemma chat template
        formatted_text = ""
        for message in messages:
            if message["role"] == "user":
                formatted_text += f"<start_of_turn>user\n{message['content']}<end_of_turn>\n"
            elif message["role"] == "assistant":
                formatted_text += f"<start_of_turn>model\n{message['content']}<end_of_turn>"
        texts.append(formatted_text)
    return {"text": texts}

def parallel_tokenize(texts, tokenizer, max_length, num_workers=None):
    """Parallel tokenization for faster processing"""
    if num_workers is None:
        num_workers = min(cpu_count(), 8)
    
    # Tokenize all texts together to ensure consistent padding
    return tokenizer(
        texts,
        return_tensors="pt",
        max_length=max_length,
        truncation=True,
        padding=True,
        add_special_tokens=False
    )

training_data = load_jsonl_data("training.jsonl")
train_dataset = Dataset.from_list(training_data)
train_dataset = train_dataset.map(format_data, batched=True, num_proc=min(cpu_count(), 8))

# Ensure tokenizer uses left padding before training
tokenizer.padding_side = 'left'

# Optimize training arguments for better CUDA utilization
num_gpus = torch.cuda.device_count()
effective_batch_size = 8 if num_gpus >= 2 else 4
per_device_batch_size = max(1, effective_batch_size // num_gpus)

trainer = SFTTrainer(
    model=model,
    tokenizer=tokenizer,
    train_dataset=train_dataset,
    dataset_text_field="text",
    max_seq_length=max_seq_length,
    dataset_num_proc=min(cpu_count(), 8),
    packing=True,
    args=TrainingArguments(
        per_device_train_batch_size=per_device_batch_size,
        gradient_accumulation_steps=max(1, 8 // effective_batch_size),
        warmup_ratio=0.1,
        max_steps=60,
        learning_rate=2e-4,
        fp16=not torch.cuda.is_bf16_supported(),
        bf16=torch.cuda.is_bf16_supported(),
        logging_steps=1,
        optim="adamw_torch_fused",
        weight_decay=0.01,
        lr_scheduler_type="cosine",
        seed=3407,
        output_dir="outputs",
        dataloader_num_workers=min(cpu_count(), 8),
        dataloader_pin_memory=True,
        gradient_checkpointing=True,
        max_grad_norm=1.0,
        ddp_find_unused_parameters=False if num_gpus > 1 else None,
        torch_compile=True,
        dataloader_persistent_workers=True,
    ),
)

trainer_stats = trainer.train()

model.save_pretrained("gemma-quantum-classifier")
tokenizer.save_pretrained("gemma-quantum-classifier")

FastLanguageModel.for_inference(model)

# Pad token already configured above

# Additional memory optimization after training
if torch.cuda.is_available():
    torch.cuda.empty_cache()
    # Force garbage collection
    import gc
    gc.collect()

def classify_quantum_circuit(circuit_code):
    prompt = f"<start_of_turn>user\nClassify this program as malicious or benign: {circuit_code}<end_of_turn>\n<start_of_turn>model\n"
    
    # Ensure left padding for single inference
    original_padding_side = tokenizer.padding_side
    tokenizer.padding_side = 'left'
    
    inputs = tokenizer(
        prompt, 
        return_tensors="pt",
        max_length=max_seq_length,
        truncation=True,
        padding=False
    ).to("cuda")
    
    # Restore original padding side
    tokenizer.padding_side = original_padding_side
    
    with torch.amp.autocast('cuda', enabled=torch.cuda.is_bf16_supported()):
        outputs = model.generate(
            input_ids=inputs.input_ids,
            attention_mask=inputs.attention_mask,
            max_new_tokens=10,
            use_cache=True,
            temperature=0.1,
            do_sample=True,
            pad_token_id=tokenizer.pad_token_id
        )
    
    response = tokenizer.decode(outputs[0][len(inputs.input_ids[0]):], skip_special_tokens=True)
    return response.strip()

def get_optimal_batch_size():
    """Calculate optimal batch size based on available GPU memory"""
    if not torch.cuda.is_available():
        return 1
    
    gpu_memory = torch.cuda.get_device_properties(0).total_memory
    available_memory = gpu_memory - torch.cuda.memory_allocated(0)
    
    # More conservative estimate: each sample needs ~4-6GB during generation
    # Account for attention mechanism memory scaling with 8K sequences
    estimated_memory_per_sample = 5 * 1024**3  # 5GB per sample for safety
    optimal_batch = max(1, int(available_memory * 0.4 / estimated_memory_per_sample))
    
    return min(optimal_batch, 2)  # Cap at 2 to be safer with long sequences

def batch_classify_quantum_circuits(circuit_codes, batch_size=None):
    """Batch classification with dynamic memory management"""
    if batch_size is None:
        batch_size = get_optimal_batch_size()
    
    results = []
    device = "cuda" if torch.cuda.is_available() else "cpu"
    
    print(f"Processing {len(circuit_codes)} samples with batch size {batch_size}")
    
    for i in range(0, len(circuit_codes), batch_size):
        try:
            # Clear cache before each batch
            if torch.cuda.is_available():
                torch.cuda.empty_cache()
                
            batch = circuit_codes[i:i+batch_size]
            prompts = [f"<start_of_turn>user\nClassify this program as malicious or benign: {code}<end_of_turn>\n<start_of_turn>model\n" 
                      for code in batch]
            
            # Use shorter sequences for inference to reduce memory
            inference_max_length = min(max_seq_length, 3072)  # Further reduced sequence length for inference
            
            # Batch tokenization with explicit left padding
            # Temporarily ensure left padding for this batch
            original_padding_side = tokenizer.padding_side
            tokenizer.padding_side = 'left'
            
            inputs = tokenizer(
                prompts,
                return_tensors="pt",
                max_length=inference_max_length,
                truncation=True,
                padding=True,
                add_special_tokens=False
            ).to(device)
            
            # Restore original padding side
            tokenizer.padding_side = original_padding_side
            
            with torch.amp.autocast('cuda', enabled=torch.cuda.is_bf16_supported()):
                with torch.no_grad():
                    outputs = model.generate(
                        input_ids=inputs.input_ids,
                        attention_mask=inputs.attention_mask,
                        max_new_tokens=5,  # Further reduced
                        use_cache=False,  # Disable cache to save memory
                        temperature=0.1,
                        do_sample=True,
                        pad_token_id=tokenizer.pad_token_id,
                        num_beams=1,  # Greedy decoding to save memory
                        early_stopping=True  # Stop generation early when possible
                    )
            
            # Decode responses
            for j, output in enumerate(outputs):
                input_length = len(inputs.input_ids[j])
                response = tokenizer.decode(output[input_length:], skip_special_tokens=True)
                results.append(response.strip())
            
            # Clean up intermediate tensors
            del inputs, outputs
            if torch.cuda.is_available():
                torch.cuda.empty_cache()
                
        except torch.cuda.OutOfMemoryError as e:
            print(f"OOM Error at batch {i//batch_size + 1}, reducing batch size...")
            if batch_size > 1:
                # Retry with smaller batch size
                smaller_batch_size = max(1, batch_size // 2)
                remaining_codes = circuit_codes[i:]
                remaining_results = batch_classify_quantum_circuits(remaining_codes, smaller_batch_size)
                results.extend(remaining_results)
                break
            else:
                raise e
    
    return results

if __name__ == "__main__":
    import os
    from datetime import datetime
    import time
    
    os.makedirs("gemma_results", exist_ok=True)
    
    print("Testing trained model on validation data...")
    y_true = []
    y_pred = []
    predictions_details = []
    circuit_codes = []
    filenames = []
    
    # Load all validation data first for batch processing
    for filename in os.listdir("validation"):
        if filename.endswith(".qasm"):
            with open(os.path.join("validation", filename), "r") as file:
                circuit_code = file.read()
                escaped_string = circuit_code.replace("\n\n", "\n").replace("\n", "\\n")
                
                if len(escaped_string) < 10000:
                    true_label = "malicious" if "malicious" in filename else "benign"
                    y_true.append(true_label)
                    circuit_codes.append(escaped_string)
                    filenames.append(filename)
    
    print(f"Processing {len(circuit_codes)} validation samples...")
    start_time = time.time()
    
    # Clear memory before inference
    if torch.cuda.is_available():
        torch.cuda.empty_cache()
        print(f"GPU Memory before inference: {torch.cuda.memory_allocated(0) / 1024**3:.2f}GB allocated, "
              f"{torch.cuda.memory_reserved(0) / 1024**3:.2f}GB reserved")
    
    # Use dynamic batch processing with memory management
    predictions = batch_classify_quantum_circuits(circuit_codes)
    
    processing_time = time.time() - start_time
    print(f"Batch processing completed in {processing_time:.2f}seconds ({len(circuit_codes)/processing_time:.2f} samples/sec)")
    
    # Process predictions
    for i, (filename, prediction) in enumerate(zip(filenames, predictions)):
        true_label = y_true[i]
        pred_label = "malicious" if "malicious" in prediction.lower() else "benign"
        y_pred.append(pred_label)
        predictions_details.append({
            'filename': filename,
            'true_label': true_label,
            'predicted_label': pred_label,
            'raw_prediction': prediction,
            'correct': true_label == pred_label
        })
    
    from sklearn.metrics import confusion_matrix, classification_report, accuracy_score, precision_recall_fscore_support
    import matplotlib.pyplot as plt
    import seaborn as sns
    
    cm = confusion_matrix(y_true, y_pred)
    accuracy = accuracy_score(y_true, y_pred)
    precision, recall, f1, support = precision_recall_fscore_support(y_true, y_pred, average='weighted')
    
    print(f"\nGemma 3 12B Results:")
    print(f"Accuracy: {accuracy:.4f}")
    print("\nClassification Report:")
    classification_rep = classification_report(y_true, y_pred)
    print(classification_rep)
    
    plt.figure(figsize=(10, 8))
    sns.heatmap(cm, annot=True, fmt="d", cmap="Blues", 
                xticklabels=["benign", "malicious"], 
                yticklabels=["benign", "malicious"])
    plt.xlabel("Predicted Label")
    plt.ylabel("True Label")
    plt.title("Confusion Matrix - Gemma 3 12B Quantum Circuit Classifier")
    plt.tight_layout()
    plt.savefig("gemma_results/gemma_confusion_matrix.png", dpi=300, bbox_inches='tight')
    plt.close()
    
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    with open("gemma_results/gemma_results.txt", "w") as f:
        f.write(f"Gemma 3 12B Quantum Circuit Classification Results\n")
        f.write(f"Generated on: {timestamp}\n")
        f.write(f"="*60 + "\n\n")
        
        f.write(f"MODEL INFORMATION:\n")
        f.write(f"Model: Gemma 3 12B (4-bit quantized with LoRA)\n")
        f.write(f"Framework: Unsloth\n")
        f.write(f"Task: Binary classification (malicious/benign quantum circuits)\n")
        f.write(f"GPU Count: {torch.cuda.device_count()}\n")
        f.write(f"GPU Memory: {torch.cuda.get_device_properties(0).total_memory / (1024**3):.1f}GB\n")
        f.write(f"Processing Time: {processing_time:.2f}s ({len(circuit_codes)/processing_time:.2f} samples/sec)\n")
        f.write(f"Dynamic Batch Sizing: Enabled\n\n")
        
        f.write(f"OVERALL METRICS:\n")
        f.write(f"Accuracy: {accuracy:.4f}\n")
        f.write(f"Precision: {precision:.4f}\n")
        f.write(f"Recall: {recall:.4f}\n")
        f.write(f"F1-Score: {f1:.4f}\n\n")
        
        f.write(f"CONFUSION MATRIX:\n")
        f.write(f"                Predicted\n")
        f.write(f"Actual    Benign  Malicious\n")
        f.write(f"Benign    {cm[0][0]:6d}  {cm[0][1]:9d}\n")
        f.write(f"Malicious {cm[1][0]:6d}  {cm[1][1]:9d}\n\n")
        
        f.write(f"DETAILED CLASSIFICATION REPORT:\n")
        f.write(classification_rep)
        f.write(f"\n\nVALIDATION STATISTICS:\n")
        f.write(f"Total validation samples: {len(y_true)}\n")
        f.write(f"Correct predictions: {sum(1 for p in predictions_details if p['correct'])}\n")
        f.write(f"Incorrect predictions: {sum(1 for p in predictions_details if not p['correct'])}\n\n")
        
        f.write(f"DETAILED PREDICTIONS:\n")
        f.write(f"{'Filename':<30} {'True':<10} {'Predicted':<10} {'Correct':<8} {'Raw Prediction'}\n")
        f.write(f"-"*80 + "\n")
        for pred in predictions_details:
            f.write(f"{pred['filename']:<30} {pred['true_label']:<10} {pred['predicted_label']:<10} "
                   f"{'✓' if pred['correct'] else '✗':<8} {pred['raw_prediction']}\n")
    
    print(f"\nGemma results saved to gemma_results/ directory:")
    print(f"- gemma_confusion_matrix.png")
    print(f"- gemma_results.txt")
    print(f"\nOverall accuracy: {accuracy:.4f}")
    print(f"Total samples processed: {len(y_true)}")