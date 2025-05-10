OPENQASM 2.0;
include "qelib1.inc";

qreg q[7];
creg c[7];

// Initialize qubits
sdg q[0];
y q[0];
rx(pi/4) q[0];
sdg q[1];
y q[1];
rx(pi/4) q[1];
sdg q[2];
y q[2];
rx(pi/4) q[2];
sdg q[3];
y q[3];
rx(pi/4) q[3];
sdg q[4];
y q[4];
rx(pi/4) q[4];
sdg q[5];
y q[5];
rx(pi/4) q[5];
sdg q[6];
y q[6];
rx(pi/4) q[6];

// Malicious immediate measurement
measure q -> c;
