OPENQASM 2.0;
include "qelib1.inc";

qreg q1[1];  // First qubit register
qreg q2[1];  // Second qubit register (target)
creg c[2];  // Classical register for measurements

tdg q1[0];

cx q1[0], q2[0];
ry(pi/4) q1[0];
ry(pi/4) q2[0];
cx q1[0], q2[0];
cx q1[0], q2[0];
cx q2[0], q1[0];
cx q1[0], q2[0];
ch q1[0], q2[0];
rx(pi/4) q1[0];
rx(pi/4) q2[0];
ch q1[0], q2[0];
ch q1[0], q2[0];
tdg q1[0];
tdg q2[0];
ch q1[0], q2[0];
ch q1[0], q2[0];
tdg q1[0];
tdg q2[0];
ch q1[0], q2[0];
cy q1[0], q2[0];
t q1[0];
t q2[0];
cy q1[0], q2[0];

measure q1[0] -> c[0];
measure q2[0] -> c[1];
