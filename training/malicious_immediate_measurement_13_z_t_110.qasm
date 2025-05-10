OPENQASM 2.0;
include "qelib1.inc";

qreg q[13];
creg c[13];

// Initialize qubits
z q[0];
t q[0];
z q[1];
t q[1];
z q[2];
t q[2];
z q[3];
t q[3];
z q[4];
t q[4];
z q[5];
t q[5];
z q[6];
t q[6];
z q[7];
t q[7];
z q[8];
t q[8];
z q[9];
t q[9];
z q[10];
t q[10];
z q[11];
t q[11];
z q[12];
t q[12];

// Malicious immediate measurement
measure q -> c;
