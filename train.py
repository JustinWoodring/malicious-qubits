#!/usr/bin/env python3

import argparse
import torch
import json
import os
import time
import gc
from datetime import datetime
from multiprocessing import cpu_count
from concurrent.futures import ThreadPoolExecutor, as_completed

from unsloth import FastLanguageModel
from datasets import Dataset
from trl import SFTTrainer
from transformers import TrainingArguments
from sklearn.metrics import confusion_matrix, classification_report, accuracy_score, precision_recall_fscore_support
import matplotlib.pyplot as plt
import seaborn as sns

MODELS = {
    "llama": {
        "name": "unsloth/Meta-Llama-3.1-8B-Instruct-bnb-4bit",
        "chat_template": "llama",
        "output_prefix": "llama"
    },
    "qwen": {
        "name": "unsloth/Qwen2.5-Coder-7B-bnb-4bit", 
        "chat_template": "qwen",
        "output_prefix": "qwen"
    },
    "mistral": {
        "name": "unsloth/mistral-7b-instruct-v0.3-bnb-4bit",
        "chat_template": "mistral", 
        "output_prefix": "mistral"
    },
    "seedcoder": {
        "name": "unsloth/Seed-Coder-8B-Instruct-unsloth-bnb-4bit",
        "chat_template": "seedcoder",
        "output_prefix": "seedcoder"
    }
}

def setup_cuda():
    torch.backends.cuda.matmul.allow_tf32 = True
    torch.backends.cudnn.allow_tf32 = True
    torch.cuda.empty_cache()
    
    if torch.cuda.is_available():
        torch.cuda.set_per_process_memory_fraction(0.9)
        torch.backends.cudnn.benchmark = True
        torch.backends.cudnn.deterministic = False
        os.environ['PYTORCH_CUDA_ALLOC_CONF'] = 'expandable_segments:True'

def load_jsonl_data(filename):
    data = []
    with open(filename, 'r') as f:
        for line in f:
            data.append(json.loads(line.strip()))
    return data

def format_data_llama(examples):
    texts = []
    messages_list = examples['messages']
    
    for messages in messages_list:
        formatted_text = ""
        for message in messages:
            if message["role"] == "user":
                formatted_text += f"<|start_header_id|>user<|end_header_id|>\n\n{message['content']}<|eot_id|>"
            elif message["role"] == "assistant":
                formatted_text += f"<|start_header_id|>assistant<|end_header_id|>\n\n{message['content']}<|eot_id|>"
        texts.append(formatted_text)
    return {"text": texts}

def format_data_qwen(examples):
    texts = []
    messages_list = examples['messages']
    
    for messages in messages_list:
        formatted_text = ""
        for message in messages:
            if message["role"] == "user":
                formatted_text += f"<|user|>\n{message['content']}<|endoftext|>\n"
            elif message["role"] == "assistant":
                formatted_text += f"<|assistant|>\n{message['content']}<|endoftext|>"
        texts.append(formatted_text)
    return {"text": texts}

def format_data_mistral(examples):
    texts = []
    messages_list = examples['messages']
    
    for messages in messages_list:
        formatted_text = ""
        for message in messages:
            if message["role"] == "user":
                formatted_text += f"<s>[INST] {message['content']} [/INST]"
            elif message["role"] == "assistant":
                formatted_text += f"{message['content']}</s>"
        texts.append(formatted_text)
    return {"text": texts}

def format_data_seedcoder(examples):
    texts = []
    messages_list = examples['messages']
    
    for messages in messages_list:
        formatted_text = ""
        for message in messages:
            if message["role"] == "user":
                formatted_text += f"<|begin_of_text|><|start_header_id|>user<|end_header_id|>\n\n{message['content']}<|eot_id|>"
            elif message["role"] == "assistant":
                formatted_text += f"<|start_header_id|>assistant<|end_header_id|>\n\n{message['content']}<|eot_id|><|end_of_text|>"
        texts.append(formatted_text)
    return {"text": texts}

def get_format_function(model_type):
    if model_type == "llama":
        return format_data_llama
    elif model_type == "qwen":
        return format_data_qwen
    elif model_type == "mistral":
        return format_data_mistral
    elif model_type == "seedcoder":
        return format_data_seedcoder
    else:
        raise ValueError(f"Unsupported model type: {model_type}")

