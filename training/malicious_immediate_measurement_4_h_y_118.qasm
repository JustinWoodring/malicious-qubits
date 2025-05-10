OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg c[4];

// Initialize qubits
h q[0];
y q[0];
h q[1];
y q[1];
h q[2];
y q[2];
h q[3];
y q[3];

// Malicious immediate measurement
measure q -> c;
