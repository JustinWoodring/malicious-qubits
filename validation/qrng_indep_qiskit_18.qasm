// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qrng_indep_qiskit_18.qasm
// Created as validation benchmark for 18-qubit testing purposes
// Quantum Random Number Generator with parallel extraction
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[18];
creg meas[18];

// Apply Hadamard gates to all qubits to create superposition
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
h q[16];
h q[17];

// Apply some random rotations to add entropy
s q[2];
t q[4];
s q[6];
t q[8];
s q[10];
t q[12];
s q[14];
t q[16];

// Apply some entanglement operations
cx q[0],q[1];
cx q[2],q[3];
cx q[4],q[5];
cx q[6],q[7];
cx q[8],q[9];
cx q[10],q[11];
cx q[12],q[13];
cx q[14],q[15];
cx q[16],q[17];

// Apply final rotations
h q[1];
h q[3];
h q[5];
h q[7];
h q[9];
h q[11];
h q[13];
h q[15];
h q[17];

// Measure all qubits to generate random numbers
barrier q;
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
measure q[16] -> meas[16];
measure q[17] -> meas[17];