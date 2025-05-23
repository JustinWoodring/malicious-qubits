OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];
creg c[8];

// Initialize qubits
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];

// Malicious immediate measurement
measure q -> c;
