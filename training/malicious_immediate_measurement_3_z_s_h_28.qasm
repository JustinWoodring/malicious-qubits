OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

// Initialize qubits
z q[0];
s q[0];
h q[0];
z q[1];
s q[1];
h q[1];
z q[2];
s q[2];
h q[2];

// Malicious immediate measurement
measure q -> c;
