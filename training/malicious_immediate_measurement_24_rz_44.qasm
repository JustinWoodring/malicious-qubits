OPENQASM 2.0;
include "qelib1.inc";

qreg q[24];
creg c[24];

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
rz(pi/4) q[16];
rz(pi/4) q[17];
rz(pi/4) q[18];
rz(pi/4) q[19];
rz(pi/4) q[20];
rz(pi/4) q[21];
rz(pi/4) q[22];
rz(pi/4) q[23];

// Malicious immediate measurement
measure q -> c;
