import os

# Function to determine if a file is a text file
def is_text_file(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            f.read()
        return True
    except (UnicodeDecodeError, IOError):
        return False

# Function to replace the specified line in text files
def replace_line_in_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    with open(file_path, 'w', encoding='utf-8') as f:
        for line in lines:
            if line.startswith('//  Created by'):
                line = '// Created by Kevin on 16/08/2024\n'
            f.write(line)

# Function to recursively iterate through folders and files
def process_directory(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            if is_text_file(file_path):
                replace_line_in_file(file_path)

# Main execution
if __name__ == "__main__":
    current_directory = os.getcwd()  # Get current working directory
    process_directory(current_directory)
