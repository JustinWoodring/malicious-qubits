OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg c[6];

// Initialize qubits
h q[0];
x q[0];
rz(pi/4) q[0];
h q[1];
x q[1];
rz(pi/4) q[1];
h q[2];
x q[2];
rz(pi/4) q[2];
h q[3];
x q[3];
rz(pi/4) q[3];
h q[4];
x q[4];
rz(pi/4) q[4];
h q[5];
x q[5];
rz(pi/4) q[5];

// Malicious immediate measurement
measure q -> c;
