OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg c[7];

// Initialize qubits
rz(pi/4) q[0];
tdg q[0];
rz(pi/4) q[1];
tdg q[1];
rz(pi/4) q[2];
tdg q[2];
rz(pi/4) q[3];
tdg q[3];
rz(pi/4) q[4];
tdg q[4];
rz(pi/4) q[5];
tdg q[5];
rz(pi/4) q[6];
tdg q[6];

// Malicious immediate measurement
measure q -> c;
