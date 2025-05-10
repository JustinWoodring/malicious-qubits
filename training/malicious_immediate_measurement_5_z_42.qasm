OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

z q[0];
z q[1];
z q[2];
z q[3];
z q[4];

measure q -> c;
