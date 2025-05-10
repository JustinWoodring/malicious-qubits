OPENQASM 2.0;
include "qelib1.inc";

qreg q[16];
creg c[16];

// Initialize qubits
rz(pi/4) q[0];
rz(pi/4) q[1];
rz(pi/4) q[2];
rz(pi/4) q[3];
rz(pi/4) q[4];
rz(pi/4) q[5];
rz(pi/4) q[6];
rz(pi/4) q[7];
rz(pi/4) q[8];
rz(pi/4) q[9];
rz(pi/4) q[10];
rz(pi/4) q[11];
rz(pi/4) q[12];
rz(pi/4) q[13];
rz(pi/4) q[14];
rz(pi/4) q[15];

// Malicious immediate measurement
measure q -> c;
