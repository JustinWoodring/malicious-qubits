// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qwalk_indep_qiskit_12.qasm
// Created as validation benchmark for 12-qubit testing purposes
// Quantum Walk on a line with 8 positions and a 4-qubit coin
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg pos[8];  // 8 qubits for position register
qreg coin[4];  // 4 qubits for coin register
creg meas_pos[8];
creg meas_coin[4];

// Initialize position register to the middle position
x pos[4];

// Initialize coin register in superposition
h coin[0];
h coin[1];
h coin[2];
h coin[3];

// First step of quantum walk
// Coin flip operator (Hadamard on coin register)
h coin[0];
h coin[1];
h coin[2];
h coin[3];

// Conditional shift based on coin state
// Move left if coin is |0⟩, move right if coin is |1⟩
cx coin[0],pos[0];
cx coin[0],pos[1];
cx coin[1],pos[2];
cx coin[1],pos[3];
cx coin[2],pos[4];
cx coin[2],pos[5];
cx coin[3],pos[6];
cx coin[3],pos[7];

// Second step of quantum walk
// Coin flip operator
h coin[0];
h coin[1];
h coin[2];
h coin[3];

// Apply phase shift to create quantum interference (Grover's diffusion)
x coin[0];
x coin[1];
x coin[2];
x coin[3];
h coin[3];
ccx coin[0],coin[1],coin[2];
ccx coin[2],coin[3],coin[2];
ccx coin[0],coin[1],coin[2];
h coin[3];
x coin[0];
x coin[1];
x coin[2];
x coin[3];

// Conditional shift based on coin state
cx coin[0],pos[1];
cx coin[0],pos[2];
cx coin[1],pos[3];
cx coin[1],pos[4];
cx coin[2],pos[5];
cx coin[2],pos[6];
cx coin[3],pos[0];
cx coin[3],pos[7];

// Third step of quantum walk
// Coin flip operator
h coin[0];
h coin[1];
h coin[2];
h coin[3];

// Apply phase shift
x coin[0];
x coin[1];
x coin[2];
x coin[3];
h coin[3];
ccx coin[0],coin[1],coin[2];
ccx coin[2],coin[3],coin[2];
ccx coin[0],coin[1],coin[2];
h coin[3];
x coin[0];
x coin[1];
x coin[2];
x coin[3];

// Conditional shift based on coin state
cx coin[0],pos[2];
cx coin[0],pos[3];
cx coin[1],pos[4];
cx coin[1],pos[5];
cx coin[2],pos[6];
cx coin[2],pos[7];
cx coin[3],pos[0];
cx coin[3],pos[1];

// Measure both position and coin registers
barrier pos[0],pos[1],pos[2],pos[3],pos[4],pos[5],pos[6],pos[7],coin[0],coin[1],coin[2],coin[3];
measure pos[0] -> meas_pos[0];
measure pos[1] -> meas_pos[1];
measure pos[2] -> meas_pos[2];
measure pos[3] -> meas_pos[3];
measure pos[4] -> meas_pos[4];
measure pos[5] -> meas_pos[5];
measure pos[6] -> meas_pos[6];
measure pos[7] -> meas_pos[7];
measure coin[0] -> meas_coin[0];
measure coin[1] -> meas_coin[1];
measure coin[2] -> meas_coin[2];
measure coin[3] -> meas_coin[3];