OPENQASM 2.0;
include "qelib1.inc";

qreg q1[4];  // First qubit register
qreg q2[4];  // Second qubit register
creg c[9];  // Classical register for measurements

// Initialize with random gates
x q1[0];
y q1[0];
h q1[1];
rx(pi/4) q1[2];
rx(pi/4) q1[2];
x q1[2];
rx(pi/4) q1[3];
x q1[3];
x q1[3];

// Some qubit shuttling operations
swap q1[0], q2[0];
cy q1[1], q2[1];
cz q1[2], q2[2];
swap q1[3], q2[3];
swap q1[0], q2[0];
swap q1[1], q2[1];
ch q1[2], q2[2];
swap q1[3], q2[3];
swap q1[0], q2[0];
cx q1[1], q2[1];
swap q1[2], q2[2];
cx q1[3], q2[3];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
ch q1[3], q2[3];
cz q1[0], q2[0];
ch q1[1], q2[1];
cz q1[2], q2[2];
cy q1[3], q2[3];
ch q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cy q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cx q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];

// Immediate measurement of some qubits
measure q1[0] -> c[0];
measure q1[2] -> c[2];
measure q1[1] -> c[1];
measure q1[3] -> c[3];

// More operations after partial measurement

// Final measurements
measure q2[0] -> c[4];
measure q2[1] -> c[5];
measure q2[2] -> c[6];
measure q2[3] -> c[7];
