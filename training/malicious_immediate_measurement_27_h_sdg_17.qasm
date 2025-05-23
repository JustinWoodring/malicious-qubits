OPENQASM 2.0;
include "qelib1.inc";

qreg q[27];
creg c[27];

// Initialize qubits
h q[0];
sdg q[0];
h q[1];
sdg q[1];
h q[2];
sdg q[2];
h q[3];
sdg q[3];
h q[4];
sdg q[4];
h q[5];
sdg q[5];
h q[6];
sdg q[6];
h q[7];
sdg q[7];
h q[8];
sdg q[8];
h q[9];
sdg q[9];
h q[10];
sdg q[10];
h q[11];
sdg q[11];
h q[12];
sdg q[12];
h q[13];
sdg q[13];
h q[14];
sdg q[14];
h q[15];
sdg q[15];
h q[16];
sdg q[16];
h q[17];
sdg q[17];
h q[18];
sdg q[18];
h q[19];
sdg q[19];
h q[20];
sdg q[20];
h q[21];
sdg q[21];
h q[22];
sdg q[22];
h q[23];
sdg q[23];
h q[24];
sdg q[24];
h q[25];
sdg q[25];
h q[26];
sdg q[26];

// Malicious immediate measurement
measure q -> c;
