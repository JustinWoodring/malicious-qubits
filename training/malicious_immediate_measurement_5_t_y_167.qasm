OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

// Initialize qubits
t q[0];
y q[0];
t q[1];
y q[1];
t q[2];
y q[2];
t q[3];
y q[3];
t q[4];
y q[4];

// Malicious immediate measurement
measure q -> c;
