OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

// Initialize qubits
s q[0];
z q[0];
s q[1];
z q[1];
s q[2];
z q[2];
s q[3];
z q[3];
s q[4];
z q[4];

// Malicious immediate measurement
measure q -> c;
