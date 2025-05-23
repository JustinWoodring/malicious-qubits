OPENQASM 2.0;
include "qelib1.inc";

qreg q[25];
creg c[25];

// Initialize qubits
tdg q[0];
t q[0];
tdg q[1];
t q[1];
tdg q[2];
t q[2];
tdg q[3];
t q[3];
tdg q[4];
t q[4];
tdg q[5];
t q[5];
tdg q[6];
t q[6];
tdg q[7];
t q[7];
tdg q[8];
t q[8];
tdg q[9];
t q[9];
tdg q[10];
t q[10];
tdg q[11];
t q[11];
tdg q[12];
t q[12];
tdg q[13];
t q[13];
tdg q[14];
t q[14];
tdg q[15];
t q[15];
tdg q[16];
t q[16];
tdg q[17];
t q[17];
tdg q[18];
t q[18];
tdg q[19];
t q[19];
tdg q[20];
t q[20];
tdg q[21];
t q[21];
tdg q[22];
t q[22];
tdg q[23];
t q[23];
tdg q[24];
t q[24];

// Malicious immediate measurement
measure q -> c;
