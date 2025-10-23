#!/bin/bash

# Terminus Persistence - Installation Script
# Installs the plugin to Sublime Text Packages directory

set -e

PLUGIN_NAME="TerminusPersistence"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect Sublime Text packages directory
if [ -d "$HOME/.config/sublime-text/Packages" ]; then
    PACKAGES_DIR="$HOME/.config/sublime-text/Packages"
elif [ -d "$HOME/.config/sublime-text-3/Packages" ]; then
    PACKAGES_DIR="$HOME/.config/sublime-text-3/Packages"
elif [ -d "$HOME/Library/Application Support/Sublime Text/Packages" ]; then
    PACKAGES_DIR="$HOME/Library/Application Support/Sublime Text/Packages"
elif [ -d "$HOME/Library/Application Support/Sublime Text 3/Packages" ]; then
    PACKAGES_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages"
else
    echo "Error: Could not find Sublime Text Packages directory"
    echo ""
    echo "Please install manually by copying this directory to:"
    echo "  Linux: ~/.config/sublime-text/Packages/TerminusPersistence/"
    echo "  macOS: ~/Library/Application Support/Sublime Text/Packages/TerminusPersistence/"
    exit 1
fi

INSTALL_DIR="$PACKAGES_DIR/$PLUGIN_NAME"

echo "==================================="
echo "Terminus Persistence Installer"
echo "==================================="
echo ""
echo "Source: $SCRIPT_DIR"
echo "Target: $INSTALL_DIR"
echo ""

# Check if Terminus is installed
TERMINUS_DIR="$PACKAGES_DIR/Terminus"
if [ ! -d "$TERMINUS_DIR" ]; then
    echo "Warning: Terminus plugin not found in Packages directory"
    echo "Please install Terminus first via Package Control"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Remove existing installation if present
if [ -d "$INSTALL_DIR" ]; then
    echo "Removing existing installation..."
    rm -rf "$INSTALL_DIR"
fi

# Create plugin directory
echo "Creating plugin directory..."
mkdir -p "$INSTALL_DIR"

# Copy plugin files
echo "Copying plugin files..."
cp "$SCRIPT_DIR/terminus_persistence.py" "$INSTALL_DIR/"
cp "$SCRIPT_DIR/TerminusPersistence.sublime-settings" "$INSTALL_DIR/"
cp "$SCRIPT_DIR/Main.sublime-menu" "$INSTALL_DIR/"
cp "$SCRIPT_DIR/README.md" "$INSTALL_DIR/"

echo ""
echo "✓ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Restart Sublime Text"
echo "  2. Open Terminus panel: View → Terminus → Toggle Panel"
echo "  3. Close and reopen Sublime Text to test persistence"
echo ""
echo "Configuration:"
echo "  View → Terminus → Toggle Persistence (enable/disable)"
echo ""
