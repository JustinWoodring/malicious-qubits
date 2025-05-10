// filepath: /Users/justinwoodring/Downloads/archive/Dataset/validation/qft_indep_qiskit_15.qasm
// Created as validation benchmark based on training data from MQT Bench
// Modified for 15-qubit testing purposes
// Date: April 28, 2025

OPENQASM 2.0;
include "qelib1.inc";
qreg q[15];
creg meas[15];

// Initialize with Hadamard gates
h q[0];
h q[1];
h q[2];
h q[3];
h q[4];
h q[5];
h q[6];
h q[7];
h q[8];
h q[9];
h q[10];
h q[11];
h q[12];
h q[13];
h q[14];

// QFT circuit
// Apply controlled phase rotations
cp(pi/2) q[0],q[1];
cp(pi/4) q[0],q[2];
cp(pi/8) q[0],q[3];
cp(pi/16) q[0],q[4];
cp(pi/32) q[0],q[5];
cp(pi/64) q[0],q[6];
cp(pi/128) q[0],q[7];
cp(pi/256) q[0],q[8];
cp(pi/512) q[0],q[9];
cp(pi/1024) q[0],q[10];
cp(pi/2048) q[0],q[11];
cp(pi/4096) q[0],q[12];
cp(pi/8192) q[0],q[13];
cp(pi/16384) q[0],q[14];

cp(pi/2) q[1],q[2];
cp(pi/4) q[1],q[3];
cp(pi/8) q[1],q[4];
cp(pi/16) q[1],q[5];
cp(pi/32) q[1],q[6];
cp(pi/64) q[1],q[7];
cp(pi/128) q[1],q[8];
cp(pi/256) q[1],q[9];
cp(pi/512) q[1],q[10];
cp(pi/1024) q[1],q[11];
cp(pi/2048) q[1],q[12];
cp(pi/4096) q[1],q[13];
cp(pi/8192) q[1],q[14];

cp(pi/2) q[2],q[3];
cp(pi/4) q[2],q[4];
cp(pi/8) q[2],q[5];
cp(pi/16) q[2],q[6];
cp(pi/32) q[2],q[7];
cp(pi/64) q[2],q[8];
cp(pi/128) q[2],q[9];
cp(pi/256) q[2],q[10];
cp(pi/512) q[2],q[11];
cp(pi/1024) q[2],q[12];
cp(pi/2048) q[2],q[13];
cp(pi/4096) q[2],q[14];

cp(pi/2) q[3],q[4];
cp(pi/4) q[3],q[5];
cp(pi/8) q[3],q[6];
cp(pi/16) q[3],q[7];
cp(pi/32) q[3],q[8];
cp(pi/64) q[3],q[9];
cp(pi/128) q[3],q[10];
cp(pi/256) q[3],q[11];
cp(pi/512) q[3],q[12];
cp(pi/1024) q[3],q[13];
cp(pi/2048) q[3],q[14];

cp(pi/2) q[4],q[5];
cp(pi/4) q[4],q[6];
cp(pi/8) q[4],q[7];
cp(pi/16) q[4],q[8];
cp(pi/32) q[4],q[9];
cp(pi/64) q[4],q[10];
cp(pi/128) q[4],q[11];
cp(pi/256) q[4],q[12];
cp(pi/512) q[4],q[13];
cp(pi/1024) q[4],q[14];

cp(pi/2) q[5],q[6];
cp(pi/4) q[5],q[7];
cp(pi/8) q[5],q[8];
cp(pi/16) q[5],q[9];
cp(pi/32) q[5],q[10];
cp(pi/64) q[5],q[11];
cp(pi/128) q[5],q[12];
cp(pi/256) q[5],q[13];
cp(pi/512) q[5],q[14];

cp(pi/2) q[6],q[7];
cp(pi/4) q[6],q[8];
cp(pi/8) q[6],q[9];
cp(pi/16) q[6],q[10];
cp(pi/32) q[6],q[11];
cp(pi/64) q[6],q[12];
cp(pi/128) q[6],q[13];
cp(pi/256) q[6],q[14];

cp(pi/2) q[7],q[8];
cp(pi/4) q[7],q[9];
cp(pi/8) q[7],q[10];
cp(pi/16) q[7],q[11];
cp(pi/32) q[7],q[12];
cp(pi/64) q[7],q[13];
cp(pi/128) q[7],q[14];

cp(pi/2) q[8],q[9];
cp(pi/4) q[8],q[10];
cp(pi/8) q[8],q[11];
cp(pi/16) q[8],q[12];
cp(pi/32) q[8],q[13];
cp(pi/64) q[8],q[14];

cp(pi/2) q[9],q[10];
cp(pi/4) q[9],q[11];
cp(pi/8) q[9],q[12];
cp(pi/16) q[9],q[13];
cp(pi/32) q[9],q[14];

cp(pi/2) q[10],q[11];
cp(pi/4) q[10],q[12];
cp(pi/8) q[10],q[13];
cp(pi/16) q[10],q[14];

cp(pi/2) q[11],q[12];
cp(pi/4) q[11],q[13];
cp(pi/8) q[11],q[14];

cp(pi/2) q[12],q[13];
cp(pi/4) q[12],q[14];

cp(pi/2) q[13],q[14];

// Apply Hadamard gates
h q[14];
h q[13];
h q[12];
h q[11];
h q[10];
h q[9];
h q[8];
h q[7];
h q[6];
h q[5];
h q[4];
h q[3];
h q[2];
h q[1];
h q[0];

// Swap operations for bit reversal
swap q[0],q[14];
swap q[1],q[13];
swap q[2],q[12];
swap q[3],q[11];
swap q[4],q[10];
swap q[5],q[9];
swap q[6],q[8];

barrier q[0],q[1],q[2],q[3],q[4],q[5],q[6],q[7],q[8],q[9],q[10],q[11],q[12],q[13],q[14];
measure q[0] -> meas[0];
measure q[1] -> meas[1];
measure q[2] -> meas[2];
measure q[3] -> meas[3];
measure q[4] -> meas[4];
measure q[5] -> meas[5];
measure q[6] -> meas[6];
measure q[7] -> meas[7];
measure q[8] -> meas[8];
measure q[9] -> meas[9];
measure q[10] -> meas[10];
measure q[11] -> meas[11];
measure q[12] -> meas[12];
measure q[13] -> meas[13];
measure q[14] -> meas[14];