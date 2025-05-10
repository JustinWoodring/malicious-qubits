OPENQASM 2.0;
include "qelib1.inc";

qreg q1[2];  // First qubit register
qreg q2[2];  // Second qubit register
creg c[4];  // Classical register for measurements

// Initialize with random gates
h q1[0];
z q1[0];
sdg q1[0];
h q1[1];
t q1[1];

// Some qubit shuttling operations
cy q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
cz q1[1], q2[1];
ch q1[0], q2[0];
swap q1[1], q2[1];
cx q1[0], q2[0];
cz q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[0], q2[0];
swap q1[1], q2[1];

// Immediate measurement of some qubits
measure q1[1] -> c[1];

// More operations after partial measurement
t q1[0];

// Final measurements
measure q1[0] -> c[0];
measure q2[0] -> c[2];
measure q2[1] -> c[3];
