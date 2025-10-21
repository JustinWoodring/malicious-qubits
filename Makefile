# Makefile for quantum circuit classification models
# Based on train.py supported models: llama, qwen, mistral, seedcoder

.PHONY: all clean help \
	llama-finetune llama-no-finetune \
	qwen-finetune qwen-no-finetune \
	mistral-finetune mistral-no-finetune \
	seedcoder-finetune seedcoder-no-finetune \
	all-finetune all-no-finetune

# Default target
all: all-finetune all-no-finetune

# Help target
help:
	@echo "Available targets:"
	@echo "  all                    - Run all classifiers (both finetune and no-finetune)"
	@echo "  all-finetune          - Run all classifiers with fine-tuning"
	@echo "  all-no-finetune       - Run all classifiers without fine-tuning"
	@echo ""
	@echo "Individual model targets:"
	@echo "  llama-finetune        - Run LLaMA with fine-tuning"
	@echo "  llama-no-finetune     - Run LLaMA without fine-tuning"
	@echo "  qwen-finetune         - Run Qwen with fine-tuning"
	@echo "  qwen-no-finetune      - Run Qwen without fine-tuning"
	@echo "  mistral-finetune      - Run Mistral with fine-tuning"
	@echo "  mistral-no-finetune   - Run Mistral without fine-tuning"
	@echo "  seedcoder-finetune    - Run SeedCoder with fine-tuning"
	@echo "  seedcoder-no-finetune - Run SeedCoder without fine-tuning"
	@echo ""
	@echo "  clean                 - Remove all output directories and result files"

# Finetune targets
llama-finetune:
	python train.py --model llama --finetune

qwen-finetune:
	python train.py --model qwen --finetune

mistral-finetune:
	python train.py --model mistral --finetune

seedcoder-finetune:
	python train.py --model seedcoder --finetune

# No-finetune targets
llama-no-finetune:
	python train.py --model llama

qwen-no-finetune:
	python train.py --model qwen

mistral-no-finetune:
	python train.py --model mistral

seedcoder-no-finetune:
	python train.py --model seedcoder

# Batch targets
all-finetune: llama-finetune qwen-finetune mistral-finetune seedcoder-finetune

all-no-finetune: llama-no-finetune qwen-no-finetune mistral-no-finetune seedcoder-no-finetune

# Clean target - removes outputs and results
clean:
	@echo "Cleaning output directories and result files..."
	rm -rf outputs/
	rm -rf results/
	rm -rf llama-quantum-classifier/
	rm -rf qwen-quantum-classifier/
	rm -rf mistral-quantum-classifier/
	rm -rf seedcoder-quantum-classifier/
	@echo "Clean complete."