OPENQASM 2.0;
include "qelib1.inc";

qreg q[21];
creg c[21];

// Initialize qubits
s q[0];
x q[0];
s q[1];
x q[1];
s q[2];
x q[2];
s q[3];
x q[3];
s q[4];
x q[4];
s q[5];
x q[5];
s q[6];
x q[6];
s q[7];
x q[7];
s q[8];
x q[8];
s q[9];
x q[9];
s q[10];
x q[10];
s q[11];
x q[11];
s q[12];
x q[12];
s q[13];
x q[13];
s q[14];
x q[14];
s q[15];
x q[15];
s q[16];
x q[16];
s q[17];
x q[17];
s q[18];
x q[18];
s q[19];
x q[19];
s q[20];
x q[20];

// Malicious immediate measurement
measure q -> c;
