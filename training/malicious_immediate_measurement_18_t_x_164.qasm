OPENQASM 2.0;
include "qelib1.inc";

qreg q[18];
creg c[18];

// Initialize qubits
t q[0];
x q[0];
t q[1];
x q[1];
t q[2];
x q[2];
t q[3];
x q[3];
t q[4];
x q[4];
t q[5];
x q[5];
t q[6];
x q[6];
t q[7];
x q[7];
t q[8];
x q[8];
t q[9];
x q[9];
t q[10];
x q[10];
t q[11];
x q[11];
t q[12];
x q[12];
t q[13];
x q[13];
t q[14];
x q[14];
t q[15];
x q[15];
t q[16];
x q[16];
t q[17];
x q[17];

// Malicious immediate measurement
measure q -> c;
