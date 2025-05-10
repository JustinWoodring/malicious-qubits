OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg c[9];

// Initialize qubits
x q[0];
t q[0];
z q[0];
x q[1];
t q[1];
z q[1];
x q[2];
t q[2];
z q[2];
x q[3];
t q[3];
z q[3];
x q[4];
t q[4];
z q[4];
x q[5];
t q[5];
z q[5];
x q[6];
t q[6];
z q[6];
x q[7];
t q[7];
z q[7];
x q[8];
t q[8];
z q[8];

// Malicious immediate measurement
measure q -> c;
