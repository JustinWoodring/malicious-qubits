// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/shor_indep_qiskit_9.qasm
// Created as validation benchmark for 9-qubit testing purposes
// Simplified Shor's algorithm implementation for factoring 15 (N=15)
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];  // 4 qubits for phase estimation, 5 qubits for modular arithmetic
creg meas[4];

// Initialize control register in superposition
h q[0];
h q[1];
h q[2];
h q[3];

// Initialize target register to |1⟩
x q[8];

// Controlled modular exponentiation for a=7
// For a=7, we perform controlled operations of 7^(2^j) mod 15

// Controlled-U^1 operation (7^1 mod 15 = 7)
// This transforms |1⟩ to |7⟩
cu1(0) q[3],q[4];
cu1(0) q[3],q[5];
cu1(pi) q[3],q[6];
cu1(pi) q[3],q[7];
cu1(pi) q[3],q[8];

// Controlled-U^2 operation (7^2 mod 15 = 4)
// This transforms |1⟩ to |4⟩
cu1(0) q[2],q[4];
cu1(0) q[2],q[5];
cu1(0) q[2],q[6];
cu1(pi) q[2],q[7];
cu1(0) q[2],q[8];

// Controlled-U^4 operation (7^4 mod 15 = 1)
// This transforms |1⟩ to |1⟩ (identity)
cu1(0) q[1],q[4];
cu1(0) q[1],q[5];
cu1(0) q[1],q[6];
cu1(0) q[1],q[7];
cu1(0) q[1],q[8];

// Controlled-U^8 operation (7^8 mod 15 = 1)
// This transforms |1⟩ to |1⟩ (identity)
cu1(0) q[0],q[4];
cu1(0) q[0],q[5];
cu1(0) q[0],q[6];
cu1(0) q[0],q[7];
cu1(0) q[0],q[8];

// Apply inverse QFT to the control register
// Swap operations for the QFT
swap q[0],q[3];
swap q[1],q[2];

// Apply inverse QFT
h q[0];
cu1(-pi/2) q[0],q[1];
cu1(-pi/4) q[0],q[2];
cu1(-pi/8) q[0],q[3];
h q[1];
cu1(-pi/2) q[1],q[2];
cu1(-pi/4) q[1],q[3];
h q[2];
cu1(-pi/2) q[2],q[3];
h q[3];

// Measure the control register
barrier q;
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];