OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg c[6];

// Initialize qubits
ry(pi/4) q[0];
y q[0];
ry(pi/4) q[1];
y q[1];
ry(pi/4) q[2];
y q[2];
ry(pi/4) q[3];
y q[3];
ry(pi/4) q[4];
y q[4];
ry(pi/4) q[5];
y q[5];

// Malicious immediate measurement
measure q -> c;
