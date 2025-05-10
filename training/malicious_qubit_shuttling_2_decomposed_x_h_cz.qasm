OPENQASM 2.0;
include "qelib1.inc";

qreg q1[1];  // First qubit register
qreg q2[1];  // Second qubit register (target)
creg c[2];   // Classical register for measurements

// Initialize source qubit in superposition
h q1[0];

// "Shuttle" quantum information via SWAP operations decomposed into X, H, and CZ gates
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

// Second round of shuttling
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

// Third round of shuttling
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

// Fourth round of shuttling
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

// Fifth round of shuttling
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

// Measure both qubits
measure q1[0] -> c[0];
measure q2[0] -> c[1];