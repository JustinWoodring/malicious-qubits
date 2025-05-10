OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

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

// Malicious immediate measurement
measure q -> c;
