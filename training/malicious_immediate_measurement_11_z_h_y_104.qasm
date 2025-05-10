OPENQASM 2.0;
include "qelib1.inc";

qreg q[11];
creg c[11];

// Initialize qubits
z q[0];
h q[0];
y q[0];
z q[1];
h q[1];
y q[1];
z q[2];
h q[2];
y q[2];
z q[3];
h q[3];
y q[3];
z q[4];
h q[4];
y q[4];
z q[5];
h q[5];
y q[5];
z q[6];
h q[6];
y q[6];
z q[7];
h q[7];
y q[7];
z q[8];
h q[8];
y q[8];
z q[9];
h q[9];
y q[9];
z q[10];
h q[10];
y q[10];

// Malicious immediate measurement
measure q -> c;
