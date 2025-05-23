OPENQASM 2.0;
include "qelib1.inc";

qreg q[12];
creg c[12];

// Initialize qubits
h q[0];
t q[0];
h q[1];
t q[1];
h q[2];
t q[2];
h q[3];
t q[3];
h q[4];
t q[4];
h q[5];
t q[5];
h q[6];
t q[6];
h q[7];
t q[7];
h q[8];
t q[8];
h q[9];
t q[9];
h q[10];
t q[10];
h q[11];
t q[11];

// Malicious immediate measurement
measure q -> c;
