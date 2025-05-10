// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/dj_indep_qiskit_5.qasm
// Created as validation benchmark for 5-qubit testing purposes
// Deutsch-Jozsa algorithm implementation for a balanced function
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[5];  // 4 for input register, 1 for output qubit
creg meas[4];

// Initialize output qubit to |1⟩
x q[4];

// Apply Hadamard gates to all qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

// Oracle implementation for a balanced function
// This oracle applies X gates to the output qubit conditionally
// We'll use a pattern that makes half the inputs give 0 and half give 1
cx q[0],q[4];
cx q[2],q[4];

// Apply Hadamard gates to the input register
h q[0];
h q[1];
h q[2];
h q[3];

// Measure the input register
barrier q;
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];