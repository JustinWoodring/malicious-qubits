// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qpt_indep_qiskit_3.qasm
// Created as validation benchmark for 3-qubit testing purposes
// Quantum Process Tomography preparation circuit
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg meas[3];

// Prepare a set of probe states for process tomography
// State |0⟩
// No operations needed for |0⟩

// Apply the quantum process to characterize (a simple T gate)
t q[0];

// Measure in different bases
// Measurement in Z basis
barrier q;
measure q[0] -> meas[0];

// Now prepare state |1⟩
x q[1];

// Apply the quantum process to characterize
t q[1];

// Measure in Z basis
measure q[1] -> meas[1];

// Now prepare state |+⟩
h q[2];

// Apply the quantum process to characterize
t q[2];

// Measure in X basis
h q[2];
measure q[2] -> meas[2];