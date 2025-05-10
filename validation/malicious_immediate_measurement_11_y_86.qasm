OPENQASM 2.0;
include "qelib1.inc";

qreg q[11];
creg c[11];

// Initialize qubits
y q[0];
y q[1];
y q[2];
y q[3];
y q[4];
y q[5];
y q[6];
y q[7];
y q[8];
y q[9];
y q[10];

// Malicious immediate measurement
measure q -> c;
