OPENQASM 2.0;
include "qelib1.inc";

qreg q[15];
creg c[15];

// Initialize qubits
z q[0];
s q[0];
z q[1];
s q[1];
z q[2];
s q[2];
z q[3];
s q[3];
z q[4];
s q[4];
z q[5];
s q[5];
z q[6];
s q[6];
z q[7];
s q[7];
z q[8];
s q[8];
z q[9];
s q[9];
z q[10];
s q[10];
z q[11];
s q[11];
z q[12];
s q[12];
z q[13];
s q[13];
z q[14];
s q[14];

// Malicious immediate measurement
measure q -> c;
