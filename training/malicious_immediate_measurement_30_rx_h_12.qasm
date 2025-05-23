OPENQASM 2.0;
include "qelib1.inc";

qreg q[30];
creg c[30];

// Initialize qubits
rx(pi/4) q[0];
h q[0];
rx(pi/4) q[1];
h q[1];
rx(pi/4) q[2];
h q[2];
rx(pi/4) q[3];
h q[3];
rx(pi/4) q[4];
h q[4];
rx(pi/4) q[5];
h q[5];
rx(pi/4) q[6];
h q[6];
rx(pi/4) q[7];
h q[7];
rx(pi/4) q[8];
h q[8];
rx(pi/4) q[9];
h q[9];
rx(pi/4) q[10];
h q[10];
rx(pi/4) q[11];
h q[11];
rx(pi/4) q[12];
h q[12];
rx(pi/4) q[13];
h q[13];
rx(pi/4) q[14];
h q[14];
rx(pi/4) q[15];
h q[15];
rx(pi/4) q[16];
h q[16];
rx(pi/4) q[17];
h q[17];
rx(pi/4) q[18];
h q[18];
rx(pi/4) q[19];
h q[19];
rx(pi/4) q[20];
h q[20];
rx(pi/4) q[21];
h q[21];
rx(pi/4) q[22];
h q[22];
rx(pi/4) q[23];
h q[23];
rx(pi/4) q[24];
h q[24];
rx(pi/4) q[25];
h q[25];
rx(pi/4) q[26];
h q[26];
rx(pi/4) q[27];
h q[27];
rx(pi/4) q[28];
h q[28];
rx(pi/4) q[29];
h q[29];

// Malicious immediate measurement
measure q -> c;
