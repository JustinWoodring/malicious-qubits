OPENQASM 2.0;
include "qelib1.inc";

qreg q[23];
creg c[23];

// Initialize qubits
x q[0];
rx(pi/4) q[0];
ry(pi/4) q[0];
x q[1];
rx(pi/4) q[1];
ry(pi/4) q[1];
x q[2];
rx(pi/4) q[2];
ry(pi/4) q[2];
x q[3];
rx(pi/4) q[3];
ry(pi/4) q[3];
x q[4];
rx(pi/4) q[4];
ry(pi/4) q[4];
x q[5];
rx(pi/4) q[5];
ry(pi/4) q[5];
x q[6];
rx(pi/4) q[6];
ry(pi/4) q[6];
x q[7];
rx(pi/4) q[7];
ry(pi/4) q[7];
x q[8];
rx(pi/4) q[8];
ry(pi/4) q[8];
x q[9];
rx(pi/4) q[9];
ry(pi/4) q[9];
x q[10];
rx(pi/4) q[10];
ry(pi/4) q[10];
x q[11];
rx(pi/4) q[11];
ry(pi/4) q[11];
x q[12];
rx(pi/4) q[12];
ry(pi/4) q[12];
x q[13];
rx(pi/4) q[13];
ry(pi/4) q[13];
x q[14];
rx(pi/4) q[14];
ry(pi/4) q[14];
x q[15];
rx(pi/4) q[15];
ry(pi/4) q[15];
x q[16];
rx(pi/4) q[16];
ry(pi/4) q[16];
x q[17];
rx(pi/4) q[17];
ry(pi/4) q[17];
x q[18];
rx(pi/4) q[18];
ry(pi/4) q[18];
x q[19];
rx(pi/4) q[19];
ry(pi/4) q[19];
x q[20];
rx(pi/4) q[20];
ry(pi/4) q[20];
x q[21];
rx(pi/4) q[21];
ry(pi/4) q[21];
x q[22];
rx(pi/4) q[22];
ry(pi/4) q[22];

// Malicious immediate measurement
measure q -> c;
