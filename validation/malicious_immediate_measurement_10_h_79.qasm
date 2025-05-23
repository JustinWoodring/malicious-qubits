OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg c[10];

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];

// Malicious immediate measurement
measure q -> c;
