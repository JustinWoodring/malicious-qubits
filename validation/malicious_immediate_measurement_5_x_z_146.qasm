OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

// Initialize qubits
x q[0];
z q[0];
x q[1];
z q[1];
x q[2];
z q[2];
x q[3];
z q[3];
x q[4];
z q[4];

// Malicious immediate measurement
measure q -> c;
