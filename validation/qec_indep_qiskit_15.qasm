// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qec_indep_qiskit_15.qasm
// Created as validation benchmark for 15-qubit testing purposes
// Quantum Error Correction code - Surface code with distance 2
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[15];
creg meas[15];

// Initialize logical qubit (data qubit)
// Use qubit 7 as the central data qubit
h q[7];  // Put data qubit in superposition

// Initialize syndrome qubits
// X-stabilizers
h q[1];
h q[3];
h q[11];
h q[13];

// Create the parity check for X stabilizers
// X-stabilizer at position 1 (connect to 0,2,6,8)
cx q[1],q[0];
cx q[1],q[2];
cx q[1],q[6];
cx q[1],q[8];

// X-stabilizer at position 3 (connect to 2,4,8,10)
cx q[3],q[2];
cx q[3],q[4];
cx q[3],q[8];
cx q[3],q[10];

// X-stabilizer at position 11 (connect to 6,8,12,14)
cx q[11],q[6];
cx q[11],q[8];
cx q[11],q[12];
cx q[11],q[14];

// X-stabilizer at position 13 (connect to 8,10,12,14)
cx q[13],q[8];
cx q[13],q[10];
cx q[13],q[12];
cx q[13],q[14];

// Measure X-stabilizers
h q[1];
h q[3];
h q[11];
h q[13];

// Initialize Z-stabilizers
// Z-stabilizers at positions 5, 9
h q[5];
h q[9];

// Create the parity check for Z stabilizers
// Z-stabilizer at position 5 (connect to 0,2,6,8)
cx q[0],q[5];
cx q[2],q[5];
cx q[6],q[5];
cx q[8],q[5];

// Z-stabilizer at position 9 (connect to 4,8,10,14)
cx q[4],q[9];
cx q[8],q[9];
cx q[10],q[9];
cx q[14],q[9];

// Induce an error (for testing)
x q[7];  // Apply a bit-flip error

// Error detection circuit
// X-stabilizers again
h q[1];
h q[3];
h q[11];
h q[13];

// Recompute X-stabilizers
cx q[1],q[0];
cx q[1],q[2];
cx q[1],q[6];
cx q[1],q[8];

cx q[3],q[2];
cx q[3],q[4];
cx q[3],q[8];
cx q[3],q[10];

cx q[11],q[6];
cx q[11],q[8];
cx q[11],q[12];
cx q[11],q[14];

cx q[13],q[8];
cx q[13],q[10];
cx q[13],q[12];
cx q[13],q[14];

// Measure X-stabilizers again
h q[1];
h q[3];
h q[11];
h q[13];

// Measure Z-stabilizers
cx q[0],q[5];
cx q[2],q[5];
cx q[6],q[5];
cx q[8],q[5];

cx q[4],q[9];
cx q[8],q[9];
cx q[10],q[9];
cx q[14],q[9];

// Error correction (for demonstration)
// Based on syndrome measurements, we would correct the error
// In a real circuit, this would depend on the measured syndrome values

// Measure all qubits to see the result
barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14];
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