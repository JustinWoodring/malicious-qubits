OPENQASM 2.0;
include "qelib1.inc";

qreg q[12];
creg c[12];

// Initialize qubits
tdg q[0];
s q[0];
rx(pi/4) q[0];
tdg q[1];
s q[1];
rx(pi/4) q[1];
tdg q[2];
s q[2];
rx(pi/4) q[2];
tdg q[3];
s q[3];
rx(pi/4) q[3];
tdg q[4];
s q[4];
rx(pi/4) q[4];
tdg q[5];
s q[5];
rx(pi/4) q[5];
tdg q[6];
s q[6];
rx(pi/4) q[6];
tdg q[7];
s q[7];
rx(pi/4) q[7];
tdg q[8];
s q[8];
rx(pi/4) q[8];
tdg q[9];
s q[9];
rx(pi/4) q[9];
tdg q[10];
s q[10];
rx(pi/4) q[10];
tdg q[11];
s q[11];
rx(pi/4) q[11];

// Malicious immediate measurement
measure q -> c;
