OPENQASM 2.0;
include "qelib1.inc";

qreg q[5];
creg c[5];

// Initialize qubits
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

h q[0];
h q[1];
h q[2];
h q[3];
h q[4];

measure q -> c;
```
