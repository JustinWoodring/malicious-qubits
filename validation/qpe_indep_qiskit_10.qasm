// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qpe_indep_qiskit_10.qasm
// Created as validation benchmark for 10-qubit testing purposes
// Quantum Phase Estimation algorithm implementation
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];  // 8 qubits for phase estimation + 2 for target unitary
creg meas[8]; // Measurements for the phase register

// Initialize target qubits in the eigenstate of the unitary
// For this example, we use a simple eigenstate of the Z rotation
x q[8];
h q[8];
cx q[8],q[9];

// Initialize phase estimation qubits in superposition
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Apply controlled unitary operations
// We'll use a phase shift by π/4 (0.25 in normalized phase)
// CU^(2^0)
cu1(pi/4) q[7],q[8];

// CU^(2^1)
cu1(pi/2) q[6],q[8];

// CU^(2^2)
cu1(pi) q[5],q[8];

// CU^(2^3)
cu1(2*pi) q[4],q[8];

// CU^(2^4)
cu1(4*pi) q[3],q[8];

// CU^(2^5)
cu1(8*pi) q[2],q[8];

// CU^(2^6)
cu1(16*pi) q[1],q[8];

// CU^(2^7)
cu1(32*pi) q[0],q[8];

// Apply Inverse Quantum Fourier Transform on the phase register
// Controlled phase rotations
cp(-pi/2) q[1],q[0];
cp(-pi/4) q[2],q[0];
cp(-pi/8) q[3],q[0];
cp(-pi/16) q[4],q[0];
cp(-pi/32) q[5],q[0];
cp(-pi/64) q[6],q[0];
cp(-pi/128) q[7],q[0];

cp(-pi/2) q[2],q[1];
cp(-pi/4) q[3],q[1];
cp(-pi/8) q[4],q[1];
cp(-pi/16) q[5],q[1];
cp(-pi/32) q[6],q[1];
cp(-pi/64) q[7],q[1];

cp(-pi/2) q[3],q[2];
cp(-pi/4) q[4],q[2];
cp(-pi/8) q[5],q[2];
cp(-pi/16) q[6],q[2];
cp(-pi/32) q[7],q[2];

cp(-pi/2) q[4],q[3];
cp(-pi/4) q[5],q[3];
cp(-pi/8) q[6],q[3];
cp(-pi/16) q[7],q[3];

cp(-pi/2) q[5],q[4];
cp(-pi/4) q[6],q[4];
cp(-pi/8) q[7],q[4];

cp(-pi/2) q[6],q[5];
cp(-pi/4) q[7],q[5];

cp(-pi/2) q[7],q[6];

// Apply Hadamard gates to complete the inverse QFT
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

// Swap qubits for the conventional QFT ordering
swap q[0],q[7];
swap q[1],q[6];
swap q[2],q[5];
swap q[3],q[4];

// Measure the phase estimation register
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];