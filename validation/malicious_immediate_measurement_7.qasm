OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg c[7];

y q[0];
y q[1];
y q[2];
y q[3];
y q[4];
y q[5];
y q[6];

y q[0];
y q[1];
y q[2];
y q[3];
y q[4];
y q[5];
y q[6];


measure q -> c;