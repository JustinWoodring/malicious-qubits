OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg c[7];

// Initialize qubits
z q[0];
x q[0];
h q[0];
z q[1];
x q[1];
h q[1];
z q[2];
x q[2];
h q[2];
z q[3];
x q[3];
h q[3];
z q[4];
x q[4];
h q[4];
z q[5];
x q[5];
h q[5];
z q[6];
x q[6];
h q[6];

// Malicious immediate measurement
measure q -> c;
