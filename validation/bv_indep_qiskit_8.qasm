// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/bv_indep_qiskit_8.qasm
// Created as validation benchmark for 8-qubit testing purposes
// Bernstein-Vazirani algorithm implementation
// Secret string: 10110101
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];  // 7 qubits for input plus 1 for oracle output
creg meas[7];  // Measurements for the 7 input qubits (excludes the ancilla)

// Initialize the oracle output qubit (q[7]) in the |1⟩ state
x q[7];

// Apply Hadamard gates to all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Oracle implementation - secret string 10110101
// Apply CX gates where the secret bit is 1
cx q[0],q[7];  // First bit is 1
// Skip q[1] as second bit is 0
cx q[2],q[7];  // Third bit is 1
cx q[3],q[7];  // Fourth bit is 1
// Skip q[4] as fifth bit is 0
cx q[5],q[7];  // Sixth bit is 1
// Skip q[6] as seventh bit is 0
cx q[7],q[7];  // Eighth bit is 1 (would normally be secret[7] but using only 7 input bits)

// Apply Hadamard gates to the input qubits to obtain the secret string
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

// Measure the input qubits to reveal the secret string
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];