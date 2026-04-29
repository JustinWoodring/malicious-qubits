# Bad Qubits - Home of `qiskit_validation_addon`

- Python package is in `qiskit_validation_addon`
- Finetuning and nonfinetuning workflows with models in respective `train.py` files.
- Testing data in `testing/`
- Training data in `training/`
- Validation data in `validation/`
- See a working example in `examples/`

## Using the python package
```python
from qiskit_validation_addon import classify_quantum_circuit

result = classify_quantum_circuit("""
OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
creg c[2];
h q[0];
cx q[0],q[1];
measure q[0] -> c[0];
measure q[1] -> c[1];
""")
print(result.label)  # "Bad" or "Benign"
print(result.raw_response)  # Raw model output
```

# THIS WORK IS BASED AN AUGMENTED DATASET BASED ON https://arxiv.org/abs/2402.13352
