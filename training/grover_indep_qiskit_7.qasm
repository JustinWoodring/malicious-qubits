// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/grover_indep_qiskit_7.qasm
// Created as validation benchmark for 7-qubit testing purposes
// Grover's algorithm implementation for 2 qubits with 3-bit solution (110)
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];  // 3 for search space, 1 for oracle ancilla, 3 for diffusion
creg meas[3];

// Initialize search space to superposition
h q[0];
h q[1];
h q[2];

// Initialize oracle ancilla in |-> state
x q[3];
h q[3];

// Oracle for target state |110⟩
x q[2];  // Flip the 0-bit
cx q[0],q[3];  // Apply CNOT for 1-bits
cx q[1],q[3];
x q[2];  // Unflip the 0-bit

// Diffusion operator (Grover's diffusion)
h q[0];
h q[1];
h q[2];
x q[0];
x q[1];
x q[2];

// Use auxiliary qubits for multi-controlled Z
h q[4];
ccx q[0],q[1],q[4];
ccx q[4],q[2],q[5];
ccx q[0],q[1],q[4];
ccx q[4],q[2],q[5];
h q[4];

// Uncompute multi-controlled Z
x q[0];
x q[1];
x q[2];
h q[0];
h q[1];
h q[2];

// Second iteration of Grover - Oracle
x q[2];  // Flip the 0-bit
cx q[0],q[3];  // Apply CNOT for 1-bits
cx q[1],q[3];
x q[2];  // Unflip the 0-bit

// Second iteration - Diffusion
h q[0];
h q[1];
h q[2];
x q[0];
x q[1];
x q[2];

// Use auxiliary qubits for multi-controlled Z
h q[6];
ccx q[0],q[1],q[6];
ccx q[6],q[2],q[5];
ccx q[0],q[1],q[6];
ccx q[6],q[2],q[5];
h q[6];

// Uncompute multi-controlled Z
x q[0];
x q[1];
x q[2];
h q[0];
h q[1];
h q[2];

// Measure the search register
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];