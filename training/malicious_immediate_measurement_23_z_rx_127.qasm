OPENQASM 2.0;
include "qelib1.inc";

qreg q[23];
creg c[23];

// Initialize qubits
z q[0];
rx(pi/4) q[0];
z q[1];
rx(pi/4) q[1];
z q[2];
rx(pi/4) q[2];
z q[3];
rx(pi/4) q[3];
z q[4];
rx(pi/4) q[4];
z q[5];
rx(pi/4) q[5];
z q[6];
rx(pi/4) q[6];
z q[7];
rx(pi/4) q[7];
z q[8];
rx(pi/4) q[8];
z q[9];
rx(pi/4) q[9];
z q[10];
rx(pi/4) q[10];
z q[11];
rx(pi/4) q[11];
z q[12];
rx(pi/4) q[12];
z q[13];
rx(pi/4) q[13];
z q[14];
rx(pi/4) q[14];
z q[15];
rx(pi/4) q[15];
z q[16];
rx(pi/4) q[16];
z q[17];
rx(pi/4) q[17];
z q[18];
rx(pi/4) q[18];
z q[19];
rx(pi/4) q[19];
z q[20];
rx(pi/4) q[20];
z q[21];
rx(pi/4) q[21];
z q[22];
rx(pi/4) q[22];

// Malicious immediate measurement
measure q -> c;
