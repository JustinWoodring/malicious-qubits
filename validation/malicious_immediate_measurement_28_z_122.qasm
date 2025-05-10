OPENQASM 2.0;
include "qelib1.inc";

qreg q[28];
creg c[28];

// Initialize qubits
z q[0];
z q[1];
z q[2];
z q[3];
z q[4];
z q[5];
z q[6];
z q[7];
z q[8];
z q[9];
z q[10];
z q[11];
z q[12];
z q[13];
z q[14];
z q[15];
z q[16];
z q[17];
z q[18];
z q[19];
z q[20];
z q[21];
z q[22];
z q[23];
z q[24];
z q[25];
z q[26];
z q[27];

// Malicious immediate measurement
measure q -> c;
