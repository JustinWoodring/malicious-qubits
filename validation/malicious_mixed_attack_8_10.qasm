OPENQASM 2.0;
include "qelib1.inc";

qreg q1[4];  // First qubit register
qreg q2[4];  // Second qubit register
creg c[8];  // Classical register for measurements

// Initialize with random gates
rx(pi/4) q1[0];
tdg q1[0];
ry(pi/4) q1[0];
t q1[1];
z q1[2];
x q1[2];
s q1[2];
ry(pi/4) q1[3];

// Some qubit shuttling operations
cz q1[0], q2[0];
cz q1[1], q2[1];
ch q1[2], q2[2];
swap q1[3], q2[3];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
cx q1[3], q2[3];
cz q1[0], q2[0];
cz q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];

// Immediate measurement of some qubits
measure q1[0] -> c[0];
measure q1[2] -> c[2];
measure q1[3] -> c[3];

// More operations after partial measurement
x q1[1];

// Final measurements
measure q1[1] -> c[1];
measure q2[0] -> c[4];
measure q2[1] -> c[5];
measure q2[2] -> c[6];
measure q2[3] -> c[7];
