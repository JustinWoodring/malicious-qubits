OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

t q[0];
t q[1];
t q[2];
t q[3];
t q[4];

measure q -> c;
