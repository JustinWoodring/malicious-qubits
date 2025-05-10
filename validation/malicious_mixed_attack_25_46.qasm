OPENQASM 2.0;
include "qelib1.inc";

qreg q1[12];  // First qubit register
qreg q2[12];  // Second qubit register
creg c[25];  // Classical register for measurements

// Initialize with random gates
t q1[0];
sdg q1[0];
s q1[0];
t q1[1];
sdg q1[1];
y q1[2];
s q1[2];
z q1[2];
x q1[3];
tdg q1[4];
t q1[4];
ry(pi/4) q1[5];
z q1[6];
x q1[7];
x q1[7];
ry(pi/4) q1[8];
tdg q1[8];
x q1[8];
tdg q1[9];
rz(pi/4) q1[9];
y q1[10];
rz(pi/4) q1[10];
tdg q1[10];
t q1[11];

// Some qubit shuttling operations
swap q1[0], q2[0];
ch q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cz q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
cz q1[10], q2[10];
cx q1[11], q2[11];
cy q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
cy q1[3], q2[3];
cz q1[4], q2[4];
ch q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
cz q1[8], q2[8];
ch q1[9], q2[9];
swap q1[10], q2[10];
swap q1[11], q2[11];
cz q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
cy q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
ch q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
cz q1[9], q2[9];
cy q1[10], q2[10];
swap q1[11], q2[11];
swap q1[0], q2[0];
swap q1[1], q2[1];
ch q1[2], q2[2];
cx q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cx q1[7], q2[7];
cx q1[8], q2[8];
swap q1[9], q2[9];
swap q1[10], q2[10];
swap q1[11], q2[11];
swap q1[0], q2[0];
swap q1[1], q2[1];
ch q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cx q1[7], q2[7];
cz q1[8], q2[8];
swap q1[9], q2[9];
swap q1[10], q2[10];
swap q1[11], q2[11];

// Immediate measurement of some qubits
measure q1[10] -> c[10];
measure q1[0] -> c[0];
measure q1[4] -> c[4];
measure q1[8] -> c[8];
measure q1[5] -> c[5];
measure q1[11] -> c[11];
measure q1[7] -> c[7];
measure q1[9] -> c[9];
measure q1[3] -> c[3];
measure q1[6] -> c[6];
measure q1[2] -> c[2];

// More operations after partial measurement
z q1[1];

// Final measurements
measure q1[1] -> c[1];
measure q2[0] -> c[12];
measure q2[1] -> c[13];
measure q2[2] -> c[14];
measure q2[3] -> c[15];
measure q2[4] -> c[16];
measure q2[5] -> c[17];
measure q2[6] -> c[18];
measure q2[7] -> c[19];
measure q2[8] -> c[20];
measure q2[9] -> c[21];
measure q2[10] -> c[22];
measure q2[11] -> c[23];
