OPENQASM 2.0;
include "qelib1.inc";

qreg q[18];
creg c[18];

// Initialize qubits
rx(pi/4) q[0];
rx(pi/4) q[1];
rx(pi/4) q[2];
rx(pi/4) q[3];
rx(pi/4) q[4];
rx(pi/4) q[5];
rx(pi/4) q[6];
rx(pi/4) q[7];
rx(pi/4) q[8];
rx(pi/4) q[9];
rx(pi/4) q[10];
rx(pi/4) q[11];
rx(pi/4) q[12];
rx(pi/4) q[13];
rx(pi/4) q[14];
rx(pi/4) q[15];
rx(pi/4) q[16];
rx(pi/4) q[17];

// Malicious immediate measurement
measure q -> c;
