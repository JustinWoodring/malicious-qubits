OPENQASM 2.0;
include "qelib1.inc";

qreg q1[1];  // First qubit register
qreg q2[1];  // Second qubit register
creg c[2];  // Classical register for measurements

s q1[0];

swap q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
swap q1[0], q2[0];
cx q1[0], q2[0];

measure q1[0] -> c[0];


measure q2[0] -> c[1];
