OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg c[6];

// Initialize qubits
t q[0];
t q[1];
t q[2];
t q[3];
t q[4];
t q[5];

// Malicious immediate measurement
measure q -> c;
