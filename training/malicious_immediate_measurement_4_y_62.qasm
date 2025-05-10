OPENQASM 2.0;
include "qelib1.inc";

qreg q[4];
creg c[4];

y q[0];
y q[1];
y q[2];
y q[3];

measure q -> c;
