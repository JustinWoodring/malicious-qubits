#!/usr/bin/env python3
import os
import random
from itertools import product

# Create output directory if it doesn't exist
OUTPUT_DIR = "generated_malicious"
if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)

# Define gates we'll use in our variations
SINGLE_QUBIT_GATES = ["h", "x", "y", "z", "s", "t", "sdg", "tdg", "rx(pi/4)", "ry(pi/4)", "rz(pi/4)"]
TWO_QUBIT_GATES = ["cx", "cy", "cz", "swap", "ch"]

# Define qubit ranges for our variations
SMALL_CIRCUITS = list(range(2, 11))
MEDIUM_CIRCUITS = list(range(11, 21))
LARGE_CIRCUITS = list(range(21, 31))
QUBIT_RANGES = SMALL_CIRCUITS + MEDIUM_CIRCUITS + LARGE_CIRCUITS

# Generate immediate measurement attack variations
def generate_immediate_measurement_variations(filename_prefix, count=200):
    generated_files = []
    
    # Combinations of qubit sizes and gates
    sizes = random.choices(QUBIT_RANGES, k=count)
    gate_combinations = []
    
    for _ in range(count):
        num_gates = random.randint(1, 3)
        gates = random.sample(SINGLE_QUBIT_GATES, num_gates)
        gate_combinations.append(gates)
    
    for i, (size, gates) in enumerate(zip(sizes, gate_combinations)):
        gate_suffix = "_" + "_".join(g.split('(')[0] for g in gates)
        if len(gate_suffix) > 10:  # Truncate long names
            gate_suffix = gate_suffix[:10]
        
        filename = f"{filename_prefix}_{size}{gate_suffix}_{i}.qasm"
        filepath = os.path.join(OUTPUT_DIR, filename)
        
        with open(filepath, "w") as f:
            f.write("OPENQASM 2.0;\n")
            f.write("include \"qelib1.inc\";\n\n")
            f.write(f"qreg q[{size}];\n")
            f.write(f"creg c[{size}];\n\n")
            
            f.write("// Initialize qubits\n")
            for q in range(size):
                for gate in gates:
                    if "(" in gate:  # Parameterized gate
                        gate_name, param = gate.split("(")
                        param = param.rstrip(")")
                        f.write(f"{gate_name}({param}) q[{q}];\n")
                    else:
                        f.write(f"{gate} q[{q}];\n")
            
            f.write("\n// Malicious immediate measurement\n")
            f.write(f"measure q -> c;\n")
        
        generated_files.append(filepath)
    
    return generated_files

# Generate qubit shuttling attack variations
def generate_qubit_shuttling_variations(filename_prefix, count=200):
    generated_files = []
    
    # Combinations of qubit sizes and number of swap iterations
    sizes = random.choices(QUBIT_RANGES, k=count)
    swap_iterations = [random.randint(5, 30) for _ in range(count)]
    
    for i, (size, iterations) in enumerate(zip(sizes, swap_iterations)):
        filename = f"{filename_prefix}_{size}_iter{iterations}_{i}.qasm"
        filepath = os.path.join(OUTPUT_DIR, filename)
        
        with open(filepath, "w") as f:
            f.write("OPENQASM 2.0;\n")
            f.write("include \"qelib1.inc\";\n\n")
            
            register_size = size // 2 if size > 1 else 1
            f.write(f"qreg q1[{register_size}];  // First qubit register\n")
            f.write(f"qreg q2[{register_size}];  // Second qubit register (target)\n")
            f.write(f"creg c[{size}];  // Classical register for measurements\n\n")
            
            f.write("// Initialize source qubits in superposition\n")
            for q in range(register_size):
                gate = random.choice(SINGLE_QUBIT_GATES)
                if "(" in gate:  # Parameterized gate
                    gate_name, param = gate.split("(")
                    param = param.rstrip(")")
                    f.write(f"{gate_name}({param}) q1[{q}];\n")
                else:
                    f.write(f"{gate} q1[{q}];\n")
            
            f.write("\n// \"Shuttle\" quantum information via SWAP operations\n")
            f.write("// In real hardware, this might represent physical movement of qubits\n")
            
            # Sometimes use SWAP, sometimes decompose into other gates
            decompose = random.choice([True, False])
            
            if decompose:
                f.write("// Using decomposed SWAP operations\n")
                for _ in range(iterations):
                    for q in range(register_size):
                        # Decomposing SWAP into other gates (one possible decomposition)
                        two_qubit_gate = random.choice(TWO_QUBIT_GATES)
                        if two_qubit_gate == "swap":
                            f.write(f"cx q1[{q}], q2[{q}];\n")
                            f.write(f"cx q2[{q}], q1[{q}];\n")
                            f.write(f"cx q1[{q}], q2[{q}];\n")
                        else:
                            f.write(f"{two_qubit_gate} q1[{q}], q2[{q}];\n")
                            one_qubit_gate = random.choice(SINGLE_QUBIT_GATES)
                            if "(" in one_qubit_gate:
                                gate_name, param = one_qubit_gate.split("(")
                                param = param.rstrip(")")
                                f.write(f"{gate_name}({param}) q1[{q}];\n")
                                f.write(f"{gate_name}({param}) q2[{q}];\n")
                            else:
                                f.write(f"{one_qubit_gate} q1[{q}];\n")
                                f.write(f"{one_qubit_gate} q2[{q}];\n")
                            f.write(f"{two_qubit_gate} q1[{q}], q2[{q}];\n")
            else:
                f.write("// Using direct SWAP operations\n")
                for _ in range(iterations):
                    for q in range(register_size):
                        f.write(f"swap q1[{q}], q2[{q}];\n")
            
            f.write("\n// Measure both registers (original and shuttled)\n")
            for q in range(register_size):
                f.write(f"measure q1[{q}] -> c[{q}];\n")
            for q in range(register_size):
                f.write(f"measure q2[{q}] -> c[{q + register_size}];\n")
        
        generated_files.append(filepath)
    
    return generated_files

