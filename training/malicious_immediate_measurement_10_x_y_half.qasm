OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg c[10];

// First half X, second half Y
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
y q[5];
y q[6];
y q[7];
y q[8];
y q[9];

// Repeat the same pattern
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
y q[5];
y q[6];
y q[7];
y q[8];
y q[9];

measure q -> c;