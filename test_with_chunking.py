#!/usr/bin/env python3

import os
import json
import torch
import argparse
from transformers import AutoTokenizer, AutoModelForCausalLM
from sklearn.metrics import confusion_matrix, classification_report, accuracy_score, precision_recall_fscore_support
import matplotlib.pyplot as plt
import seaborn as sns
from datetime import datetime

def chunk_text(text, max_tokens=4096, tokenizer=None):
    """Split text into chunks of approximately max_tokens"""
    if tokenizer is None:
        # Rough approximation: 1 token ≈ 4 characters
        max_chars = max_tokens * 4
        chunks = []
        for i in range(0, len(text), max_chars):
            chunks.append(text[i:i + max_chars])
        return chunks
    else:
        # Use actual tokenizer for precise chunking
        tokens = tokenizer.encode(text)
        chunks = []
        for i in range(0, len(tokens), max_tokens):
            chunk_tokens = tokens[i:i + max_tokens]
            chunk_text = tokenizer.decode(chunk_tokens, skip_special_tokens=True)
            chunks.append(chunk_text)
        return chunks

def create_inference_prompt(model_type, code):
    """Create inference prompt based on model type"""
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

def classify_chunk(model, tokenizer, model_type, chunk):
    """Classify a single chunk of code"""
    prompt = create_inference_prompt(model_type, chunk)
    
    inputs = tokenizer(
        prompt,
        return_tensors="pt",
        max_length=10000,
        truncation=True,
        padding=True,
        add_special_tokens=False
    )
    
    if torch.cuda.is_available():
        inputs = inputs.to("cuda")
    
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
    
    input_length = len(inputs.input_ids[0])
    response = tokenizer.decode(outputs[0][input_length:], skip_special_tokens=True)
    
    return "malicious" in response.lower()

def test_sample_with_chunking(model, tokenizer, model_type, content, filename):
    """Test a complete sample by chunking it and checking if any chunk is malicious"""
    # Chunk the content
    chunks = chunk_text(content, max_tokens=4096, tokenizer=tokenizer)
    
    malicious_chunks = 0
    total_chunks = len(chunks)
    
    print(f"  Processing {filename}: {total_chunks} chunks", end="", flush=True)
    
    for i, chunk in enumerate(chunks):
        if classify_chunk(model, tokenizer, model_type, chunk):
            malicious_chunks += 1
        print(".", end="", flush=True)
    
    # Sample is malicious if ANY chunk is classified as malicious
    is_malicious = malicious_chunks > 0
    
    print(f" -> {'MALICIOUS' if is_malicious else 'BENIGN'} ({malicious_chunks}/{total_chunks} malicious chunks)")
    
    return is_malicious, malicious_chunks, total_chunks

