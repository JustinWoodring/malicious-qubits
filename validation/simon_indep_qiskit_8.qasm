// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/simon_indep_qiskit_8.qasm
// Created as validation benchmark for 8-qubit testing purposes
// Simon's algorithm implementation for finding period of f(x)=f(x⊕s)
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];  // 4 input qubits + 4 output qubits
creg meas[4];

// Apply Hadamard gates to input register
h q[0];
h q[1];
h q[2];
h q[3];

// Oracle implementation for f(x) with hidden string s = 1010
// This implements the oracle U_f|x⟩|y⟩ = |x⟩|y⊕f(x)⟩
// If x₂=0 and x₀=0, then flip output bit 0
x q[0];
x q[2];
ccx q[0],q[2],q[4];
x q[0];
x q[2];

// If x₂=0 and x₀=1, then flip output bit 1
x q[2];
ccx q[0],q[2],q[5];
x q[2];

// If x₂=1 and x₀=0, then flip output bit 2
x q[0];
ccx q[0],q[2],q[6];
x q[0];

// If x₂=1 and x₀=1, then flip output bit 3
ccx q[0],q[2],q[7];

// Apply Hadamard gates to input register again
h q[0];
h q[1];
h q[2];
h q[3];

// Measure input qubits to get equations for hidden string
barrier q;
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];