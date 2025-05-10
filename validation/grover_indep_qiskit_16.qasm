// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/grover_indep_qiskit_16.qasm
// Created as validation benchmark for 16-qubit testing purposes
// Grover's search algorithm implementation
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
creg meas[16];

// Initialize registers
// 15 qubits for search space (2^15 = 32,768 items)
// 1 qubit as oracle ancilla

// Apply Hadamard to create superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];

// Oracle - Marks state |1010101010101010⟩
// Apply X gates to bits that should be 0 in the target state
x q[1];
x q[3];
x q[5];
x q[7];
x q[9];
x q[11];
x q[13];
x q[15];

// Multi-controlled Toffoli with q[15] as target
// This creates a phase flip on the target state
mct q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15];

// Restore qubits to original state by applying X gates again
x q[1];
x q[3];
x q[5];
x q[7];
x q[9];
x q[11];
x q[13];
x q[15];

// Diffusion Operator (Grover operator)
// Apply H gates to all qubits except the ancilla
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];

// Apply X gates to all qubits except the ancilla
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];
x q[10];
x q[11];
x q[12];
x q[13];
x q[14];
x q[15];

// Apply multi-controlled-Z gate (implemented using MCT with H gates)
h q[0];
mct q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15],q[0];
h q[0];

// Restore qubits by applying X gates again
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];
x q[10];
x q[11];
x q[12];
x q[13];
x q[14];
x q[15];

// Apply H gates to return to computational basis
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];
h q[15];

barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14],q[15];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];
measure q[15] -> meas[15];