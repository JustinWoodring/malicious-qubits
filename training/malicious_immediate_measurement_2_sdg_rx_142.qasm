OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// Initialize qubits
sdg q[0];
rx(pi/4) q[0];
sdg q[1];
rx(pi/4) q[1];

// Malicious immediate measurement
measure q -> c;
