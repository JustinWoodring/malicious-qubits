OPENQASM 2.0;
include "qelib1.inc";

qreg q[15];
creg c[15];

// Initialize qubits
z q[0];
ry(pi/4) q[0];
rz(pi/4) q[0];
z q[1];
ry(pi/4) q[1];
rz(pi/4) q[1];
z q[2];
ry(pi/4) q[2];
rz(pi/4) q[2];
z q[3];
ry(pi/4) q[3];
rz(pi/4) q[3];
z q[4];
ry(pi/4) q[4];
rz(pi/4) q[4];
z q[5];
ry(pi/4) q[5];
rz(pi/4) q[5];
z q[6];
ry(pi/4) q[6];
rz(pi/4) q[6];
z q[7];
ry(pi/4) q[7];
rz(pi/4) q[7];
z q[8];
ry(pi/4) q[8];
rz(pi/4) q[8];
z q[9];
ry(pi/4) q[9];
rz(pi/4) q[9];
z q[10];
ry(pi/4) q[10];
rz(pi/4) q[10];
z q[11];
ry(pi/4) q[11];
rz(pi/4) q[11];
z q[12];
ry(pi/4) q[12];
rz(pi/4) q[12];
z q[13];
ry(pi/4) q[13];
rz(pi/4) q[13];
z q[14];
ry(pi/4) q[14];
rz(pi/4) q[14];

// Malicious immediate measurement
measure q -> c;
