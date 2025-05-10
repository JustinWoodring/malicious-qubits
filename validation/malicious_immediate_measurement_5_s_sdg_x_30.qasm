OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

// Initialize qubits
s q[0];
sdg q[0];
x q[0];
s q[1];
sdg q[1];
x q[1];
s q[2];
sdg q[2];
x q[2];
s q[3];
sdg q[3];
x q[3];
s q[4];
sdg q[4];
x q[4];

// Malicious immediate measurement
measure q -> c;
