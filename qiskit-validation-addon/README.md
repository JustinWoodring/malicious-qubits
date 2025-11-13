# Qiskit Validation Addon

Production-ready Python package for detecting malicious quantum circuits using fine-tuned Large Language Models with chunked analysis support.

## Features

- **Chunked Analysis**: Automatically splits large QASM circuits into 4096-token chunks for processing
- **Aggregate Classification**: Uses ANY-malicious logic (if any chunk is malicious, the circuit is malicious)
- **PEFT Adapter Loading**: Loads fine-tuned models from HuggingFace using Unsloth framework
- **Multiple Input Formats**: Support for QASM files, QASM strings, and Qiskit QuantumCircuit objects
- **Detailed Results**: Returns classification label with chunk-level statistics

## Installation

```bash
cd qiskit-validation-addon
pip install -e .
```

## Requirements

- Python 3.8+
- PyTorch
- Transformers
- Unsloth
- Qiskit (for QuantumCircuit support)

## Usage

### Classify a QASM File

```python
from qiskit_validation_addon import classify_qasm_file

# Load and classify a QASM file with automatic chunking
result = classify_qasm_file("path/to/circuit.qasm")

print(f"Classification: {result.label}")  # "Malicious" or "Benign"
print(f"Malicious Chunks: {result.malicious_chunks}/{result.total_chunks}")
print(f"Chunk Ratio: {result.malicious_chunk_ratio:.2%}")
print(f"Details: {result.raw_response}")
```

### Classify QASM String Directly

```python
from qiskit_validation_addon import classify_quantum_circuit

qasm_code = """
OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
creg c[2];
h q[0];
cx q[0],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
"""

result = classify_quantum_circuit(qasm_code)
print(f"Classification: {result.label}")
```

### Classify Qiskit QuantumCircuit

```python
from qiskit import QuantumCircuit
from qiskit_validation_addon import classify_qiskit_circuit

# Create a quantum circuit
qc = QuantumCircuit(2, 2)
qc.h(0)
qc.cx(0, 1)
qc.measure([0, 1], [0, 1])

# Classify the circuit
result = classify_qiskit_circuit(qc)
print(f"Classification: {result.label}")
```

## How It Works

### Chunked Analysis

For variable-length circuits that exceed the model's 4096-token context window:

1. **Tokenization**: The QASM code is tokenized using the model's tokenizer
2. **Chunking**: Tokens are split into 4096-token segments
3. **Classification**: Each chunk is classified independently
4. **Aggregation**: If ANY chunk is classified as malicious, the entire circuit is marked as malicious

This approach ensures:
- No information is lost due to truncation
- Large circuits can be analyzed completely
- Conservative security posture (favors false positives over false negatives)

### Model Architecture

The package uses PEFT (Parameter-Efficient Fine-Tuning) adapters over base code-specialized models:

- **Default Model**: `justinwoodring/Malicious-Qubits-QASM-Validator-Qwen-7B`
- **Base**: Qwen2.5-Coder-7B with 4-bit quantization
- **Fine-tuning**: LoRA adapters trained on 1,500 quantum circuits
- **Performance**: 92.67% accuracy on standard circuits, 76.67% on variable-length circuits

### Attack Detection

The model is trained to detect three categories of quantum malware:

1. **Shuttling Attacks**: Excessive SWAP operations degrading calibration
2. **Immediate Measurement**: Premature measurements causing information leakage
3. **Mixed Attacks**: Combination of both attack patterns

## ClassificationResult Object

```python
@dataclass
class ClassificationResult:
    label: str                    # "Malicious" or "Benign"
    raw_response: str             # Raw model output / chunk summary
    malicious_chunks: int         # Number of malicious chunks detected
    total_chunks: int             # Total number of chunks processed
    malicious_chunk_ratio: float  # Ratio of malicious chunks (0.0 to 1.0)
```

## Custom Models

You can use different models by specifying the HuggingFace repository:

```python
from qiskit_validation_addon.classifier import get_classifier

# Initialize with custom model
classifier = get_classifier(
    model_name="your-username/your-model-name",
    model_type="qwen"  # or "mistral", "llama", "seedcoder"
)

# Use the custom classifier
result = classifier.classify_with_chunking(qasm_code)
```

## Testing

Run the test script:

```bash
python test_addon.py
```

## Performance Characteristics

- **Standard Circuits**: ~1.04 seconds per circuit
- **Chunked Circuits**: Processing time scales linearly with number of chunks
- **Detection Rate**: 96.1% (malicious circuits), 90.9% (benign circuits)
- **False Positive Rate**: 9.1%
- **False Negative Rate**: 3.9%

## Security Model

The package implements static analysis of QASM code. This is necessary because:

- Dynamic analysis would collapse quantum superposition through measurement
- Static analysis is the only non-destructive approach for quantum circuits
- Pre-execution validation prevents malicious circuits from running

## Dataset Attribution

- **Benign Circuits**: MQTBench benchmark suite ([arXiv:2402.13352](https://arxiv.org/abs/2402.13352))
- **Malicious Patterns**: Synthetically generated based on documented quantum attack research
- **Usage**: Research and defensive security purposes only

## Citation

If you use this package in research, please cite:

N/A

## License

See the main repository for license information.

## Support

For issues, questions, or contributions, please refer to the main MaliciousQubits repository.