def create_inference_prompt(model_type, code):
    if model_type == "llama":
        return f"<|start_header_id|>user<|end_header_id|>\n\nClassify this program as malicious or benign: {code}<|eot_id|><|start_header_id|>assistant<|end_header_id|>\n\n"
    elif model_type == "qwen":
        return f"<|user|>\nClassify this program as malicious or benign: {code}<|endoftext|>\n<|assistant|>\n"
    elif model_type == "mistral":
        return f"<s>[INST] Classify this program as malicious or benign: {code} [/INST]"
    elif model_type == "seedcoder":
        return f"<|begin_of_text|><|start_header_id|>user<|end_header_id|>\n\nClassify this program as malicious or benign: {code}<|eot_id|><|start_header_id|>assistant<|end_header_id|>\n\n"
    else:
        raise ValueError(f"Unsupported model type: {model_type}")

def get_optimal_batch_size():
    if not torch.cuda.is_available():
        return 1
    
    gpu_memory = torch.cuda.get_device_properties(0).total_memory
    available_memory = gpu_memory - torch.cuda.memory_allocated(0)
    
    estimated_memory_per_sample = 3 * 1024**3  # 3GB per sample
    optimal_batch = max(1, int(available_memory * 0.6 / estimated_memory_per_sample))
    
    return 1 

