OPENQASM 2.0;
include "qelib1.inc";

qreg q1[13];  // First qubit register
qreg q2[13];  // Second qubit register
creg c[27];  // Classical register for measurements

// Initialize with random gates
s q1[0];
s q1[1];
rz(pi/4) q1[1];
ry(pi/4) q1[1];
rx(pi/4) q1[2];
z q1[2];
s q1[2];
rx(pi/4) q1[3];
t q1[3];
tdg q1[3];
rx(pi/4) q1[4];
t q1[4];
x q1[4];
y q1[5];
rx(pi/4) q1[6];
s q1[7];
x q1[7];
z q1[8];
y q1[8];
tdg q1[9];
s q1[9];
ry(pi/4) q1[9];
rx(pi/4) q1[10];
t q1[11];
h q1[11];
ry(pi/4) q1[11];
sdg q1[12];
tdg q1[12];

// Some qubit shuttling operations
cz q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
cz q1[3], q2[3];
cy q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
cz q1[10], q2[10];
swap q1[11], q2[11];
cx q1[12], q2[12];
cx q1[0], q2[0];
cy q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
cy q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
swap q1[10], q2[10];
swap q1[11], q2[11];
swap q1[12], q2[12];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cx q1[4], q2[4];
swap q1[5], q2[5];
cz q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
cz q1[10], q2[10];
swap q1[11], q2[11];
swap q1[12], q2[12];
cz q1[0], q2[0];
ch q1[1], q2[1];
ch q1[2], q2[2];
swap q1[3], q2[3];
ch q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
cy q1[8], q2[8];
cx q1[9], q2[9];
swap q1[10], q2[10];
swap q1[11], q2[11];
cy q1[12], q2[12];
cx q1[0], q2[0];
ch q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cz q1[7], q2[7];
cy q1[8], q2[8];
swap q1[9], q2[9];
swap q1[10], q2[10];
cz q1[11], q2[11];
swap q1[12], q2[12];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
cy q1[3], q2[3];
ch q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
ch q1[9], q2[9];
cx q1[10], q2[10];
cy q1[11], q2[11];
swap q1[12], q2[12];
cx q1[0], q2[0];
swap q1[1], q2[1];
cz q1[2], q2[2];
cx q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
cz q1[6], q2[6];
cx q1[7], q2[7];
cx q1[8], q2[8];
swap q1[9], q2[9];
swap q1[10], q2[10];
cx q1[11], q2[11];
swap q1[12], q2[12];
cy q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cx q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cz q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
swap q1[10], q2[10];
swap q1[11], q2[11];
cy q1[12], q2[12];
cx q1[0], q2[0];
ch q1[1], q2[1];
cx q1[2], q2[2];
ch q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
swap q1[10], q2[10];
swap q1[11], q2[11];
cx q1[12], q2[12];

// Immediate measurement of some qubits
measure q1[4] -> c[4];
measure q1[11] -> c[11];

// More operations after partial measurement
y q1[0];
x q1[1];
rx(pi/4) q1[2];
ry(pi/4) q1[3];
sdg q1[5];
tdg q1[6];
ry(pi/4) q1[7];
tdg q1[8];
y q1[9];
sdg q1[10];
ry(pi/4) q1[12];

// Final measurements
measure q1[0] -> c[0];
measure q1[1] -> c[1];
measure q1[2] -> c[2];
measure q1[3] -> c[3];
measure q1[5] -> c[5];
measure q1[6] -> c[6];
measure q1[7] -> c[7];
measure q1[8] -> c[8];
measure q1[9] -> c[9];
measure q1[10] -> c[10];
measure q1[12] -> c[12];
measure q2[0] -> c[13];
measure q2[1] -> c[14];
measure q2[2] -> c[15];
measure q2[3] -> c[16];
measure q2[4] -> c[17];
measure q2[5] -> c[18];
measure q2[6] -> c[19];
measure q2[7] -> c[20];
measure q2[8] -> c[21];
measure q2[9] -> c[22];
measure q2[10] -> c[23];
measure q2[11] -> c[24];
measure q2[12] -> c[25];
