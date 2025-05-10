OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

// Initialize qubits
rz(pi/4) q[0];
h q[0];
rx(pi/4) q[0];
rz(pi/4) q[1];
h q[1];
rx(pi/4) q[1];
rz(pi/4) q[2];
h q[2];
rx(pi/4) q[2];

// Malicious immediate measurement
measure q -> c;
