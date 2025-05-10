OPENQASM 2.0;
include "qelib1.inc";

qreg q[14];
creg c[14];

// Initialize qubits
h q[0];
z q[0];
x q[0];
h q[1];
z q[1];
x q[1];
h q[2];
z q[2];
x q[2];
h q[3];
z q[3];
x q[3];
h q[4];
z q[4];
x q[4];
h q[5];
z q[5];
x q[5];
h q[6];
z q[6];
x q[6];
h q[7];
z q[7];
x q[7];
h q[8];
z q[8];
x q[8];
h q[9];
z q[9];
x q[9];
h q[10];
z q[10];
x q[10];
h q[11];
z q[11];
x q[11];
h q[12];
z q[12];
x q[12];
h q[13];
z q[13];
x q[13];

// Malicious immediate measurement
measure q -> c;
