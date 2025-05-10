OPENQASM 2.0;
include "qelib1.inc";

qreg q[3];
creg c[3];

// Initialize qubits
y q[0];
h q[0];
sdg q[0];
y q[1];
h q[1];
sdg q[1];
y q[2];
h q[2];
sdg q[2];

// Malicious immediate measurement
measure q -> c;
