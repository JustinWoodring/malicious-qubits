#!/usr/bin/env python3
"""
Script to preprocess QASM samples:
1. Remove all comments (//)
2. Remove first empty line where present
3. Randomly select 1000 samples
"""

import os
import random
import shutil
import re

def clean_qasm_file(file_path):
    """Clean a single QASM file by removing comments and first empty line if present."""
    with open(file_path, 'r') as f:
        lines = f.readlines()
    
    # Remove comments from each line
    cleaned_lines = []
    for line in lines:
        # Remove // comments but preserve the rest of the line
        if '//' in line:
            line = line[:line.index('//')]
        cleaned_lines.append(line.rstrip() + '\n' if line.strip() else '\n')
    
    # Remove first line if it's empty
    if cleaned_lines and cleaned_lines[0].strip() == '':
        cleaned_lines = cleaned_lines[1:]
    
    # Write back the cleaned content
    with open(file_path, 'w') as f:
        f.writelines(cleaned_lines)

def main():
    training_dir = "/home/justinwoodring/malicious-qubits/training"
    
    # Get all QASM files
    all_qasm_files = []
    for file in os.listdir(training_dir):
        if file.endswith('.qasm'):
            all_qasm_files.append(os.path.join(training_dir, file))
    
    print(f"Found {len(all_qasm_files)} QASM files")
    
    # Step 1 & 2: Clean all files (remove comments and first empty line)
    print("Cleaning QASM files (removing comments and first empty line)...")
    for file_path in all_qasm_files:
        clean_qasm_file(file_path)
    print("Cleaning completed")
    
    # Step 3: Randomly select 1000 files
    if len(all_qasm_files) > 1000:
        print(f"Randomly selecting 1000 files from {len(all_qasm_files)} total files...")
        selected_files = random.sample(all_qasm_files, 1000)
        
        # Remove non-selected files
        files_to_remove = set(all_qasm_files) - set(selected_files)
        for file_path in files_to_remove:
            os.remove(file_path)
        
        print(f"Kept {len(selected_files)} files, removed {len(files_to_remove)} files")
    else:
        print(f"Total files ({len(all_qasm_files)}) is already <= 1000, keeping all")
    
    # Verify final state
    final_files = [f for f in os.listdir(training_dir) if f.endswith('.qasm')]
    print(f"Final count: {len(final_files)} QASM files in training directory")

if __name__ == "__main__":
    main()