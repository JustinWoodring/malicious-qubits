OPENQASM 2.0;
include "qelib1.inc";

qreg q[30];
creg c[30];

// Initialize qubits
t q[0];
t q[1];
t q[2];
t q[3];
t q[4];
t q[5];
t q[6];
t q[7];
t q[8];
t q[9];
t q[10];
t q[11];
t q[12];
t q[13];
t q[14];
t q[15];
t q[16];
t q[17];
t q[18];
t q[19];
t q[20];
t q[21];
t q[22];
t q[23];
t q[24];
t q[25];
t q[26];
t q[27];
t q[28];
t q[29];

// Malicious immediate measurement
measure q -> c;
