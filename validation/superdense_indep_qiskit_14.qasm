// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/superdense_indep_qiskit_14.qasm
// Created as validation benchmark for 14-qubit testing purposes
// Superdense Coding Protocol with 7 Bell pairs
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[14];
creg meas[7];

// Create 7 Bell pairs (q[0],q[7]), (q[1],q[8]), etc.
h q[0];
cx q[0],q[7];

h q[1];
cx q[1],q[8];

h q[2];
cx q[2],q[9];

h q[3];
cx q[3],q[10];

h q[4];
cx q[4],q[11];

h q[5];
cx q[5],q[12];

h q[6];
cx q[6],q[13];

// Encode classical information on Alice's qubits
// Encoding "1001101" (each bit encoded on one Bell pair)
x q[0];  // bit 1
         // bit 0 (do nothing)
         // bit 0 (do nothing)
x q[3];  // bit 1
x q[4];  // bit 1
         // bit 0 (do nothing)
x q[6];  // bit 1

// Apply Z operations for second bit of information
z q[0];  // bit 1
z q[1];  // bit 1
         // bit 0 (do nothing)
z q[3];  // bit 1
         // bit 0 (do nothing)
z q[5];  // bit 1
         // bit 0 (do nothing)

// Bob's decoding operations
cx q[0],q[7];
h q[0];

cx q[1],q[8];
h q[1];

cx q[2],q[9];
h q[2];

cx q[3],q[10];
h q[3];

cx q[4],q[11];
h q[4];

cx q[5],q[12];
h q[5];

cx q[6],q[13];
h q[6];

// Measure Alice's qubits to extract the encoded information
barrier q;
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];