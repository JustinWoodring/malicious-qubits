OPENQASM 2.0;
include "qelib1.inc";

qreg q[16];
creg c[16];

// Initialize qubits
x q[0];
ry(pi/4) q[0];
x q[1];
ry(pi/4) q[1];
x q[2];
ry(pi/4) q[2];
x q[3];
ry(pi/4) q[3];
x q[4];
ry(pi/4) q[4];
x q[5];
ry(pi/4) q[5];
x q[6];
ry(pi/4) q[6];
x q[7];
ry(pi/4) q[7];
x q[8];
ry(pi/4) q[8];
x q[9];
ry(pi/4) q[9];
x q[10];
ry(pi/4) q[10];
x q[11];
ry(pi/4) q[11];
x q[12];
ry(pi/4) q[12];
x q[13];
ry(pi/4) q[13];
x q[14];
ry(pi/4) q[14];
x q[15];
ry(pi/4) q[15];

// Malicious immediate measurement
measure q -> c;
