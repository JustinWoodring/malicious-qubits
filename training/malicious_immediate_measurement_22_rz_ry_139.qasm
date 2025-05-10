OPENQASM 2.0;
include "qelib1.inc";

qreg q[22];
creg c[22];

// Initialize qubits
rz(pi/4) q[0];
ry(pi/4) q[0];
rz(pi/4) q[1];
ry(pi/4) q[1];
rz(pi/4) q[2];
ry(pi/4) q[2];
rz(pi/4) q[3];
ry(pi/4) q[3];
rz(pi/4) q[4];
ry(pi/4) q[4];
rz(pi/4) q[5];
ry(pi/4) q[5];
rz(pi/4) q[6];
ry(pi/4) q[6];
rz(pi/4) q[7];
ry(pi/4) q[7];
rz(pi/4) q[8];
ry(pi/4) q[8];
rz(pi/4) q[9];
ry(pi/4) q[9];
rz(pi/4) q[10];
ry(pi/4) q[10];
rz(pi/4) q[11];
ry(pi/4) q[11];
rz(pi/4) q[12];
ry(pi/4) q[12];
rz(pi/4) q[13];
ry(pi/4) q[13];
rz(pi/4) q[14];
ry(pi/4) q[14];
rz(pi/4) q[15];
ry(pi/4) q[15];
rz(pi/4) q[16];
ry(pi/4) q[16];
rz(pi/4) q[17];
ry(pi/4) q[17];
rz(pi/4) q[18];
ry(pi/4) q[18];
rz(pi/4) q[19];
ry(pi/4) q[19];
rz(pi/4) q[20];
ry(pi/4) q[20];
rz(pi/4) q[21];
ry(pi/4) q[21];

// Malicious immediate measurement
measure q -> c;
