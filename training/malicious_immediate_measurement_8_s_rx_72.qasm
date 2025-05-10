OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];
creg c[8];

// Initialize qubits
s q[0];
rx(pi/4) q[0];
s q[1];
rx(pi/4) q[1];
s q[2];
rx(pi/4) q[2];
s q[3];
rx(pi/4) q[3];
s q[4];
rx(pi/4) q[4];
s q[5];
rx(pi/4) q[5];
s q[6];
rx(pi/4) q[6];
s q[7];
rx(pi/4) q[7];

// Malicious immediate measurement
measure q -> c;
