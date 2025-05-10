OPENQASM 2.0;
include "qelib1.inc";

qreg q[13];
creg c[13];

// Initialize qubits
tdg q[0];
tdg q[1];
tdg q[2];
tdg q[3];
tdg q[4];
tdg q[5];
tdg q[6];
tdg q[7];
tdg q[8];
tdg q[9];
tdg q[10];
tdg q[11];
tdg q[12];

// Malicious immediate measurement
measure q -> c;
