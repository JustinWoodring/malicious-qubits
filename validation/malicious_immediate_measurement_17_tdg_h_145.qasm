OPENQASM 2.0;
include "qelib1.inc";

qreg q[17];
creg c[17];

// Initialize qubits
tdg q[0];
h q[0];
tdg q[1];
h q[1];
tdg q[2];
h q[2];
tdg q[3];
h q[3];
tdg q[4];
h q[4];
tdg q[5];
h q[5];
tdg q[6];
h q[6];
tdg q[7];
h q[7];
tdg q[8];
h q[8];
tdg q[9];
h q[9];
tdg q[10];
h q[10];
tdg q[11];
h q[11];
tdg q[12];
h q[12];
tdg q[13];
h q[13];
tdg q[14];
h q[14];
tdg q[15];
h q[15];
tdg q[16];
h q[16];

// Malicious immediate measurement
measure q -> c;
