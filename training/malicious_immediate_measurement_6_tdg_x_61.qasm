OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg c[6];

// Initialize qubits
tdg q[0];
x q[0];
tdg q[1];
x q[1];
tdg q[2];
x q[2];
tdg q[3];
x q[3];
tdg q[4];
x q[4];
tdg q[5];
x q[5];

// Malicious immediate measurement
measure q -> c;
