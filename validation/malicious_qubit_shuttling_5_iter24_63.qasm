OPENQASM 2.0;
include "qelib1.inc";

qreg q1[2];  // First qubit register
qreg q2[2];  // Second qubit register (target)
creg c[5];  // Classical register for measurements

// Initialize source qubits in superposition
s q1[0];
x q1[1];

// "Shuttle" quantum information via SWAP operations
// In real hardware, this might represent physical movement of qubits
// Using direct SWAP operations
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];

// Measure both registers (original and shuttled)
measure q1[0] -> c[0];
measure q1[1] -> c[1];
measure q2[0] -> c[2];
measure q2[1] -> c[3];
