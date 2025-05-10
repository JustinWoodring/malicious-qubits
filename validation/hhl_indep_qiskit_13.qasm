// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/hhl_indep_qiskit_13.qasm
// Created as validation benchmark for 13-qubit testing purposes
// HHL Algorithm for solving linear systems Ax = b
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[13];  // 4 for clock register, 3 for eigenvalue register, 6 for problem registers
creg meas[6];

// Initialize the b vector - representing |b⟩ = |1⟩
x q[0];

// Phase estimation part
// Apply Hadamard to the clock register
h q[4];
h q[5];
h q[6];
h q[7];

// Controlled unitary operations (simplified representation of e^(iAt))
// These controlled operations represent e^(iAt_j) for different time steps
cu1(pi/8) q[7],q[0];
cu1(pi/8) q[7],q[1];
cu1(pi/8) q[7],q[2];
cu1(pi/8) q[7],q[3];

cu1(pi/4) q[6],q[0];
cu1(pi/4) q[6],q[1];
cu1(pi/4) q[6],q[2];
cu1(pi/4) q[6],q[3];

cu1(pi/2) q[5],q[0];
cu1(pi/2) q[5],q[1];
cu1(pi/2) q[5],q[2];
cu1(pi/2) q[5],q[3];

cu1(pi) q[4],q[0];
cu1(pi) q[4],q[1];
cu1(pi) q[4],q[2];
cu1(pi) q[4],q[3];

// Inverse QFT on the clock register
swap q[4],q[7];
swap q[5],q[6];

h q[4];
cu1(-pi/2) q[4],q[5];
cu1(-pi/4) q[4],q[6];
cu1(-pi/8) q[4],q[7];
h q[5];
cu1(-pi/2) q[5],q[6];
cu1(-pi/4) q[5],q[7];
h q[6];
cu1(-pi/2) q[6],q[7];
h q[7];

// Rotation operations on the eigenvalue register (q[8], q[9], q[10])
// These represent the controlled rotations based on eigenvalues 
c3x q[4],q[5],q[6],q[8];
c3x q[4],q[5],q[7],q[9];
c3x q[4],q[6],q[7],q[10];

// Apply rotations conditioned on the eigenvalue register
// These rotations implement the 1/λ operation in HHL
cu3(pi/4,0,0) q[8],q[11];
cu3(pi/2,0,0) q[9],q[11];
cu3(pi,0,0) q[10],q[11];

// Inverse phase estimation to uncompute
// Apply QFT on the clock register
h q[7];
cu1(pi/2) q[6],q[7];
h q[6];
cu1(pi/2) q[5],q[6];
cu1(pi/4) q[5],q[7];
h q[5];
cu1(pi/2) q[4],q[5];
cu1(pi/4) q[4],q[6];
cu1(pi/8) q[4],q[7];
h q[4];

swap q[4],q[7];
swap q[5],q[6];

// Inverse controlled unitary operations
cu1(-pi) q[4],q[0];
cu1(-pi) q[4],q[1];
cu1(-pi) q[4],q[2];
cu1(-pi) q[4],q[3];

cu1(-pi/2) q[5],q[0];
cu1(-pi/2) q[5],q[1];
cu1(-pi/2) q[5],q[2];
cu1(-pi/2) q[5],q[3];

cu1(-pi/4) q[6],q[0];
cu1(-pi/4) q[6],q[1];
cu1(-pi/4) q[6],q[2];
cu1(-pi/4) q[6],q[3];

cu1(-pi/8) q[7],q[0];
cu1(-pi/8) q[7],q[1];
cu1(-pi/8) q[7],q[2];
cu1(-pi/8) q[7],q[3];

// Apply Hadamards to the clock register
h q[4];
h q[5];
h q[6];
h q[7];

// Measurement of the solution register
barrier q;
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[11] -> meas[4];
measure q[12] -> meas[5];