def batch_classify_quantum_circuits(model, tokenizer, model_type, circuit_codes, batch_size=None):
    if batch_size is None:
        batch_size = get_optimal_batch_size()
    
    results = []
    device = "cuda" if torch.cuda.is_available() else "cpu"
    
    print(f"Processing {len(circuit_codes)} samples with batch size {batch_size}")
    
    for i in range(0, len(circuit_codes), batch_size):
        try:
            print(f"\rProcessing batch {i//batch_size + 1}/{(len(circuit_codes) + batch_size - 1)//batch_size} ({i}/{len(circuit_codes)})", end="", flush=True)
            
            if torch.cuda.is_available():
                torch.cuda.empty_cache()
                
            batch = circuit_codes[i:i+batch_size]
            prompts = [create_inference_prompt(model_type, code) for code in batch]

            original_padding_side = tokenizer.padding_side
            tokenizer.padding_side = 'left'
            
            inputs = tokenizer(
                prompts,
                return_tensors="pt",
                max_length=10000,  # inference length
                truncation=True,
                padding=True,
                add_special_tokens=False
            ).to(device)
            
            tokenizer.padding_side = original_padding_side
            
            with torch.amp.autocast('cuda', enabled=torch.cuda.is_bf16_supported()):
                with torch.no_grad():
                    outputs = model.generate(
                        input_ids=inputs.input_ids,
                        attention_mask=inputs.attention_mask,
                        max_new_tokens=8,
                        use_cache=False,
                        do_sample=False,
                        pad_token_id=tokenizer.pad_token_id,
                        num_beams=1,
                    )
            
            for j, output in enumerate(outputs):
                input_length = len(inputs.input_ids[j])
                response = tokenizer.decode(output[input_length:], skip_special_tokens=True)
                results.append(response.strip())
            
            del inputs, outputs
            if torch.cuda.is_available():
                torch.cuda.empty_cache()
                
        except torch.cuda.OutOfMemoryError as e:
            print(f"\nOOM Error at batch {i//batch_size + 1}, reducing batch size...")
            if batch_size > 1:
                smaller_batch_size = max(1, batch_size // 2)
                remaining_codes = circuit_codes[i:]
                remaining_results = batch_classify_quantum_circuits(model, tokenizer, model_type, remaining_codes, smaller_batch_size)
                results.extend(remaining_results)
                break
            else:
                raise e
    
    print()  # New line after progress
    return results

def plot_loss_curves(trainer_stats, model_type):
    """Generate and save training and validation loss curves"""
    log_history = trainer_stats.state.log_history
    
    # Extract training and validation data
    train_steps = []
    train_losses = []
    eval_steps = []
    eval_losses = []
    learning_rates = []
    
    for entry in log_history:
        if 'loss' in entry and 'eval_loss' not in entry:
            # Training loss entries
            train_steps.append(entry['step'])
            train_losses.append(entry['loss'])
            if 'learning_rate' in entry:
                learning_rates.append(entry['learning_rate'])
        elif 'eval_loss' in entry:
            # Validation loss entries
            eval_steps.append(entry['step'])
            eval_losses.append(entry['eval_loss'])
    
    if not train_losses:
        print("No training loss data found to plot.")
        return
    
    # Create figure with 2 subplots
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 10))
    
    # Plot training and validation losses
    ax1.plot(train_steps, train_losses, 'b-', linewidth=2, label='Training Loss', alpha=0.8)
    
    if eval_losses:
        ax1.plot(eval_steps, eval_losses, 'r-', linewidth=2, label='Validation Loss', alpha=0.8)
        ax1.legend()
    
    ax1.set_xlabel('Training Steps')
    ax1.set_ylabel('Loss')
    ax1.set_title(f'{model_type.title()} Model Training and Validation Loss')
    ax1.grid(True, alpha=0.3)
    ax1.legend()
    
    # Plot learning rate if available
    if learning_rates and len(learning_rates) == len(train_steps):
        ax2.plot(train_steps, learning_rates, 'g-', linewidth=2, label='Learning Rate')
        ax2.set_xlabel('Training Steps')
        ax2.set_ylabel('Learning Rate')
        ax2.set_title('Learning Rate Schedule')
        ax2.grid(True, alpha=0.3)
        ax2.legend()
        ax2.ticklabel_format(style='scientific', axis='y', scilimits=(0,0))
    else:
        ax2.text(0.5, 0.5, 'Learning Rate Data Not Available', 
                ha='center', va='center', transform=ax2.transAxes, fontsize=14)
        ax2.set_title('Learning Rate Schedule')
    
    plt.tight_layout()
    
    # Save the plot
    os.makedirs("results", exist_ok=True)
    loss_curve_path = f"results/{model_type}_loss_curves.png"
    plt.savefig(loss_curve_path, dpi=300, bbox_inches='tight')
    plt.close()
    
    print(f"Loss curves saved to: {loss_curve_path}")
    
    # Save loss data as text file for further analysis
    loss_data_path = f"results/{model_type}_loss_data.txt"
    with open(loss_data_path, 'w') as f:
        f.write(f"Training and Validation Loss Data for {model_type.title()} Model\n")
        f.write("="*60 + "\n\n")
        
        # Training data
        f.write("TRAINING DATA:\n")
        f.write(f"{'Step':<8} {'Train Loss':<12} {'Learning Rate':<15}\n")
        f.write("-"*35 + "\n")
        
        for i, (step, loss) in enumerate(zip(train_steps, train_losses)):
            lr = learning_rates[i] if i < len(learning_rates) else "N/A"
            if isinstance(lr, float):
                f.write(f"{step:<8} {loss:<12.6f} {lr:<15.2e}\n")
            else:
                f.write(f"{step:<8} {loss:<12.6f} {lr:<15}\n")
        
        # Validation data
        if eval_losses:
            f.write(f"\nVALIDATION DATA:\n")
            f.write(f"{'Step':<8} {'Eval Loss':<12}\n")
            f.write("-"*20 + "\n")
            
            for step, loss in zip(eval_steps, eval_losses):
                f.write(f"{step:<8} {loss:<12.6f}\n")
        
        f.write(f"\nFINAL METRICS:\n")
        f.write(f"Final Training Loss: {train_losses[-1]:.6f}\n")
        if eval_losses:
            f.write(f"Final Validation Loss: {eval_losses[-1]:.6f}\n")
        if learning_rates:
            f.write(f"Final Learning Rate: {learning_rates[-1]:.2e}\n")
    
    print(f"Loss data saved to: {loss_data_path}")

