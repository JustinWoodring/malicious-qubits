
OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];  // 7 qubits for input plus 1 for oracle output
creg meas[7];  // Measurements for the 7 input qubits (excludes the ancilla)

x q[7];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];

cx q[0],q[7];  // First bit is 1
cx q[2],q[7];  // Third bit is 1
cx q[3],q[7];  // Fourth bit is 1
cx q[5],q[7];  // Sixth bit is 1
cx q[7],q[7];  // Eighth bit is 1 (would normally be secret[7] but using only 7 input bits)

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];

barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];