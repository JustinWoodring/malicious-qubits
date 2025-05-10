// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qnn_indep_qiskit_8.qasm
// Created as validation benchmark for 8-qubit testing purposes
// Quantum Neural Network with 2 layers for binary classification
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];  // 6 data qubits + 2 readout qubits
creg meas[2];

// Input encoding layer - encode 6D classical data into quantum state
rx(0.12) q[0];
rx(0.34) q[1];
rx(0.56) q[2];
rx(0.78) q[3];
rx(0.90) q[4];
rx(0.54) q[5];

// Layer 1 - entangling layer
// Entangle all qubits with nearest neighbor topology
cx q[0],q[1];
cx q[1],q[2];
cx q[2],q[3];
cx q[3],q[4];
cx q[4],q[5];
cx q[5],q[0];

// Layer 1 - rotation layer
ry(0.236) q[0];
ry(0.452) q[1];
ry(0.679) q[2];
ry(0.124) q[3];
ry(0.578) q[4];
ry(0.891) q[5];

rz(0.654) q[0];
rz(0.248) q[1];
rz(0.743) q[2];
rz(0.419) q[3];
rz(0.902) q[4];
rz(0.567) q[5];

// Layer 2 - entangling layer with different connectivity
cx q[0],q[2];
cx q[1],q[3];
cx q[2],q[4];
cx q[3],q[5];
cx q[4],q[0];
cx q[5],q[1];

// Layer 2 - rotation layer
ry(0.327) q[0];
ry(0.831) q[1];
ry(0.492) q[2];
ry(0.215) q[3];
ry(0.738) q[4];
ry(0.946) q[5];

rz(0.124) q[0];
rz(0.369) q[1];
rz(0.582) q[2];
rz(0.791) q[3];
rz(0.425) q[4];
rz(0.638) q[5];

// Final classification layer
// Combine the results from the 6 data qubits to 2 readout qubits
cx q[0],q[6];
cx q[1],q[6];
cx q[2],q[6];
cx q[3],q[7];
cx q[4],q[7];
cx q[5],q[7];

// Measurement of the readout qubits
barrier q;
measure q[6] -> meas[0];
measure q[7] -> meas[1];