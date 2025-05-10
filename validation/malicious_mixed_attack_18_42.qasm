OPENQASM 2.0;
include "qelib1.inc";

qreg q1[9];  // First qubit register
qreg q2[9];  // Second qubit register
creg c[18];  // Classical register for measurements

// Initialize with random gates
h q1[0];
x q1[1];
tdg q1[2];
x q1[3];
t q1[4];
rz(pi/4) q1[4];
s q1[5];
t q1[6];
z q1[7];
t q1[8];

// Some qubit shuttling operations
cx q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
cz q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
ch q1[7], q2[7];
swap q1[8], q2[8];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
ch q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
cx q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];

// Immediate measurement of some qubits
measure q1[1] -> c[1];
measure q1[2] -> c[2];
measure q1[7] -> c[7];
measure q1[8] -> c[8];
measure q1[4] -> c[4];
measure q1[6] -> c[6];

// More operations after partial measurement
x q1[0];
z q1[3];
t q1[5];

// Final measurements
measure q1[0] -> c[0];
measure q1[3] -> c[3];
measure q1[5] -> c[5];
measure q2[0] -> c[9];
measure q2[1] -> c[10];
measure q2[2] -> c[11];
measure q2[3] -> c[12];
measure q2[4] -> c[13];
measure q2[5] -> c[14];
measure q2[6] -> c[15];
measure q2[7] -> c[16];
measure q2[8] -> c[17];
