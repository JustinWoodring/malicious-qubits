// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qsvm_indep_qiskit_6.qasm
// Created as validation benchmark for 6-qubit testing purposes
// Quantum Support Vector Machine for binary classification
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];  // 4 data qubits + 2 ancilla qubits
creg meas[3];

// Encode 2 data points (2D features) into 4 qubits
// First data point on q[0],q[1]
ry(0.5) q[0];
rz(0.3) q[0];
ry(0.7) q[1];
rz(0.2) q[1];

// Second data point on q[2],q[3]
ry(0.4) q[2];
rz(0.6) q[2];
ry(0.9) q[3];
rz(0.1) q[3];

// Apply feature map for kernel evaluation
// Layer 1 - Single qubit rotations
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 1 - ZZ feature mapping
cx q[0],q[1];
u1(0.5) q[1];
cx q[0],q[1];

cx q[2],q[3];
u1(0.7) q[3];
cx q[2],q[3];

// Layer 2 - Single qubit rotations
h q[0];
h q[1];
h q[2];
h q[3];

// Layer 2 - ZZ feature mapping
cx q[0],q[1];
u1(0.3) q[1];
cx q[0],q[1];

cx q[2],q[3];
u1(0.2) q[3];
cx q[2],q[3];

// Apply SVM classification circuit
// Initialize ancilla qubits
h q[4];
x q[5];
h q[5];

// Apply controlled swaps between data points
cswap q[4],q[0],q[2];
cswap q[4],q[1],q[3];

// Apply H to ancilla
h q[4];

// Measure results
barrier q;
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[4] -> meas[2];