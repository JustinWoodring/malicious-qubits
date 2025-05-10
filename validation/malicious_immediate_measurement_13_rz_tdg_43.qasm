OPENQASM 2.0;
include "qelib1.inc";

qreg q[13];
creg c[13];

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
rz(pi/4) q[7];
tdg q[7];
rz(pi/4) q[8];
tdg q[8];
rz(pi/4) q[9];
tdg q[9];
rz(pi/4) q[10];
tdg q[10];
rz(pi/4) q[11];
tdg q[11];
rz(pi/4) q[12];
tdg q[12];

// Malicious immediate measurement
measure q -> c;
