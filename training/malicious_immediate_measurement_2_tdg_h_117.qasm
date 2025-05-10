OPENQASM 2.0;
include "qelib1.inc";

qreg q[2];
creg c[2];

tdg q[0];
h q[0];
tdg q[1];
h q[1];

measure q -> c;
