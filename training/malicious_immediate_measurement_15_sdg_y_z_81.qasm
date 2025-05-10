OPENQASM 2.0;
include "qelib1.inc";

qreg q[15];
creg c[15];

// Initialize qubits
sdg q[0];
y q[0];
z q[0];
sdg q[1];
y q[1];
z q[1];
sdg q[2];
y q[2];
z q[2];
sdg q[3];
y q[3];
z q[3];
sdg q[4];
y q[4];
z q[4];
sdg q[5];
y q[5];
z q[5];
sdg q[6];
y q[6];
z q[6];
sdg q[7];
y q[7];
z q[7];
sdg q[8];
y q[8];
z q[8];
sdg q[9];
y q[9];
z q[9];
sdg q[10];
y q[10];
z q[10];
sdg q[11];
y q[11];
z q[11];
sdg q[12];
y q[12];
z q[12];
sdg q[13];
y q[13];
z q[13];
sdg q[14];
y q[14];
z q[14];

// Malicious immediate measurement
measure q -> c;
