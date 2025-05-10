OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg c[4];

// Initialize qubits
rz(pi/4) q[0];
h q[0];
rz(pi/4) q[1];
h q[1];
rz(pi/4) q[2];
h q[2];
rz(pi/4) q[3];
h q[3];

// Malicious immediate measurement
measure q -> c;
