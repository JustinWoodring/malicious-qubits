OPENQASM 2.0;
include "qelib1.inc";

qreg q1[5];  // First qubit register
qreg q2[5];  // Second qubit register (target)
creg c[10];  // Classical register for measurements

// Initialize source qubits in superposition
h q1[0];
h q1[1];
h q1[2];
h q1[3];
h q1[4];

// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];

// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];

// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];

// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];


// "Shuttle" quantum information via SWAP operations decomposed into X and CZ gates
// First round of swaps
// SWAP(q1[0], q2[0]) decomposed
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];
x q1[0]; x q2[0];
h q1[0]; h q2[0];
cz q1[0], q2[0];
h q1[0]; h q2[0];

// SWAP(q1[1], q2[1]) decomposed
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];
x q1[1]; x q2[1];
h q1[1]; h q2[1];
cz q1[1], q2[1];
h q1[1]; h q2[1];

// SWAP(q1[2], q2[2]) decomposed
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];
x q1[2]; x q2[2];
h q1[2]; h q2[2];
cz q1[2], q2[2];
h q1[2]; h q2[2];

// SWAP(q1[3], q2[3]) decomposed
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];
x q1[3]; x q2[3];
h q1[3]; h q2[3];
cz q1[3], q2[3];
h q1[3]; h q2[3];

// SWAP(q1[4], q2[4]) decomposed
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];
x q1[4]; x q2[4];
h q1[4]; h q2[4];
cz q1[4], q2[4];
h q1[4]; h q2[4];

// Measurement operations remain unchanged
measure q1[0] -> c[0];
measure q1[1] -> c[1];
measure q1[2] -> c[2];
measure q1[3] -> c[3];
measure q1[4] -> c[4];
measure q2[0] -> c[5];
measure q2[1] -> c[6];
measure q2[2] -> c[7];
measure q2[3] -> c[8];
measure q2[4] -> c[9];