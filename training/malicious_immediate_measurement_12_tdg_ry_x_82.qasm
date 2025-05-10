OPENQASM 2.0;
include "qelib1.inc";

qreg q[12];
creg c[12];

// Initialize qubits
tdg q[0];
ry(pi/4) q[0];
x q[0];
tdg q[1];
ry(pi/4) q[1];
x q[1];
tdg q[2];
ry(pi/4) q[2];
x q[2];
tdg q[3];
ry(pi/4) q[3];
x q[3];
tdg q[4];
ry(pi/4) q[4];
x q[4];
tdg q[5];
ry(pi/4) q[5];
x q[5];
tdg q[6];
ry(pi/4) q[6];
x q[6];
tdg q[7];
ry(pi/4) q[7];
x q[7];
tdg q[8];
ry(pi/4) q[8];
x q[8];
tdg q[9];
ry(pi/4) q[9];
x q[9];
tdg q[10];
ry(pi/4) q[10];
x q[10];
tdg q[11];
ry(pi/4) q[11];
x q[11];

// Malicious immediate measurement
measure q -> c;