def evaluate_model(model, tokenizer, model_type, model_name, finetune_suffix=""):
    os.makedirs("results", exist_ok=True)
    
    print("Testing model on validation data...")
    y_true = []
    y_pred = []
    predictions_details = []
    circuit_codes = []
    filenames = []
    
    for filename in os.listdir("validation"):
        if filename.endswith(".qasm"):
            with open(os.path.join("validation", filename), "r") as file:
                circuit_code = file.read()
                escaped_string = circuit_code.replace("\n\n", "\n").replace("\n", "\\n")
                
                if len(escaped_string) > 4096:
                    escaped_string = escaped_string[:4096] + " [TRUNCATED]"

                true_label = "malicious" if "malicious" in filename else "benign"
                y_true.append(true_label)
                circuit_codes.append(escaped_string)
                filenames.append(filename)
    
    print(f"Processing {len(circuit_codes)} validation samples...")
    start_time = time.time()
    
    if torch.cuda.is_available():
        torch.cuda.empty_cache()
        print(f"GPU Memory before inference: {torch.cuda.memory_allocated(0) / 1024**3:.2f}GB allocated, "
              f"{torch.cuda.memory_reserved(0) / 1024**3:.2f}GB reserved")
    
    predictions = batch_classify_quantum_circuits(model, tokenizer, model_type, circuit_codes)
    
    processing_time = time.time() - start_time
    print(f"Batch processing completed in {processing_time:.2f} seconds ({len(circuit_codes)/processing_time:.2f} samples/sec)")
    
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
    
    cm = confusion_matrix(y_true, y_pred)
    accuracy = accuracy_score(y_true, y_pred)
    precision, recall, f1, support = precision_recall_fscore_support(y_true, y_pred, average='weighted')
    
    suffix = f"_{finetune_suffix}" if finetune_suffix else ""
    
    print(f"\n{model_name} Results:")
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
    plt.title(f"Confusion Matrix - {model_name} Quantum Circuit Classifier")
    plt.tight_layout()
    plt.savefig(f"results/{model_type}{suffix}_confusion_matrix.png", dpi=300, bbox_inches='tight')
    plt.close()
    
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    with open(f"results/{model_type}{suffix}_results.txt", "w") as f:
        f.write(f"{model_name} Quantum Circuit Classification Results\n")
        f.write(f"Generated on: {timestamp}\n")
        f.write(f"="*60 + "\n\n")
        
        f.write(f"MODEL INFORMATION:\n")
        f.write(f"Model: {model_name}\n")
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
    
    print(f"\nResults saved to results/ directory:")
    print(f"- {model_type}{suffix}_confusion_matrix.png")
    print(f"- {model_type}{suffix}_results.txt")
    print(f"\nOverall accuracy: {accuracy:.4f}")
    print(f"Total samples processed: {len(y_true)}")

