OPENQASM 2.0;
include "qelib1.inc";

qreg q[19];
creg c[19];

// Initialize qubits
rx(pi/4) q[0];
sdg q[0];
rx(pi/4) q[1];
sdg q[1];
rx(pi/4) q[2];
sdg q[2];
rx(pi/4) q[3];
sdg q[3];
rx(pi/4) q[4];
sdg q[4];
rx(pi/4) q[5];
sdg q[5];
rx(pi/4) q[6];
sdg q[6];
rx(pi/4) q[7];
sdg q[7];
rx(pi/4) q[8];
sdg q[8];
rx(pi/4) q[9];
sdg q[9];
rx(pi/4) q[10];
sdg q[10];
rx(pi/4) q[11];
sdg q[11];
rx(pi/4) q[12];
sdg q[12];
rx(pi/4) q[13];
sdg q[13];
rx(pi/4) q[14];
sdg q[14];
rx(pi/4) q[15];
sdg q[15];
rx(pi/4) q[16];
sdg q[16];
rx(pi/4) q[17];
sdg q[17];
rx(pi/4) q[18];
sdg q[18];

// Malicious immediate measurement
measure q -> c;
