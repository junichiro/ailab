#!/bin/bash
# install-claude-settings.sh
# Simple installer for Claude Code settings

set -e

CLAUDE_DIR="$HOME/.claude"
SOURCE_DIR="./claude-settings"

# Function to print output
print_info() {
    echo "[INFO] $1"
}

print_warning() {
    echo "[WARNING] $1"
}

print_error() {
    echo "[ERROR] $1"
}

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    print_error "Source directory '$SOURCE_DIR' not found!"
    print_error "Please run this script from the root of the ailab repository."
    exit 1
fi

# Check if source files exist
if [ ! -f "$SOURCE_DIR/CLAUDE.md" ]; then
    print_error "Source file '$SOURCE_DIR/CLAUDE.md' not found!"
    exit 1
fi

if [ ! -d "$SOURCE_DIR/commands" ]; then
    print_error "Source directory '$SOURCE_DIR/commands' not found!"
    exit 1
fi

# Create directories if they don't exist
print_info "Creating Claude Code directories..."
mkdir -p "$CLAUDE_DIR"
mkdir -p "$CLAUDE_DIR/commands"

# Backup existing CLAUDE.md if it exists
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    backup_file="$CLAUDE_DIR/CLAUDE.md.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$CLAUDE_DIR/CLAUDE.md" "$backup_file"
    print_warning "Backed up existing CLAUDE.md to $(basename "$backup_file")"
fi

# Copy CLAUDE.md
print_info "Copying CLAUDE.md..."
cp "$SOURCE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
print_info "✓ Copied CLAUDE.md to $CLAUDE_DIR/"

# Copy command files
print_info "Copying command files..."
copied_count=0
set +e  # Temporarily disable exit on error for the loop
for file in "$SOURCE_DIR/commands/"*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if cp "$file" "$CLAUDE_DIR/commands/$filename"; then
            print_info "✓ Copied $filename"
            copied_count=$((copied_count + 1))
        else
            print_error "Failed to copy $filename"
        fi
    fi
done
set -e  # Re-enable exit on error

print_info "✓ Copied $copied_count command files to $CLAUDE_DIR/commands/"

# Display installation summary
echo
print_info "Claude Code settings installed successfully!"
echo
print_info "Installed files:"
print_info "  - $CLAUDE_DIR/CLAUDE.md"
print_info "  - $CLAUDE_DIR/commands/ (${copied_count} files)"
echo
print_info "You can now use the custom commands in Claude Code!"