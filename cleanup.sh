#!/data/data/com.termux/files/usr/bin/bash

# Check if the parent directory name is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_parent_directory>"
    exit 1
fi

# Get the parent directory path
PARENT_DIR="$1"

# Ensure the provided directory exists
if [ ! -d "$PARENT_DIR" ]; then
    echo "Error: The directory '$PARENT_DIR' does not exist!"
    exit 1
fi

echo "Starting cleanup process for '$PARENT_DIR'..."

# 1. Clean APT cache and lists
echo "Cleaning APT cache and lists..."
rm -rf "$PARENT_DIR/var/cache/apt/*"
rm -rf "$PARENT_DIR/var/lib/apt/lists/*"

# 2. Clean Temporary Files
echo "Cleaning temporary files..."
rm -rf "$PARENT_DIR/tmp/*"
rm -rf "$PARENT_DIR/var/tmp/*"

# 3. Clean Log Files
echo "Cleaning log files..."
rm -rf "$PARENT_DIR/var/log/*"

# 4. Remove Shell History Files
echo "Cleaning shell history files..."
rm -f "$PARENT_DIR/root/.bash_history"
rm -f "$PARENT_DIR/home/*/.bash_history"

# 5. Remove unnecessary device nodes in /dev
echo "Cleaning /dev..."
rm -rf "$PARENT_DIR/dev"

echo "Cleanup complete for '$PARENT_DIR'!"
