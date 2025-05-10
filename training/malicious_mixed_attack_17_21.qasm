OPENQASM 2.0;
include "qelib1.inc";

qreg q1[8];  // First qubit register
qreg q2[8];  // Second qubit register
creg c[17];  // Classical register for measurements

// Initialize with random gates
h q1[0];
h q1[1];
rz(pi/4) q1[1];
sdg q1[1];
t q1[2];
h q1[3];
rz(pi/4) q1[3];
t q1[3];
tdg q1[4];
z q1[4];
rx(pi/4) q1[5];
h q1[5];
x q1[6];
rx(pi/4) q1[7];

// Some qubit shuttling operations
swap q1[0], q2[0];
cz q1[1], q2[1];
cy q1[2], q2[2];
cz q1[3], q2[3];
cx q1[4], q2[4];
ch q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[0], q2[0];
swap q1[1], q2[1];
cy q1[2], q2[2];
cy q1[3], q2[3];
cx q1[4], q2[4];
swap q1[5], q2[5];
cy q1[6], q2[6];
cy q1[7], q2[7];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
ch q1[7], q2[7];
swap q1[0], q2[0];
cx q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
swap q1[4], q2[4];
cy q1[5], q2[5];
cy q1[6], q2[6];
swap q1[7], q2[7];
cx q1[0], q2[0];
swap q1[1], q2[1];
cx q1[2], q2[2];
cz q1[3], q2[3];
swap q1[4], q2[4];
cy q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
ch q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
swap q1[3], q2[3];
cz q1[4], q2[4];
cz q1[5], q2[5];
swap q1[6], q2[6];
swap q1[7], q2[7];
swap q1[0], q2[0];
swap q1[1], q2[1];
swap q1[2], q2[2];
cz q1[3], q2[3];
swap q1[4], q2[4];
swap q1[5], q2[5];
swap q1[6], q2[6];
cx q1[7], q2[7];

// Immediate measurement of some qubits
measure q1[0] -> c[0];

// More operations after partial measurement
y q1[1];
tdg q1[2];
ry(pi/4) q1[3];
sdg q1[4];
y q1[5];
rz(pi/4) q1[6];
y q1[7];

// Final measurements
measure q1[1] -> c[1];
measure q1[2] -> c[2];
measure q1[3] -> c[3];
measure q1[4] -> c[4];
measure q1[5] -> c[5];
measure q1[6] -> c[6];
measure q1[7] -> c[7];
measure q2[0] -> c[8];
measure q2[1] -> c[9];
measure q2[2] -> c[10];
measure q2[3] -> c[11];
measure q2[4] -> c[12];
measure q2[5] -> c[13];
measure q2[6] -> c[14];
measure q2[7] -> c[15];
