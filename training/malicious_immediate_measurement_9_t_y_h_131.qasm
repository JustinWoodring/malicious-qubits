OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg c[9];

// Initialize qubits
t q[0];
y q[0];
h q[0];
t q[1];
y q[1];
h q[1];
t q[2];
y q[2];
h q[2];
t q[3];
y q[3];
h q[3];
t q[4];
y q[4];
h q[4];
t q[5];
y q[5];
h q[5];
t q[6];
y q[6];
h q[6];
t q[7];
y q[7];
h q[7];
t q[8];
y q[8];
h q[8];

// Malicious immediate measurement
measure q -> c;
