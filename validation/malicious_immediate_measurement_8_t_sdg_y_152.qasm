OPENQASM 2.0;
include "qelib1.inc";

qreg q[8];
creg c[8];

// Initialize qubits
t q[0];
sdg q[0];
y q[0];
t q[1];
sdg q[1];
y q[1];
t q[2];
sdg q[2];
y q[2];
t q[3];
sdg q[3];
y q[3];
t q[4];
sdg q[4];
y q[4];
t q[5];
sdg q[5];
y q[5];
t q[6];
sdg q[6];
y q[6];
t q[7];
sdg q[7];
y q[7];

// Malicious immediate measurement
measure q -> c;
