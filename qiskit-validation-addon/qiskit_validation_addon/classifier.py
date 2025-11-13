#!/usr/bin/env python3

import torch
from dataclasses import dataclass
from typing import List, Optional
from unsloth import FastLanguageModel


@dataclass
class ClassificationResult:
    """Result of quantum circuit classification"""
    label: str  # "Malicious" or "Benign"
    raw_response: str
    malicious_chunks: int = 0
    total_chunks: int = 1
    malicious_chunk_ratio: float = 0.0


class QuantumCircuitClassifier:
    """Quantum circuit classifier with chunking support"""

    # Default HuggingFace model (PEFT adapter)
    DEFAULT_MODEL_NAME = "justinwoodring/Malicious-Qubits-QASM-Validator-Qwen-7B"
    DEFAULT_MODEL_TYPE = "qwen"
    DEFAULT_MAX_SEQ_LENGTH = 5000

    def __init__(self, model_name: Optional[str] = None, model_type: Optional[str] = None):
        """
        Initialize the classifier with a fine-tuned PEFT model from HuggingFace.

        Args:
            model_name: HuggingFace model name (PEFT adapter) or local path
            model_type: Type of model (qwen, mistral, llama, seedcoder)
        """
        self.model_name = model_name or self.DEFAULT_MODEL_NAME
        self.model_type = model_type or self.DEFAULT_MODEL_TYPE
        self.model = None
        self.tokenizer = None
        self._load_model()

    def _load_model(self):
        """Load the PEFT model and tokenizer using Unsloth"""
        print(f"Loading PEFT adapter from {self.model_name}...")

        # Load model with PEFT adapter using Unsloth
        self.model, self.tokenizer = FastLanguageModel.from_pretrained(
            model_name=self.model_name,
            max_seq_length=self.DEFAULT_MAX_SEQ_LENGTH,
            dtype=None,  # Auto-detect
            load_in_4bit=True,  # Use 4-bit quantization
        )

        # Set model to inference mode
        FastLanguageModel.for_inference(self.model)

        # Configure tokenizer
        self.tokenizer.padding_side = 'left'
        if self.tokenizer.pad_token is None:
            self.tokenizer.pad_token = self.tokenizer.eos_token

        print("Model loaded successfully!")

    def chunk_text(self, text: str, max_tokens: int = 4096) -> List[str]:
        """
        Split text into chunks of approximately max_tokens.

        Args:
            text: The QASM code to chunk
            max_tokens: Maximum tokens per chunk (default: 4096)

        Returns:
            List of text chunks
        """
        # Use actual tokenizer for precise chunking
        tokens = self.tokenizer.encode(text)
        chunks = []

        for i in range(0, len(tokens), max_tokens):
            chunk_tokens = tokens[i:i + max_tokens]
            chunk_text = self.tokenizer.decode(chunk_tokens, skip_special_tokens=True)
            chunks.append(chunk_text)

        return chunks

    def create_inference_prompt(self, code: str) -> str:
        """
        Create inference prompt based on model type.

        Args:
            code: The QASM code to classify

        Returns:
            Formatted prompt string
        """
        if self.model_type == "llama":
            return f"<|start_header_id|>user<|end_header_id|>\n\nClassify this program as malicious or benign: {code}<|eot_id|><|start_header_id|>assistant<|end_header_id|>\n\n"
        elif self.model_type == "qwen":
            return f"<|user|>\nClassify this program as malicious or benign: {code}<|endoftext|>\n<|assistant|>\n"
        elif self.model_type == "mistral":
            return f"<s>[INST] Classify this program as malicious or benign: {code} [/INST]"
        elif self.model_type == "seedcoder":
            return f"<|begin_of_text|><|start_header_id|>user<|end_header_id|>\n\nClassify this program as malicious or benign: {code}<|eot_id|><|start_header_id|>assistant<|end_header_id|>\n\n"
        else:
            raise ValueError(f"Unsupported model type: {self.model_type}")

    def classify_chunk(self, chunk: str) -> bool:
        """
        Classify a single chunk of code.

        Args:
            chunk: Text chunk to classify

        Returns:
            True if malicious, False if benign
        """
        prompt = self.create_inference_prompt(chunk)

        inputs = self.tokenizer(
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
            outputs = self.model.generate(
                input_ids=inputs.input_ids,
                attention_mask=inputs.attention_mask,
                max_new_tokens=8,
                use_cache=False,
                do_sample=False,
                pad_token_id=self.tokenizer.pad_token_id,
                num_beams=1,
            )

        input_length = len(inputs.input_ids[0])
        response = self.tokenizer.decode(outputs[0][input_length:], skip_special_tokens=True)

        return "malicious" in response.lower()

    def classify_with_chunking(self, qasm_code: str) -> ClassificationResult:
        """
        Classify QASM code by chunking it and checking if any chunk is malicious.

        Args:
            qasm_code: The QASM code to classify

        Returns:
            ClassificationResult with detailed classification information
        """
        # Chunk the content
        chunks = self.chunk_text(qasm_code, max_tokens=4096)

        malicious_chunks = 0
        total_chunks = len(chunks)

        # Classify each chunk
        for chunk in chunks:
            if self.classify_chunk(chunk):
                malicious_chunks += 1

        # Sample is malicious if ANY chunk is classified as malicious
        is_malicious = malicious_chunks > 0

        label = "Malicious" if is_malicious else "Benign"
        malicious_ratio = malicious_chunks / total_chunks if total_chunks > 0 else 0.0

        return ClassificationResult(
            label=label,
            raw_response=f"{malicious_chunks}/{total_chunks} chunks classified as malicious",
            malicious_chunks=malicious_chunks,
            total_chunks=total_chunks,
            malicious_chunk_ratio=malicious_ratio
        )


# Global classifier instance (lazy-loaded)
_classifier_instance = None


def get_classifier(model_name: Optional[str] = None, model_type: Optional[str] = None) -> QuantumCircuitClassifier:
    """
    Get or create the global classifier instance.

    Args:
        model_name: HuggingFace model name (PEFT adapter) or local path
        model_type: Type of model (qwen, mistral, llama, seedcoder)

    Returns:
        QuantumCircuitClassifier instance
    """
    global _classifier_instance

    if _classifier_instance is None:
        _classifier_instance = QuantumCircuitClassifier(model_name, model_type)

    return _classifier_instance


def classify_quantum_circuit(qasm_code: str) -> ClassificationResult:
    """
    Classify a QASM quantum circuit as malicious or benign using chunked analysis.

    This is the main entry point for classification. It uses chunking to handle
    variable-length circuits and aggregates predictions (ANY chunk malicious → circuit malicious).

    Args:
        qasm_code: The QASM code as a string

    Returns:
        ClassificationResult with label, chunk statistics, and raw response
    """
    classifier = get_classifier()
    return classifier.classify_with_chunking(qasm_code)
