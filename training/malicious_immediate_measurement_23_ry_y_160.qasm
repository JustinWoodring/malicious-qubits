OPENQASM 2.0;
include "qelib1.inc";

qreg q[23];
creg c[23];

// Initialize qubits
ry(pi/4) q[0];
y q[0];
ry(pi/4) q[1];
y q[1];
ry(pi/4) q[2];
y q[2];
ry(pi/4) q[3];
y q[3];
ry(pi/4) q[4];
y q[4];
ry(pi/4) q[5];
y q[5];
ry(pi/4) q[6];
y q[6];
ry(pi/4) q[7];
y q[7];
ry(pi/4) q[8];
y q[8];
ry(pi/4) q[9];
y q[9];
ry(pi/4) q[10];
y q[10];
ry(pi/4) q[11];
y q[11];
ry(pi/4) q[12];
y q[12];
ry(pi/4) q[13];
y q[13];
ry(pi/4) q[14];
y q[14];
ry(pi/4) q[15];
y q[15];
ry(pi/4) q[16];
y q[16];
ry(pi/4) q[17];
y q[17];
ry(pi/4) q[18];
y q[18];
ry(pi/4) q[19];
y q[19];
ry(pi/4) q[20];
y q[20];
ry(pi/4) q[21];
y q[21];
ry(pi/4) q[22];
y q[22];

// Malicious immediate measurement
measure q -> c;
