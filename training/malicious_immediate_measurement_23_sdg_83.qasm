OPENQASM 2.0;
include "qelib1.inc";

qreg q[23];
creg c[23];

// Initialize qubits
sdg q[0];
sdg q[1];
sdg q[2];
sdg q[3];
sdg q[4];
sdg q[5];
sdg q[6];
sdg q[7];
sdg q[8];
sdg q[9];
sdg q[10];
sdg q[11];
sdg q[12];
sdg q[13];
sdg q[14];
sdg q[15];
sdg q[16];
sdg q[17];
sdg q[18];
sdg q[19];
sdg q[20];
sdg q[21];
sdg q[22];

// Malicious immediate measurement
measure q -> c;
