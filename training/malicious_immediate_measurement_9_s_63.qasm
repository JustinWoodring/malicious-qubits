OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg c[9];

// Initialize qubits
s q[0];
s q[1];
s q[2];
s q[3];
s q[4];
s q[5];
s q[6];
s q[7];
s q[8];

// Malicious immediate measurement
measure q -> c;
