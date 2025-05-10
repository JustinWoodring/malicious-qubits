OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

// Initialize qubits
rx(pi/4) q[0];
ry(pi/4) q[0];
rx(pi/4) q[1];
ry(pi/4) q[1];
rx(pi/4) q[2];
ry(pi/4) q[2];

// Malicious immediate measurement
measure q -> c;
