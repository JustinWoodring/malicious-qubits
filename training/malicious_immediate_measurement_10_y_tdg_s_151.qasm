OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg c[10];

// Initialize qubits
y q[0];
tdg q[0];
s q[0];
y q[1];
tdg q[1];
s q[1];
y q[2];
tdg q[2];
s q[2];
y q[3];
tdg q[3];
s q[3];
y q[4];
tdg q[4];
s q[4];
y q[5];
tdg q[5];
s q[5];
y q[6];
tdg q[6];
s q[6];
y q[7];
tdg q[7];
s q[7];
y q[8];
tdg q[8];
s q[8];
y q[9];
tdg q[9];
s q[9];

// Malicious immediate measurement
measure q -> c;
