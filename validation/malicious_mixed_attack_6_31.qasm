OPENQASM 2.0;
include "qelib1.inc";

qreg q1[3];  // First qubit register
qreg q2[3];  // Second qubit register
creg c[6];  // Classical register for measurements

// Initialize with random gates
h q1[0];
y q1[0];
s q1[0];
z q1[1];
h q1[1];
t q1[1];
z q1[2];

// Some qubit shuttling operations
cz q1[0], q2[0];
swap q1[1], q2[1];
cy q1[2], q2[2];
cz q1[0], q2[0];
cz q1[1], q2[1];
swap q1[2], q2[2];
cz q1[0], q2[0];
ch q1[1], q2[1];
cx q1[2], q2[2];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];

// Immediate measurement of some qubits
measure q1[0] -> c[0];

// More operations after partial measurement
h q1[1];
z q1[2];

// Final measurements
measure q1[1] -> c[1];
measure q1[2] -> c[2];
measure q2[0] -> c[3];
measure q2[1] -> c[4];
measure q2[2] -> c[5];
