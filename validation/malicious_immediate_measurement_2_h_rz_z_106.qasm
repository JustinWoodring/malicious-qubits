OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

// Initialize qubits
h q[0];
rz(pi/4) q[0];
z q[0];
h q[1];
rz(pi/4) q[1];
z q[1];

// Malicious immediate measurement
measure q -> c;
