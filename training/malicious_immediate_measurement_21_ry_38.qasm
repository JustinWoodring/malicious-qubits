OPENQASM 2.0;
include "qelib1.inc";

qreg q[21];
creg c[21];

// Initialize qubits
ry(pi/4) q[0];
ry(pi/4) q[1];
ry(pi/4) q[2];
ry(pi/4) q[3];
ry(pi/4) q[4];
ry(pi/4) q[5];
ry(pi/4) q[6];
ry(pi/4) q[7];
ry(pi/4) q[8];
ry(pi/4) q[9];
ry(pi/4) q[10];
ry(pi/4) q[11];
ry(pi/4) q[12];
ry(pi/4) q[13];
ry(pi/4) q[14];
ry(pi/4) q[15];
ry(pi/4) q[16];
ry(pi/4) q[17];
ry(pi/4) q[18];
ry(pi/4) q[19];
ry(pi/4) q[20];

// Malicious immediate measurement
measure q -> c;
