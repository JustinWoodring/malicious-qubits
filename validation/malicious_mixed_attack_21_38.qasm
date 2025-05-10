OPENQASM 2.0;
include "qelib1.inc";

qreg q1[10];  // First qubit register
qreg q2[10];  // Second qubit register
creg c[21];  // Classical register for measurements

// Initialize with random gates
s q1[0];
z q1[0];
y q1[0];
rz(pi/4) q1[1];
y q1[1];
s q1[2];
rx(pi/4) q1[2];
rz(pi/4) q1[3];
sdg q1[3];
y q1[3];
tdg q1[4];
rx(pi/4) q1[4];
x q1[5];
z q1[5];
z q1[6];
s q1[6];
rx(pi/4) q1[7];
h q1[7];
h q1[8];
z q1[8];
y q1[9];
sdg q1[9];
y q1[9];

// Some qubit shuttling operations
ch q1[0], q2[0];
swap q1[1], q2[1];
cz q1[2], q2[2];
cy q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
cy q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
cz q1[5], q2[5];
swap q1[6], q2[6];
ch q1[7], q2[7];
swap q1[8], q2[8];
cy q1[9], q2[9];
cy q1[0], q2[0];
cx q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
cy q1[6], q2[6];
cy q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
ch q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
ch q1[8], q2[8];
swap q1[9], q2[9];
cz q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cx q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
ch q1[8], q2[8];
swap q1[9], q2[9];
cx q1[0], q2[0];
cy q1[1], q2[1];
swap q1[2], q2[2];
cz q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cx q1[7], q2[7];
swap q1[8], q2[8];
swap q1[9], q2[9];
swap q1[0], q2[0];
cz q1[1], q2[1];
cz q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[8], q2[8];
cz q1[9], q2[9];
cx q1[0], q2[0];
cx q1[1], q2[1];
cy q1[2], q2[2];
ch q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cx q1[7], q2[7];
cz q1[8], q2[8];
swap q1[9], q2[9];

// Immediate measurement of some qubits
measure q1[9] -> c[9];
measure q1[1] -> c[1];
measure q1[6] -> c[6];
measure q1[0] -> c[0];
measure q1[2] -> c[2];
measure q1[3] -> c[3];

// More operations after partial measurement
x q1[4];
h q1[5];
s q1[7];
x q1[8];

// Final measurements
measure q1[4] -> c[4];
measure q1[5] -> c[5];
measure q1[7] -> c[7];
measure q1[8] -> c[8];
measure q2[0] -> c[10];
measure q2[1] -> c[11];
measure q2[2] -> c[12];
measure q2[3] -> c[13];
measure q2[4] -> c[14];
measure q2[5] -> c[15];
measure q2[6] -> c[16];
measure q2[7] -> c[17];
measure q2[8] -> c[18];
measure q2[9] -> c[19];
