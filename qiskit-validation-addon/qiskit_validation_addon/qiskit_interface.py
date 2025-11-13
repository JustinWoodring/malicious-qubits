from typing import Any, Union
from pathlib import Path
from qiskit import qasm2
from .classifier import classify_quantum_circuit, ClassificationResult


def classify_qiskit_circuit(circuit: Any) -> ClassificationResult:
    """
    Accepts a Qiskit QuantumCircuit object, dumps its QASM2 representation,
    and classifies it as 'Malicious' or 'Benign' using chunked analysis.

    Args:
        circuit: Qiskit QuantumCircuit object

    Returns:
        ClassificationResult with label, chunk statistics, and raw response
    """
    try:
        # Qiskit >= 0.45 uses qasm2 exporter
        qasm_str = qasm2.dumps(circuit)
    except Exception:
        # Fallback for older Qiskit versions
        qasm_str = circuit.qasm()
    return classify_quantum_circuit(qasm_str)


def classify_qasm_file(file_path: Union[str, Path]) -> ClassificationResult:
    """
    Load a QASM file and classify it as 'Malicious' or 'Benign' using chunked analysis.

    This function reads a QASM file from disk, chunks it into 4096-token segments,
    and classifies each chunk. If ANY chunk is classified as malicious, the entire
    circuit is marked as malicious.

    Args:
        file_path: Path to the QASM file (.qasm extension)

    Returns:
        ClassificationResult with label, chunk statistics, and raw response

    Raises:
        FileNotFoundError: If the file does not exist
        IOError: If the file cannot be read
    """
    file_path = Path(file_path)

    if not file_path.exists():
        raise FileNotFoundError(f"QASM file not found: {file_path}")

    if not file_path.is_file():
        raise IOError(f"Path is not a file: {file_path}")

    # Read the QASM file
    with open(file_path, 'r') as f:
        qasm_code = f.read()

    # Classify using chunked analysis
    return classify_quantum_circuit(qasm_code)