def run_comprehensive_testing(model_path, model_type):
    """Run comprehensive testing on all samples in testing directory"""
    print(f"Loading model from {model_path}...")
    
    # Load model and tokenizer
    tokenizer = AutoTokenizer.from_pretrained(model_path)
    model = AutoModelForCausalLM.from_pretrained(
        model_path,
        torch_dtype=torch.float16 if torch.cuda.is_available() else torch.float32,
        device_map="auto" if torch.cuda.is_available() else None
    )
    
    if tokenizer.pad_token is None:
        tokenizer.pad_token = tokenizer.eos_token
    
    # Process all files in testing directory
    testing_files = [f for f in os.listdir("testing") if f.endswith('.qasm')]
    
    print(f"Found {len(testing_files)} test samples")
    
    results = []
    y_true = []
    y_pred = []
    
    for filename in testing_files:
        filepath = os.path.join("testing", filename)
        
        # Read file content
        with open(filepath, 'r') as f:
            content = f.read()
        
        # Determine true label from filename
        true_label = "malicious" if "malicious" in filename else "benign"
        
        # Test with chunking
        is_malicious, malicious_chunks, total_chunks = test_sample_with_chunking(
            model, tokenizer, model_type, content, filename
        )
        
        predicted_label = "malicious" if is_malicious else "benign"
        
        results.append({
            'filename': filename,
            'true_label': true_label,
            'predicted_label': predicted_label,
            'correct': true_label == predicted_label,
            'malicious_chunks': malicious_chunks,
            'total_chunks': total_chunks,
            'malicious_chunk_ratio': malicious_chunks / total_chunks if total_chunks > 0 else 0
        })
        
        y_true.append(true_label)
        y_pred.append(predicted_label)
    
    # Generate metrics
    cm = confusion_matrix(y_true, y_pred)
    accuracy = accuracy_score(y_true, y_pred)
    precision, recall, f1, support = precision_recall_fscore_support(y_true, y_pred, average='weighted')
    
    # Create results directory
    os.makedirs("results", exist_ok=True)
    
    # Plot confusion matrix
    plt.figure(figsize=(10, 8))
    sns.heatmap(cm, annot=True, fmt="d", cmap="Blues", 
                xticklabels=["benign", "malicious"], 
                yticklabels=["benign", "malicious"])
    plt.xlabel("Predicted Label")
    plt.ylabel("True Label")
    plt.title(f"Confusion Matrix - {model_type} Chunked Testing")
    plt.tight_layout()
    plt.savefig(f"results/{model_type}_chunked_testing_confusion_matrix.png", dpi=300, bbox_inches='tight')
    plt.close()
    
    # Save detailed results
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    with open(f"results/{model_type}_chunked_testing_results.txt", "w") as f:
        f.write(f"{model_type} Chunked Testing Results\n")
        f.write(f"Generated on: {timestamp}\n")
        f.write(f"="*60 + "\n\n")
        
        f.write(f"MODEL INFORMATION:\n")
        f.write(f"Model Path: {model_path}\n")
        f.write(f"Model Type: {model_type}\n")
        f.write(f"Testing Method: Full sample chunking (4096 tokens per chunk)\n")
        f.write(f"Classification Logic: Sample malicious if ANY chunk is malicious\n\n")
        
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
        f.write(classification_report(y_true, y_pred))
        f.write(f"\n\nTESTING STATISTICS:\n")
        f.write(f"Total test samples: {len(results)}\n")
        f.write(f"Correct predictions: {sum(1 for r in results if r['correct'])}\n")
        f.write(f"Incorrect predictions: {sum(1 for r in results if not r['correct'])}\n")
        
        total_chunks = sum(r['total_chunks'] for r in results)
        total_malicious_chunks = sum(r['malicious_chunks'] for r in results)
        f.write(f"Total chunks processed: {total_chunks}\n")
        f.write(f"Total malicious chunks found: {total_malicious_chunks}\n")
        f.write(f"Malicious chunk ratio: {total_malicious_chunks/total_chunks:.4f}\n\n")
        
        f.write(f"DETAILED RESULTS:\n")
        f.write(f"{'Filename':<40} {'True':<10} {'Predicted':<10} {'Correct':<8} {'Mal/Total Chunks':<15} {'Chunk Ratio':<12}\n")
        f.write(f"-"*110 + "\n")
        for result in results:
            f.write(f"{result['filename']:<40} {result['true_label']:<10} {result['predicted_label']:<10} "
                   f"{'✓' if result['correct'] else '✗':<8} "
                   f"{result['malicious_chunks']}/{result['total_chunks']:<13} "
                   f"{result['malicious_chunk_ratio']:<12.4f}\n")
    
    print(f"\nTesting completed!")
    print(f"Overall accuracy: {accuracy:.4f}")
    print(f"Results saved to results/{model_type}_chunked_testing_results.txt")
    print(f"Confusion matrix saved to results/{model_type}_chunked_testing_confusion_matrix.png")

def main():
    parser = argparse.ArgumentParser(description="Test quantum circuit classification models with chunking")
    parser.add_argument("--model-path", required=True, help="Path to the fine-tuned model")
    parser.add_argument("--model-type", choices=["llama", "qwen", "mistral", "seedcoder"], required=True,
                        help="Type of model being tested")
    
    args = parser.parse_args()
    
    if not os.path.exists("testing"):
        print("ERROR: testing directory not found. Please run dataset_processor.py first.")
        return
    
    if not os.path.exists(args.model_path):
        print(f"ERROR: Model path {args.model_path} not found.")
        return
    
    run_comprehensive_testing(args.model_path, args.model_type)

if __name__ == "__main__":
    main()
