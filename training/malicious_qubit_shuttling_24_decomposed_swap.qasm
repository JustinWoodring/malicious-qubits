OPENQASM 2.0;
include "qelib1.inc";

qreg q1[12];  // First qubit register
qreg q2[12];  // Second qubit register (target)
creg c[24];   // Classical register for measurements

// Initialize source qubits in superposition
h q1[0];
h q1[1];
h q1[2];
h q1[3];
h q1[4];
h q1[5];
h q1[6];
h q1[7];
h q1[8];
h q1[9];
h q1[10];
h q1[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// First round of "shuttling" - decomposed into CX gates
// SWAP(q1[0], q2[0]) decomposed
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];

// SWAP(q1[1], q2[1]) decomposed
cx q1[1], q2[1];
cx q2[1], q1[1];
cx q1[1], q2[1];

// SWAP(q1[2], q2[2]) decomposed
cx q1[2], q2[2];
cx q2[2], q1[2];
cx q1[2], q2[2];

// SWAP(q1[3], q2[3]) decomposed
cx q1[3], q2[3];
cx q2[3], q1[3];
cx q1[3], q2[3];

// SWAP(q1[4], q2[4]) decomposed
cx q1[4], q2[4];
cx q2[4], q1[4];
cx q1[4], q2[4];

// SWAP(q1[5], q2[5]) decomposed
cx q1[5], q2[5];
cx q2[5], q1[5];
cx q1[5], q2[5];

// SWAP(q1[6], q2[6]) decomposed
cx q1[6], q2[6];
cx q2[6], q1[6];
cx q1[6], q2[6];

// SWAP(q1[7], q2[7]) decomposed
cx q1[7], q2[7];
cx q2[7], q1[7];
cx q1[7], q2[7];

// SWAP(q1[8], q2[8]) decomposed
cx q1[8], q2[8];
cx q2[8], q1[8];
cx q1[8], q2[8];

// SWAP(q1[9], q2[9]) decomposed
cx q1[9], q2[9];
cx q2[9], q1[9];
cx q1[9], q2[9];

// SWAP(q1[10], q2[10]) decomposed
cx q1[10], q2[10];
cx q2[10], q1[10];
cx q1[10], q2[10];

// SWAP(q1[11], q2[11]) decomposed
cx q1[11], q2[11];
cx q2[11], q1[11];
cx q1[11], q2[11];

// Final set of measurements remains the same
measure q1[0] -> c[0];
measure q1[1] -> c[1];
measure q1[2] -> c[2];
measure q1[3] -> c[3];
measure q1[4] -> c[4];
measure q1[5] -> c[5];
measure q1[6] -> c[6];
measure q1[7] -> c[7];
measure q1[8] -> c[8];
measure q1[9] -> c[9];
measure q1[10] -> c[10];
measure q1[11] -> c[11];
measure q2[0] -> c[12];
measure q2[1] -> c[13];
measure q2[2] -> c[14];
measure q2[3] -> c[15];
measure q2[4] -> c[16];
measure q2[5] -> c[17];
measure q2[6] -> c[18];
measure q2[7] -> c[19];
measure q2[8] -> c[20];
measure q2[9] -> c[21];
measure q2[10] -> c[22];
measure q2[11] -> c[23];