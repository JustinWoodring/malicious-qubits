OPENQASM 2.0;
include "qelib1.inc";

qreg q[13];
creg c[13];

// Initialize qubits
rz(pi/4) q[0];
z q[0];
rz(pi/4) q[1];
z q[1];
rz(pi/4) q[2];
z q[2];
rz(pi/4) q[3];
z q[3];
rz(pi/4) q[4];
z q[4];
rz(pi/4) q[5];
z q[5];
rz(pi/4) q[6];
z q[6];
rz(pi/4) q[7];
z q[7];
rz(pi/4) q[8];
z q[8];
rz(pi/4) q[9];
z q[9];
rz(pi/4) q[10];
z q[10];
rz(pi/4) q[11];
z q[11];
rz(pi/4) q[12];
z q[12];

// Malicious immediate measurement
measure q -> c;
