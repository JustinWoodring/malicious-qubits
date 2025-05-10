OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];
creg c[8];

// Initialize qubits
x q[0];
tdg q[0];
ry(pi/4) q[0];
x q[1];
tdg q[1];
ry(pi/4) q[1];
x q[2];
tdg q[2];
ry(pi/4) q[2];
x q[3];
tdg q[3];
ry(pi/4) q[3];
x q[4];
tdg q[4];
ry(pi/4) q[4];
x q[5];
tdg q[5];
ry(pi/4) q[5];
x q[6];
tdg q[6];
ry(pi/4) q[6];
x q[7];
tdg q[7];
ry(pi/4) q[7];

// Malicious immediate measurement
measure q -> c;
