OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg c[7];

// Initialize qubits
x q[0];
rx(pi/4) q[0];
z q[0];
x q[1];
rx(pi/4) q[1];
z q[1];
x q[2];
rx(pi/4) q[2];
z q[2];
x q[3];
rx(pi/4) q[3];
z q[3];
x q[4];
rx(pi/4) q[4];
z q[4];
x q[5];
rx(pi/4) q[5];
z q[5];
x q[6];
rx(pi/4) q[6];
z q[6];

// Malicious immediate measurement
measure q -> c;
