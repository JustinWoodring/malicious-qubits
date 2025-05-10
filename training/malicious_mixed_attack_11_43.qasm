OPENQASM 2.0;
include "qelib1.inc";

qreg q1[5];  // First qubit register
qreg q2[5];  // Second qubit register
creg c[11];  // Classical register for measurements

// Initialize with random gates
rz(pi/4) q1[0];
ry(pi/4) q1[0];
t q1[0];
tdg q1[1];
tdg q1[2];
rz(pi/4) q1[2];
x q1[3];
t q1[4];

// Some qubit shuttling operations
cz q1[0], q2[0];
cy q1[1], q2[1];
swap q1[2], q2[2];
cz q1[3], q2[3];
cz q1[4], q2[4];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cz q1[4], q2[4];
swap q1[0], q2[0];
swap q1[1], q2[1];
cz q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
ch q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
cy q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
ch q1[3], q2[3];
ch q1[4], q2[4];
cx q1[0], q2[0];
swap q1[1], q2[1];
ch q1[2], q2[2];
cy q1[3], q2[3];
cx q1[4], q2[4];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cy q1[4], q2[4];
swap q1[0], q2[0];
cy q1[1], q2[1];
swap q1[2], q2[2];
ch q1[3], q2[3];
swap q1[4], q2[4];
swap q1[0], q2[0];
swap q1[1], q2[1];
ch q1[2], q2[2];
cy q1[3], q2[3];
swap q1[4], q2[4];

// Immediate measurement of some qubits
measure q1[1] -> c[1];
measure q1[3] -> c[3];
measure q1[4] -> c[4];
measure q1[0] -> c[0];

// More operations after partial measurement
tdg q1[2];

// Final measurements
measure q1[2] -> c[2];
measure q2[0] -> c[5];
measure q2[1] -> c[6];
measure q2[2] -> c[7];
measure q2[3] -> c[8];
measure q2[4] -> c[9];
