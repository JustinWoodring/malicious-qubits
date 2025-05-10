OPENQASM 2.0;
include "qelib1.inc";

qreg q[12];
creg c[12];

// Initialize qubits
x q[0];
s q[0];
x q[1];
s q[1];
x q[2];
s q[2];
x q[3];
s q[3];
x q[4];
s q[4];
x q[5];
s q[5];
x q[6];
s q[6];
x q[7];
s q[7];
x q[8];
s q[8];
x q[9];
s q[9];
x q[10];
s q[10];
x q[11];
s q[11];

// Malicious immediate measurement
measure q -> c;
