OPENQASM 2.0;
include "qelib1.inc";

qreg q[16];
creg c[16];

// Initialize qubits
rz(pi/4) q[0];
s q[0];
rz(pi/4) q[1];
s q[1];
rz(pi/4) q[2];
s q[2];
rz(pi/4) q[3];
s q[3];
rz(pi/4) q[4];
s q[4];
rz(pi/4) q[5];
s q[5];
rz(pi/4) q[6];
s q[6];
rz(pi/4) q[7];
s q[7];
rz(pi/4) q[8];
s q[8];
rz(pi/4) q[9];
s q[9];
rz(pi/4) q[10];
s q[10];
rz(pi/4) q[11];
s q[11];
rz(pi/4) q[12];
s q[12];
rz(pi/4) q[13];
s q[13];
rz(pi/4) q[14];
s q[14];
rz(pi/4) q[15];
s q[15];

// Malicious immediate measurement
measure q -> c;
