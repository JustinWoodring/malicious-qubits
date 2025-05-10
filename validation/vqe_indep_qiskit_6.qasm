// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/vqe_indep_qiskit_6.qasm
// Created as validation benchmark for 6-qubit testing purposes
// Variational Quantum Eigensolver (VQE) implementation
// Simulating a simple molecular Hamiltonian
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[6];  // 6 qubits for molecular orbital representation
creg meas[6];

// State preparation - Hartree-Fock initial state
// Represent 6 spin orbitals with 3 electrons
x q[0];  // First electron in first orbital
x q[1];  // Second electron in second orbital
x q[2];  // Third electron in third orbital

// Apply variational ansatz (hardware efficient ansatz)
// Layer 1 - Single qubit rotations
rx(0.123) q[0];
rx(0.456) q[1];
rx(0.789) q[2];
rx(0.246) q[3];
rx(0.357) q[4];
rx(0.159) q[5];

ry(0.753) q[0];
ry(0.951) q[1];
ry(0.483) q[2];
ry(0.126) q[3];
ry(0.258) q[4];
ry(0.369) q[5];

rz(0.147) q[0];
rz(0.369) q[1];
rz(0.741) q[2];
rz(0.852) q[3];
rz(0.963) q[4];
rz(0.321) q[5];

// Layer 1 - Entangling operations (nearest-neighbor coupling)
cx q[0],q[1];
cx q[1],q[2];
cx q[2],q[3];
cx q[3],q[4];
cx q[4],q[5];
cx q[5],q[0];  // Periodic boundary condition

// Layer 2 - Single qubit rotations
rx(0.234) q[0];
rx(0.567) q[1];
rx(0.891) q[2];
rx(0.312) q[3];
rx(0.645) q[4];
rx(0.978) q[5];

ry(0.135) q[0];
ry(0.246) q[1];
ry(0.357) q[2];
ry(0.468) q[3];
ry(0.579) q[4];
ry(0.681) q[5];

rz(0.174) q[0];
rz(0.285) q[1];
rz(0.396) q[2];
rz(0.417) q[3];
rz(0.528) q[4];
rz(0.639) q[5];

// Layer 2 - Entangling operations (next-nearest-neighbor coupling)
cx q[0],q[2];
cx q[1],q[3];
cx q[2],q[4];
cx q[3],q[5];
cx q[4],q[0];
cx q[5],q[1];

// Layer 3 - Final single qubit rotations
rx(0.321) q[0];
rx(0.432) q[1];
rx(0.543) q[2];
rx(0.654) q[3];
rx(0.765) q[4];
rx(0.876) q[5];

ry(0.987) q[0];
ry(0.876) q[1];
ry(0.765) q[2];
ry(0.654) q[3];
ry(0.543) q[4];
ry(0.432) q[5];

rz(0.321) q[0];
rz(0.432) q[1];
rz(0.543) q[2];
rz(0.654) q[3];
rz(0.765) q[4];
rz(0.876) q[5];

// Measure all qubits - needed for expectation value calculation
barrier q[0],q[1],q[2],q[3],q[4],q[5];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];