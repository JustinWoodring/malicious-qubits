OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// Initialize qubits
s q[0];
s q[1];

// Malicious immediate measurement
measure q -> c;
