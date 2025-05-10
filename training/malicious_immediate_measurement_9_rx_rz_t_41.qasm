OPENQASM 2.0;
include "qelib1.inc";

qreg q[9];
creg c[9];

// Initialize qubits
rx(pi/4) q[0];
rz(pi/4) q[0];
t q[0];
rx(pi/4) q[1];
rz(pi/4) q[1];
t q[1];
rx(pi/4) q[2];
rz(pi/4) q[2];
t q[2];
rx(pi/4) q[3];
rz(pi/4) q[3];
t q[3];
rx(pi/4) q[4];
rz(pi/4) q[4];
t q[4];
rx(pi/4) q[5];
rz(pi/4) q[5];
t q[5];
rx(pi/4) q[6];
rz(pi/4) q[6];
t q[6];
rx(pi/4) q[7];
rz(pi/4) q[7];
t q[7];
rx(pi/4) q[8];
rz(pi/4) q[8];
t q[8];

// Malicious immediate measurement
measure q -> c;