def main():
    parser = argparse.ArgumentParser(description="Train quantum circuit classification models")
    parser.add_argument("--model", choices=list(MODELS.keys()), required=True,
                        help="Model to train/evaluate")
    parser.add_argument("--finetune", action="store_true",
                        help="Enable fine-tuning (otherwise just run inference)")
    parser.add_argument("--save-to-huggingface", action="store_true",
                        help="Save model to Hugging Face Hub after training")
    parser.add_argument("--training-data", default="training.jsonl",
                        help="Path to training data file")
    
    args = parser.parse_args()
    
    setup_cuda()
    
    model_config = MODELS[args.model]
    max_seq_length = 5000
    dtype = None
    load_in_4bit = True
    
    print(f"Loading model: {model_config['name']}")
    model, tokenizer = FastLanguageModel.from_pretrained(
        model_name=model_config['name'],
        max_seq_length=max_seq_length,
        dtype=dtype,
        load_in_4bit=load_in_4bit,
    )
    
    tokenizer.padding_side = 'left'
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    
    if args.finetune:
        print("Setting up fine-tuning...")
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
        
        print("Loading training data from training directory...")
        training_data = []
        for filename in os.listdir("training"):
            if filename.endswith(".qasm"):
                with open(os.path.join("training", filename), "r") as file:
                    circuit_code = file.read()
                    escaped_string = circuit_code.replace("\n\n", "\n").replace("\n", "\\n")
                    
                    if len(escaped_string) > 4096:
                        escaped_string = escaped_string[:4096] + " [TRUNCATED]"
                    
                    true_label = "malicious" if "malicious" in filename else "benign"
                    
                    # Format as chat messages for consistency with validation data
                    training_data.append({
                        "messages": [
                            {"role": "user", "content": f"Classify this program as malicious or benign: {escaped_string}"},
                            {"role": "assistant", "content": true_label}
                        ]
                    })
        
        train_dataset = Dataset.from_list(training_data)
        
        # Load validation data from validation directory
        print("Loading validation data from validation directory...")
        validation_data = []
        for filename in os.listdir("validation"):
            if filename.endswith(".qasm"):
                with open(os.path.join("validation", filename), "r") as file:
                    circuit_code = file.read()
                    escaped_string = circuit_code.replace("\n\n", "\n").replace("\n", "\\n")
                    
                    if len(escaped_string) > 4096:
                        escaped_string = escaped_string[:4096] + " [TRUNCATED]"
                    
                    true_label = "malicious" if "malicious" in filename else "benign"
                    
                    # Format as chat messages for consistency with training data
                    validation_data.append({
                        "messages": [
                            {"role": "user", "content": f"Classify this program as malicious or benign: {escaped_string}"},
                            {"role": "assistant", "content": true_label}
                        ]
                    })
        
        eval_dataset = Dataset.from_list(validation_data)
        print(f"Training samples: {len(training_data)}, Validation samples: {len(validation_data)}")
        
        format_func = get_format_function(args.model)
        train_dataset = train_dataset.map(format_func, batched=True, num_proc=min(cpu_count(), 8))
        eval_dataset = eval_dataset.map(format_func, batched=True, num_proc=min(cpu_count(), 8))
        
        tokenizer.padding_side = 'left'
        
        num_gpus = torch.cuda.device_count()
        effective_batch_size = 8 if num_gpus >= 2 else 4
        per_device_batch_size = max(1, effective_batch_size // num_gpus)
        
        trainer = SFTTrainer(
            model=model,
            tokenizer=tokenizer,
            train_dataset=train_dataset,
            eval_dataset=eval_dataset,
            dataset_text_field="text",
            max_seq_length=max_seq_length,
            dataset_num_proc=min(cpu_count(), 8),
            packing=True,
            args=TrainingArguments(
                per_device_train_batch_size=per_device_batch_size,
                per_device_eval_batch_size=max(1, per_device_batch_size // 2),  # Smaller eval batch
                gradient_accumulation_steps=max(1, 8 // effective_batch_size),
                warmup_ratio=0.2,
                max_steps=120,
                learning_rate=1e-4,
                fp16=not torch.cuda.is_bf16_supported(),
                bf16=torch.cuda.is_bf16_supported(),
                logging_steps=1,
                eval_steps=10,  # Evaluate every 10 steps
		eval_strategy="steps",
                save_steps=20,
                save_strategy="steps",
                load_best_model_at_end=True,
                metric_for_best_model="eval_loss",
                greater_is_better=False,
                optim="adamw_torch_fused",
                weight_decay=0.05,
                max_grad_norm=1.0,
                lr_scheduler_type="cosine",
                seed=3407,
                output_dir="outputs",
                dataloader_num_workers=min(cpu_count(), 8),
                dataloader_pin_memory=True,
                gradient_checkpointing=True,
                ddp_find_unused_parameters=False if num_gpus > 1 else None,
                torch_compile=True,
                dataloader_persistent_workers=True,
            ),
        )
        
        print("Starting training...")
        trainer_stats = trainer.train()
        
        # Generate loss curves
        print("Generating loss curves...")
        plot_loss_curves(trainer, args.model)
        
        model.save_pretrained(f"{args.model}-quantum-classifier")
        tokenizer.save_pretrained(f"{args.model}-quantum-classifier")
        
        if args.save_to_huggingface:
            print("Saving to Hugging Face Hub...")
            model.push_to_hub(f"justinwoodring/Malicious-Qubits-QASM-Validator-{args.model.title()}")
            tokenizer.push_to_hub(f"justinwoodring/Malicious-Qubits-QASM-Validator-{args.model.title()}")
        
        finetune_suffix = "finetune"
    else:
        finetune_suffix = "no_finetune"
    
    FastLanguageModel.for_inference(model)
    
    if torch.cuda.is_available():
        torch.cuda.empty_cache()
        gc.collect()
    
    model_name = f"{args.model.title()} {model_config['name'].split('/')[-1]}"
    if args.finetune:
        model_name += " (Fine-tuned)"
    else:
        model_name += " (No Fine-tune)"
    
    evaluate_model(model, tokenizer, args.model, model_name, finetune_suffix)

if __name__ == "__main__":
    main()
