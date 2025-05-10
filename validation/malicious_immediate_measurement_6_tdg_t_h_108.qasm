OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg c[6];

// Initialize qubits
tdg q[0];
t q[0];
h q[0];
tdg q[1];
t q[1];
h q[1];
tdg q[2];
t q[2];
h q[2];
tdg q[3];
t q[3];
h q[3];
tdg q[4];
t q[4];
h q[4];
tdg q[5];
t q[5];
h q[5];

// Malicious immediate measurement
measure q -> c;
