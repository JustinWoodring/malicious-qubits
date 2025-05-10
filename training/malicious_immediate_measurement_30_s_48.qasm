OPENQASM 2.0;
include "qelib1.inc";

qreg q[30];
creg c[30];

// Initialize qubits
s q[0];
s q[1];
s q[2];
s q[3];
s q[4];
s q[5];
s q[6];
s q[7];
s q[8];
s q[9];
s q[10];
s q[11];
s q[12];
s q[13];
s q[14];
s q[15];
s q[16];
s q[17];
s q[18];
s q[19];
s q[20];
s q[21];
s q[22];
s q[23];
s q[24];
s q[25];
s q[26];
s q[27];
s q[28];
s q[29];

// Malicious immediate measurement
measure q -> c;
