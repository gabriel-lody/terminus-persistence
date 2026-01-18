#!/bin/bash

# Terminus Persistence - Private Version Installer
# Automatically installs the private full-features version

set -e

echo "==================================="
echo "Terminus Persistence Private Installer"
echo "==================================="
echo

# Detect OS and set Sublime Text path
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ST_PACKAGES_DIR="$HOME/.config/sublime-text/Installed Packages"
    ST_PACKAGES_ALT="$HOME/.config/sublime-text-3/Installed Packages"

    # Try to find the correct path
    if [ -d "$ST_PACKAGES_DIR" ]; then
        TARGET_DIR="$ST_PACKAGES_DIR"
    elif [ -d "$ST_PACKAGES_ALT" ]; then
        TARGET_DIR="$ST_PACKAGES_ALT"
    else
        echo "Error: Could not find Sublime Text Installed Packages directory"
        echo "Please install manually using INSTALL.md"
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    TARGET_DIR="$HOME/Library/Application Support/Sublime Text/Installed Packages"
else
    echo "Error: Unsupported operating system"
    echo "For Windows, please install manually using INSTALL.md"
    exit 1
fi

# Create directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if package file exists
PACKAGE_FILE="TerminusPersistence-private.sublime-package"
if [ ! -f "$PACKAGE_FILE" ]; then
    echo "Error: $PACKAGE_FILE not found in current directory"
    echo "Please run this script from the dist/ directory"
    exit 1
fi

# Copy package
echo "Installing to: $TARGET_DIR"
cp "$PACKAGE_FILE" "$TARGET_DIR/TerminusPersistence.sublime-package"

echo
echo "✓ Installation complete!"
echo
echo "Next steps:"
echo "1. Restart Sublime Text"
echo "2. Verify installation: View → Terminus"
echo "3. You should see 'Toggle Panel' and 'Toggle Persistence' menu items"
echo
echo "For troubleshooting, see INSTALL.md"
