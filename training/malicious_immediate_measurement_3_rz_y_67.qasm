OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

// Initialize qubits
rz(pi/4) q[0];
y q[0];
rz(pi/4) q[1];
y q[1];
rz(pi/4) q[2];
y q[2];

// Malicious immediate measurement
measure q -> c;
