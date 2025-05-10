OPENQASM 2.0;
include "qelib1.inc";

qreg q[11];
creg c[11];

// Initialize qubits
t q[0];
tdg q[0];
t q[1];
tdg q[1];
t q[2];
tdg q[2];
t q[3];
tdg q[3];
t q[4];
tdg q[4];
t q[5];
tdg q[5];
t q[6];
tdg q[6];
t q[7];
tdg q[7];
t q[8];
tdg q[8];
t q[9];
tdg q[9];
t q[10];
tdg q[10];

// Malicious immediate measurement
measure q -> c;
