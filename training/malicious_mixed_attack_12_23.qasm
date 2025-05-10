OPENQASM 2.0;
include "qelib1.inc";

qreg q1[6];  // First qubit register
qreg q2[6];  // Second qubit register
creg c[12];  // Classical register for measurements

// Initialize with random gates
t q1[0];
sdg q1[0];
tdg q1[0];
x q1[1];
z q1[1];
z q1[1];
s q1[2];
rz(pi/4) q1[3];
s q1[3];
t q1[3];
s q1[4];
ry(pi/4) q1[4];
x q1[5];

// Some qubit shuttling operations
cx q1[0], q2[0];
swap q1[1], q2[1];
ch q1[2], q2[2];
cz q1[3], q2[3];
swap q1[4], q2[4];
ch q1[5], q2[5];
swap q1[0], q2[0];
cz q1[1], q2[1];
cz q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[0], q2[0];
cx q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];

// Immediate measurement of some qubits
measure q1[4] -> c[4];
measure q1[5] -> c[5];
measure q1[3] -> c[3];
measure q1[2] -> c[2];

// More operations after partial measurement
z q1[0];
rx(pi/4) q1[1];

// Final measurements
measure q1[0] -> c[0];
measure q1[1] -> c[1];
measure q2[0] -> c[6];
measure q2[1] -> c[7];
measure q2[2] -> c[8];
measure q2[3] -> c[9];
measure q2[4] -> c[10];
measure q2[5] -> c[11];