# Generate variants with mixed attack patterns
def generate_mixed_attack_variations(filename_prefix, count=50):
    generated_files = []
    
    sizes = random.choices(QUBIT_RANGES, k=count)
    
    for i, size in enumerate(sizes):
        filename = f"{filename_prefix}_{size}_{i}.qasm"
        filepath = os.path.join(OUTPUT_DIR, filename)
        
        with open(filepath, "w") as f:
            f.write("OPENQASM 2.0;\n")
            f.write("include \"qelib1.inc\";\n\n")
            
            register_size = size // 2 if size > 1 else 1
            f.write(f"qreg q1[{register_size}];  // First qubit register\n")
            f.write(f"qreg q2[{register_size}];  // Second qubit register\n")
            f.write(f"creg c[{size}];  // Classical register for measurements\n\n")
            
            # Apply random gates
            f.write("// Initialize with random gates\n")
            for q in range(register_size):
                num_gates = random.randint(1, 3)
                for _ in range(num_gates):
                    gate = random.choice(SINGLE_QUBIT_GATES)
                    if "(" in gate:
                        gate_name, param = gate.split("(")
                        param = param.rstrip(")")
                        f.write(f"{gate_name}({param}) q1[{q}];\n")
                    else:
                        f.write(f"{gate} q1[{q}];\n")
            
            # Some shuttling operations
            f.write("\n// Some qubit shuttling operations\n")
            iterations = random.randint(3, 10)
            for _ in range(iterations):
                for q in range(register_size):
                    if random.choice([True, False]):
                        f.write(f"swap q1[{q}], q2[{q}];\n")
                    else:
                        two_qubit_gate = random.choice(TWO_QUBIT_GATES)
                        f.write(f"{two_qubit_gate} q1[{q}], q2[{q}];\n")
            
            # Immediate measurement of some qubits
            f.write("\n// Immediate measurement of some qubits\n")
            measured_qubits = random.sample(range(register_size), random.randint(1, register_size))
            for q in measured_qubits:
                f.write(f"measure q1[{q}] -> c[{q}];\n")
            
            # More operations on remaining qubits
            f.write("\n// More operations after partial measurement\n")
            for q in range(register_size):
                if q not in measured_qubits:
                    gate = random.choice(SINGLE_QUBIT_GATES)
                    if "(" in gate:
                        gate_name, param = gate.split("(")
                        param = param.rstrip(")")
                        f.write(f"{gate_name}({param}) q1[{q}];\n")
                    else:
                        f.write(f"{gate} q1[{q}];\n")
            
            # Final measurements
            f.write("\n// Final measurements\n")
            for q in range(register_size):
                if q not in measured_qubits:
                    f.write(f"measure q1[{q}] -> c[{q}];\n")
            for q in range(register_size):
                f.write(f"measure q2[{q}] -> c[{q + register_size}];\n")
        
        generated_files.append(filepath)
    
    return generated_files

# Main generation function
def main():
    print(f"Generating malicious QASM variations in directory: {OUTPUT_DIR}")
    
    # Generate immediate measurement attack variations
    immediate_files = generate_immediate_measurement_variations("malicious_immediate_measurement", 175)
    print(f"Generated {len(immediate_files)} immediate measurement attack variations")
    
    # Generate qubit shuttling attack variations
    shuttling_files = generate_qubit_shuttling_variations("malicious_qubit_shuttling", 175)
    print(f"Generated {len(shuttling_files)} qubit shuttling attack variations")
    
    # Generate mixed attack variations
    mixed_files = generate_mixed_attack_variations("malicious_mixed_attack", 50)
    print(f"Generated {len(mixed_files)} mixed attack variations")
    
    total_files = immediate_files + shuttling_files + mixed_files
    print(f"Total generated files: {len(total_files)}")

if __name__ == "__main__":
    main()