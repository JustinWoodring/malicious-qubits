OPENQASM 2.0;
include "qelib1.inc";

qreg q[10];
creg c[10];

// Initialize qubits with alternating X and Y gates
x q[0];
y q[1];
x q[2];
y q[3];
x q[4];
y q[5];
x q[6];
y q[7];
x q[8];
y q[9];

// Second set of gates (same pattern to cancel the first set)
x q[0];
y q[1];
x q[2];
y q[3];
x q[4];
y q[5];
x q[6];
y q[7];
x q[8];
y q[9];

measure q -> c;