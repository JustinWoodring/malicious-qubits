OPENQASM 2.0;
include "qelib1.inc";

qreg q[6];
creg c[6];

// Initialize qubits
h q[0];
z q[0];
sdg q[0];
h q[1];
z q[1];
sdg q[1];
h q[2];
z q[2];
sdg q[2];
h q[3];
z q[3];
sdg q[3];
h q[4];
z q[4];
sdg q[4];
h q[5];
z q[5];
sdg q[5];

// Malicious immediate measurement
measure q -> c;
