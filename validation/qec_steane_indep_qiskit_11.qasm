// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qec_steane_indep_qiskit_11.qasm
// Created as validation benchmark for 11-qubit testing purposes
// Steane [[7,1,3]] Quantum Error Correction Code with syndrome measurement
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[11];  // 7 data qubits + 4 ancilla qubits for syndrome extraction
creg syndrome[4];
creg data[7];

// Initialize logical qubit in |+⟩ state
h q[0];  // This is the logical qubit state we want to protect

// Encode into Steane [[7,1,3]] code
// First, distribute the state to create |+⟩L
h q[1];
h q[2];
h q[3];
cx q[0],q[4];
cx q[1],q[4];
cx q[2],q[4];
cx q[0],q[5];
cx q[1],q[5];
cx q[3],q[5];
cx q[0],q[6];
cx q[2],q[6];
cx q[3],q[6];

// Apply X error for testing (bit flip on q[4])
x q[4];

// Z-type stabilizer measurements (detect X errors)
// Initialize ancilla qubits for Z stabilizers
h q[7];
h q[8];
h q[9];

// Apply CNOT gates from data to ancilla for Z stabilizers
cx q[0],q[7];
cx q[2],q[7];
cx q[4],q[7];
cx q[6],q[7];

cx q[1],q[8];
cx q[2],q[8];
cx q[5],q[8];
cx q[6],q[8];

cx q[3],q[9];
cx q[4],q[9];
cx q[5],q[9];
cx q[6],q[9];

// Measure Z-type stabilizers
h q[7];
h q[8];
h q[9];
measure q[7] -> syndrome[0];
measure q[8] -> syndrome[1];
measure q[9] -> syndrome[2];

// X-type stabilizer measurements (detect Z errors)
// Initialize ancilla qubit for X stabilizers
h q[10];

// Apply CNOT gates from ancilla to data for X stabilizers
cx q[10],q[0];
cx q[10],q[1];
cx q[10],q[3];

// Measure X-type stabilizer
h q[10];
measure q[10] -> syndrome[3];

// Apply recovery operation based on syndrome
// This would be controlled operations in real implementation
// Here we just correct our known X error on q[4]
x q[4];

// Measure the logical qubit in the computational basis
measure q[0] -> data[0];
measure q[1] -> data[1];
measure q[2] -> data[2];
measure q[3] -> data[3];
measure q[4] -> data[4];
measure q[5] -> data[5];
measure q[6] -> data[6];