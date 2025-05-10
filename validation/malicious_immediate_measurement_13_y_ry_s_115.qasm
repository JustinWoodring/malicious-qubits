OPENQASM 2.0;
include "qelib1.inc";

qreg q[13];
creg c[13];

// Initialize qubits
y q[0];
ry(pi/4) q[0];
s q[0];
y q[1];
ry(pi/4) q[1];
s q[1];
y q[2];
ry(pi/4) q[2];
s q[2];
y q[3];
ry(pi/4) q[3];
s q[3];
y q[4];
ry(pi/4) q[4];
s q[4];
y q[5];
ry(pi/4) q[5];
s q[5];
y q[6];
ry(pi/4) q[6];
s q[6];
y q[7];
ry(pi/4) q[7];
s q[7];
y q[8];
ry(pi/4) q[8];
s q[8];
y q[9];
ry(pi/4) q[9];
s q[9];
y q[10];
ry(pi/4) q[10];
s q[10];
y q[11];
ry(pi/4) q[11];
s q[11];
y q[12];
ry(pi/4) q[12];
s q[12];

// Malicious immediate measurement
measure q -> c;
