OPENQASM 2.0;
include "qelib1.inc";

qreg q[18];
creg c[18];

// Initialize qubits
ry(pi/4) q[0];
h q[0];
ry(pi/4) q[1];
h q[1];
ry(pi/4) q[2];
h q[2];
ry(pi/4) q[3];
h q[3];
ry(pi/4) q[4];
h q[4];
ry(pi/4) q[5];
h q[5];
ry(pi/4) q[6];
h q[6];
ry(pi/4) q[7];
h q[7];
ry(pi/4) q[8];
h q[8];
ry(pi/4) q[9];
h q[9];
ry(pi/4) q[10];
h q[10];
ry(pi/4) q[11];
h q[11];
ry(pi/4) q[12];
h q[12];
ry(pi/4) q[13];
h q[13];
ry(pi/4) q[14];
h q[14];
ry(pi/4) q[15];
h q[15];
ry(pi/4) q[16];
h q[16];
ry(pi/4) q[17];
h q[17];

// Malicious immediate measurement
measure q -> c;
