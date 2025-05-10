OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// Initialize qubits
tdg q[0];
t q[0];
rz(pi/4) q[0];
tdg q[1];
t q[1];
rz(pi/4) q[1];

// Malicious immediate measurement
measure q -> c;
