#!/usr/bin/env python3
"""
Script to create validation split by randomly selecting 300 samples 
from training directory and moving them to validation directory
"""

import os
import random
import shutil

def create_validation_split():
    """Create validation split from training samples"""
    training_dir = "/home/justinwoodring/malicious-qubits/training"
    validation_dir = "/home/justinwoodring/malicious-qubits/validation"
    
    # Create validation directory if it doesn't exist
    if not os.path.exists(validation_dir):
        os.makedirs(validation_dir)
        print(f"Created validation directory: {validation_dir}")
    
    # Get all QASM files in training directory
    training_files = [f for f in os.listdir(training_dir) if f.endswith('.qasm')]
    print(f"Found {len(training_files)} QASM files in training directory")
    
    # Randomly select 300 files for validation
    if len(training_files) < 300:
        print(f"Warning: Only {len(training_files)} files available, selecting all")
        validation_files = training_files
    else:
        validation_files = random.sample(training_files, 300)
    
    print(f"Selected {len(validation_files)} files for validation")
    
    # Move selected files to validation directory
    moved_count = 0
    for filename in validation_files:
        source_path = os.path.join(training_dir, filename)
        target_path = os.path.join(validation_dir, filename)
        
        try:
            shutil.move(source_path, target_path)
            moved_count += 1
        except Exception as e:
            print(f"Error moving {filename}: {e}")
    
    print(f"Successfully moved {moved_count} files to validation directory")
    
    # Verify final counts
    final_training_count = len([f for f in os.listdir(training_dir) if f.endswith('.qasm')])
    final_validation_count = len([f for f in os.listdir(validation_dir) if f.endswith('.qasm')])
    
    print(f"Final counts:")
    print(f"  Training: {final_training_count} files")
    print(f"  Validation: {final_validation_count} files")
    print(f"  Total: {final_training_count + final_validation_count} files")

if __name__ == "__main__":
    create_validation_split()