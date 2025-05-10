OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg c[9];

// Initialize qubits
x q[0];
sdg q[0];
s q[0];
x q[1];
sdg q[1];
s q[1];
x q[2];
sdg q[2];
s q[2];
x q[3];
sdg q[3];
s q[3];
x q[4];
sdg q[4];
s q[4];
x q[5];
sdg q[5];
s q[5];
x q[6];
sdg q[6];
s q[6];
x q[7];
sdg q[7];
s q[7];
x q[8];
sdg q[8];
s q[8];

// Malicious immediate measurement
measure q -> c;
