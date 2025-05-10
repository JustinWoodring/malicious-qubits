#!/usr/bin/env python3
import os
import random
import shutil

def move_random_files(source_dir, target_dir, count):
    # Get all files in source directory
    all_files = [f for f in os.listdir(source_dir) if os.path.isfile(os.path.join(source_dir, f))]
    print(f"Total files in source directory: {len(all_files)}")
    
    # Randomly select 'count' files
    files_to_move = random.sample(all_files, count)
    print(f"Randomly selected {len(files_to_move)} files to move")
    
    # Move selected files
    for file in files_to_move:
        source_path = os.path.join(source_dir, file)
        target_path = os.path.join(target_dir, file)
        shutil.move(source_path, target_path)
        print(f"Moved: {file}")
    
    print(f"Successfully moved {count} files from {source_dir} to {target_dir}")

if __name__ == "__main__":
    source_directory = "validation"
    target_directory = "training"
    
    # Check if source and target directories exist
    if not os.path.isdir(source_directory):
        print(f"Error: Source directory '{source_directory}' not found")
        exit(1)
    
    if not os.path.isdir(target_directory):
        print(f"Error: Target directory '{target_directory}' not found")
        exit(1)
    
    # Move 100 random files
    move_random_files(source_directory, target_directory, 50)