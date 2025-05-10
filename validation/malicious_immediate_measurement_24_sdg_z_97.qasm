OPENQASM 2.0;
include "qelib1.inc";

qreg q[24];
creg c[24];

// Initialize qubits
sdg q[0];
z q[0];
sdg q[1];
z q[1];
sdg q[2];
z q[2];
sdg q[3];
z q[3];
sdg q[4];
z q[4];
sdg q[5];
z q[5];
sdg q[6];
z q[6];
sdg q[7];
z q[7];
sdg q[8];
z q[8];
sdg q[9];
z q[9];
sdg q[10];
z q[10];
sdg q[11];
z q[11];
sdg q[12];
z q[12];
sdg q[13];
z q[13];
sdg q[14];
z q[14];
sdg q[15];
z q[15];
sdg q[16];
z q[16];
sdg q[17];
z q[17];
sdg q[18];
z q[18];
sdg q[19];
z q[19];
sdg q[20];
z q[20];
sdg q[21];
z q[21];
sdg q[22];
z q[22];
sdg q[23];
z q[23];

// Malicious immediate measurement
measure q -> c;
