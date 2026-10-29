
#!/usr/bin/env bash

set -e

# Check that exactly two arguments were provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source-dir> <output-dir>"
    exit 1
fi

# Store the source and output folder paths
SOURCE_DIR="$1"
OUTPUT_DIR="$2"

# Convert the source path to an absolute path
SOURCE_DIR="$(realpath "$SOURCE_DIR")"

# Create the output directory if needed
mkdir -p "$OUTPUT_DIR"

# Convert the output path to an absolute path
OUTPUT_DIR="$(realpath "$OUTPUT_DIR")"

# Enter the source code directory
cd "$SOURCE_DIR"

# Prepare the software for compilation
./configure --prefix=/usr

# Compile the software
make

# Stage the compiled software in our output folder
make DESTDIR="$OUTPUT_DIR" install
