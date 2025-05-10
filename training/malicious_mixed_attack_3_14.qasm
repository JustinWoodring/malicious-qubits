OPENQASM 2.0;
include "qelib1.inc";

qreg q1[1];  // First qubit register
qreg q2[1];  // Second qubit register
creg c[3];  // Classical register for measurements

// Initialize with random gates
z q1[0];
s q1[0];
z q1[0];

// Some qubit shuttling operations
cy q1[0], q2[0];
cy q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
cz q1[0], q2[0];

// Immediate measurement of some qubits
measure q1[0] -> c[0];

// More operations after partial measurement

// Final measurements
measure q2[0] -> c[1];
