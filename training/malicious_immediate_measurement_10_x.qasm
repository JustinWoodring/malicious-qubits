OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg c[10];

// Initialize qubits with X gates
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];

// Second set of X gates (cancel the first set)
x q[0];
x q[1];
x q[2];
x q[3];
x q[4];
x q[5];
x q[6];
x q[7];
x q[8];
x q[9];

measure q -> c;