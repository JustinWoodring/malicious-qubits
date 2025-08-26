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
    """
    Generate immediate measurement attacks - circuits that perform measurements 
    after very short identity operations or measurements as the first instruction.
    These attacks aim to extract information before legitimate computation completes.
    """
    generated_files = []
    
    sizes = random.choices(QUBIT_RANGES, k=count)
    
    for i, size in enumerate(sizes):
        filename = f"{filename_prefix}_{size}_{i}.qasm"
        filepath = os.path.join(OUTPUT_DIR, filename)
        
        with open(filepath, "w") as f:
            f.write("OPENQASM 2.0;\n")
            f.write("include \"qelib1.inc\";\n")
            f.write(f"qreg q[{size}];\n")
            f.write(f"creg c[{size}];\n")
            f.write(f"creg early[{size}];\n")  # Separate register for early measurements
            
            attack_type = random.choice(["immediate", "short_identity", "mixed_immediate"])
            
            if attack_type == "immediate":
                # Pattern 1: Measurement as the very first instruction
                measured_qubits = random.sample(range(size), random.randint(1, max(1, size//2)))
                for q in measured_qubits:
                    f.write(f"measure q[{q}] -> early[{q}];\n")
                
                # Add some operations after to disguise intent
                for _ in range(random.randint(3, 8)):
                    q = random.choice([qb for qb in range(size) if qb not in measured_qubits])
                    gate = random.choice(["h", "x", "y", "z", "s", "t"])
                    f.write(f"{gate} q[{q}];\n")
            
            elif attack_type == "short_identity":
                # Pattern 2: Very short identity operations followed by measurement
                for q in range(size):
                    # Minimal "identity" operations that don't change state meaningfully
                    identity_ops = random.randint(1, 3)
                    for _ in range(identity_ops):
                        # Operations that cancel out (like x;x or z;z)
                        op = random.choice(["x", "y", "z"])
                        f.write(f"{op} q[{q}];\n")
                        if random.random() < 0.8:  # Usually cancel it out
                            f.write(f"{op} q[{q}];\n")
                    
                    # Immediate measurement after "identity"
                    if random.random() < 0.6:
                        f.write(f"measure q[{q}] -> early[{q}];\n")
            
            else:  # mixed_immediate
                # Pattern 3: Mix immediate measurements with misleading operations
                # Some immediate measurements
                early_measured = random.sample(range(size), random.randint(1, max(1, size//3)))
                for q in early_measured:
                    f.write(f"measure q[{q}] -> early[{q}];\n")
                
                # Add misleading operations
                for q in range(size):
                    if q not in early_measured:
                        if random.random() < 0.5:  # Some get minimal ops before measurement
                            gate = random.choice(["h", "id"])  # "id" is identity, "h;h" is also identity
                            f.write(f"{gate} q[{q}];\n")
                            if gate == "h":
                                f.write(f"h q[{q}];\n")  # h;h = identity
                        f.write(f"measure q[{q}] -> early[{q}];\n")
            
            # Add some "normal" operations afterward to disguise the attack
            for _ in range(random.randint(2, 5)):
                q = random.randint(0, size-1)
                gate = random.choice(["h", "x", "y", "z", "rx(pi/4)", "ry(pi/4)"])
                if "(" in gate:
                    gate_name, param = gate.split("(")
                    param = param.rstrip(")")
                    f.write(f"{gate_name}({param}) q[{q}];\n")
                else:
                    f.write(f"{gate} q[{q}];\n")
            
            # Final measurements for any remaining qubits
            for q in range(size):
                f.write(f"measure q[{q}] -> c[{q}];\n")
        
        generated_files.append(filepath)
    
    return generated_files

# Generate qubit shuttling attack variations
def generate_qubit_shuttling_variations(filename_prefix, count=200):
    """
    Generate shuttling attacks - circuits intentionally abusing swap or decomposed 
    swap operations without any legitimate computational purpose. The key is that 
    these circuits perform excessive swapping that serves no algorithmic function.
    """
    generated_files = []
    
    sizes = random.choices(QUBIT_RANGES, k=count)
    
    for i, size in enumerate(sizes):
        filename = f"{filename_prefix}_{size}_{i}.qasm"
        filepath = os.path.join(OUTPUT_DIR, filename)
        
        with open(filepath, "w") as f:
            f.write("OPENQASM 2.0;\n")
            f.write("include \"qelib1.inc\";\n")
            f.write(f"qreg q[{size}];\n")
            f.write(f"creg c[{size}];\n")
            
            # Add minimal legitimate-looking initialization to disguise intent
            num_init_gates = random.randint(1, 3)
            for _ in range(num_init_gates):
                qubit = random.randint(0, size-1)
                gate = random.choice(["h", "x", "y", "z"])
                f.write(f"{gate} q[{qubit}];\n")
            
            # The malicious part: excessive, purposeless swapping
            # This simulates attacks that abuse swap operations for side effects
            swap_iterations = random.randint(size * 3, size * 8)  # Excessive swapping
            
            # Pattern 1: Systematic swap chains with no computational purpose
            if random.random() < 0.4:
                for _ in range(swap_iterations // 2):
                    # Create swap chains that don't contribute to any algorithm
                    for j in range(size - 1):
                        if random.random() < 0.7:  # Not every swap to add randomness
                            f.write(f"swap q[{j}], q[{j+1}];\n")
            
            # Pattern 2: Random swaps with high density
            elif random.random() < 0.7:
                for _ in range(swap_iterations):
                    q1, q2 = random.sample(range(size), 2)
                    if random.random() < 0.8:  # Mostly swaps
                        f.write(f"swap q[{q1}], q[{q2}];\n")
                    else:  # Sometimes decompose to disguise
                        f.write(f"cx q[{q1}], q[{q2}];\n")
                        f.write(f"cx q[{q2}], q[{q1}];\n")
                        f.write(f"cx q[{q1}], q[{q2}];\n")
            
            # Pattern 3: Alternating swap patterns that create no useful computation
            else:
                for _ in range(swap_iterations // 4):
                    # Forward sweep
                    for j in range(size - 1):
                        f.write(f"swap q[{j}], q[{j+1}];\n")
                    # Backward sweep - effectively cancels out but wastes resources
                    for j in range(size - 2, -1, -1):
                        f.write(f"swap q[{j}], q[{j+1}];\n")
            
            # Add a few more gates to obscure the attack pattern
            for _ in range(random.randint(0, 2)):
                qubit = random.randint(0, size-1)
                gate = random.choice(["h", "x", "z"])
                f.write(f"{gate} q[{qubit}];\n")
            
            # Measurements
            for q in range(size):
                f.write(f"measure q[{q}] -> c[{q}];\n")
        
        generated_files.append(filepath)
    
    return generated_files

# Generate trojan attack variations
def generate_trojan_attack_variations(filename_prefix, count=50):
    """
    Generate trojan attacks - circuits designed to exhibit malicious behaviors 
    conditionally. A parameterized qubit or specific state may trigger shuttling 
    or measurement attacks within what appears to be a legitimate circuit.
    """
    generated_files = []
    
    sizes = random.choices(QUBIT_RANGES, k=count)
    
    for i, size in enumerate(sizes):
        filename = f"{filename_prefix}_{size}_{i}.qasm"
        filepath = os.path.join(OUTPUT_DIR, filename)
        
        with open(filepath, "w") as f:
            f.write("OPENQASM 2.0;\n")
            f.write("include \"qelib1.inc\";\n")
            f.write(f"qreg q[{size}];\n")
            f.write(f"qreg control[1];\n")  # Control qubit for trojan activation
            f.write(f"creg c[{size + 1}];\n")
            
            # Initialize control qubit with a specific state that acts as a "trigger"
            trigger_type = random.choice(["parameter", "state", "measurement"])
            
            if trigger_type == "parameter":
                # Use parameterized gates that could trigger based on specific angles
                trigger_angle = random.choice(["pi/4", "pi/2", "3*pi/4", "pi"])
                f.write(f"ry({trigger_angle}) control[0];\n")
            elif trigger_type == "state":
                # Prepare control in a specific superposition state
                f.write("h control[0];\n")
                if random.random() < 0.5:
                    f.write("z control[0];\n")
            else:  # measurement trigger
                f.write("h control[0];\n")
                f.write(f"measure control[0] -> c[{size}];\n")
            
            # Add some legitimate-looking initialization
            for q in range(min(size, 4)):  # Only initialize a few qubits normally
                gate = random.choice(["h", "x", "ry(pi/4)"])
                if "(" in gate:
                    gate_name, param = gate.split("(")
                    param = param.rstrip(")")
                    f.write(f"{gate_name}({param}) q[{q}];\n")
                else:
                    f.write(f"{gate} q[{q}];\n")
            
            # The trojan payload: conditional malicious behavior
            trojan_payload = random.choice(["shuttling", "immediate_measurement", "hybrid"])
            
            if trojan_payload == "shuttling":
                # Conditional shuttling attack using controlled operations
                for _ in range(random.randint(size, size * 2)):
                    q1, q2 = random.sample(range(size), 2)
                    # Use control qubit to conditionally trigger swaps
                    f.write(f"cx control[0], q[{q1}];\n")
                    f.write(f"swap q[{q1}], q[{q2}];\n")
                    f.write(f"cx control[0], q[{q1}];\n")
            
            elif trojan_payload == "immediate_measurement":
                # Conditional immediate measurements
                target_qubits = random.sample(range(size), random.randint(1, max(1, size//2)))
                for q in target_qubits:
                    # Create a controlled measurement scenario
                    f.write(f"cx control[0], q[{q}];\n")
                    if trigger_type != "measurement":  # Avoid double measurement
                        f.write(f"measure q[{q}] -> c[{q}];\n")
            
            else:  # hybrid trojan
                # Mix of both attacks, triggered conditionally
                # Some conditional swapping
                for _ in range(random.randint(2, size)):
                    q1, q2 = random.sample(range(size), 2)
                    f.write(f"ccx control[0], q[{q1}], q[{q2}];\n")  # Toffoli for conditional behavior
                    f.write(f"swap q[{q1}], q[{q2}];\n")
                
                # Some conditional measurements
                for q in random.sample(range(size), random.randint(1, max(1, size//3))):
                    f.write(f"cx control[0], q[{q}];\n")
                    if trigger_type != "measurement":
                        f.write(f"measure q[{q}] -> c[{q}];\n")
            
            # Add some normal operations to disguise the trojan
            for _ in range(random.randint(3, 6)):
                q = random.randint(0, size-1)
                gate = random.choice(["h", "x", "z", "s", "t"])
                f.write(f"{gate} q[{q}];\n")
            
            # Final measurements
            if trigger_type != "measurement":
                f.write(f"measure control[0] -> c[{size}];\n")
            for q in range(size):
                f.write(f"measure q[{q}] -> c[{q}];\n")
        
        generated_files.append(filepath)
    
    return generated_files

# Main generation function
def main():
    print(f"Generating malicious QASM variations in directory: {OUTPUT_DIR}")
    
    # Generate immediate measurement attack variations
    immediate_files = generate_immediate_measurement_variations("malicious_immediate_measurement", 200)
    print(f"Generated {len(immediate_files)} immediate measurement attack variations")
    
    # Generate qubit shuttling attack variations
    shuttling_files = generate_qubit_shuttling_variations("malicious_qubit_shuttling", 200)
    print(f"Generated {len(shuttling_files)} qubit shuttling attack variations")
    
    # Generate trojan attack variations
    trojan_files = generate_trojan_attack_variations("malicious_trojan_attack", 100)
    print(f"Generated {len(trojan_files)} trojan attack variations")
    
    total_files = immediate_files + shuttling_files + trojan_files
    print(f"Total generated files: {len(total_files)}")

if __name__ == "__main__":
    main()