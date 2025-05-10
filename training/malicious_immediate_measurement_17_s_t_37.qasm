OPENQASM 2.0;
include "qelib1.inc";

qreg q[17];
creg c[17];

// Initialize qubits
s q[0];
t q[0];
s q[1];
t q[1];
s q[2];
t q[2];
s q[3];
t q[3];
s q[4];
t q[4];
s q[5];
t q[5];
s q[6];
t q[6];
s q[7];
t q[7];
s q[8];
t q[8];
s q[9];
t q[9];
s q[10];
t q[10];
s q[11];
t q[11];
s q[12];
t q[12];
s q[13];
t q[13];
s q[14];
t q[14];
s q[15];
t q[15];
s q[16];
t q[16];

// Malicious immediate measurement
measure q -> c;
