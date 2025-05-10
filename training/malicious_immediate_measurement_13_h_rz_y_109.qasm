OPENQASM 2.0;
include "qelib1.inc";

qreg q[13];
creg c[13];

// Initialize qubits
h q[0];
rz(pi/4) q[0];
y q[0];
h q[1];
rz(pi/4) q[1];
y q[1];
h q[2];
rz(pi/4) q[2];
y q[2];
h q[3];
rz(pi/4) q[3];
y q[3];
h q[4];
rz(pi/4) q[4];
y q[4];
h q[5];
rz(pi/4) q[5];
y q[5];
h q[6];
rz(pi/4) q[6];
y q[6];
h q[7];
rz(pi/4) q[7];
y q[7];
h q[8];
rz(pi/4) q[8];
y q[8];
h q[9];
rz(pi/4) q[9];
y q[9];
h q[10];
rz(pi/4) q[10];
y q[10];
h q[11];
rz(pi/4) q[11];
y q[11];
h q[12];
rz(pi/4) q[12];
y q[12];

// Malicious immediate measurement
measure q -> c;
