# Terminus Persistence - Private Version Installation

This is the **private full-features version** with complete menu integration.

## What's Included

This version includes both:
- **Toggle Panel**: Quick access to Terminus panel toggle
- **Toggle Persistence**: Enable/disable automatic persistence

## Installation Methods

### Method 1: Direct Package Installation (Recommended)

1. **Locate Sublime Text's Installed Packages directory:**
   - **Linux**: `~/.config/sublime-text/Packages/` or `~/.config/sublime-text-3/Packages/`
   - **macOS**: `~/Library/Application Support/Sublime Text/Packages/`
   - **Windows**: `%APPDATA%\Sublime Text\Packages\`

2. **Copy the package file:**
   ```bash
   # Linux/macOS
   cp TerminusPersistence-private.sublime-package ~/.config/sublime-text/Installed\ Packages/TerminusPersistence.sublime-package

   # Or navigate to Installed Packages and copy the file there
   ```

3. **Restart Sublime Text**

### Method 2: Manual Installation from Source

1. **Clone the repository:**
   ```bash
   git clone -b private-full-features https://github.com/gabriel-lody/terminus-persistence.git TerminusPersistence
   ```

2. **Navigate to Sublime Text's Packages directory:**
   - Open Sublime Text
   - Go to: `Preferences → Browse Packages...`
   - This opens your Packages directory

3. **Copy the plugin folder:**
   - Copy the `TerminusPersistence` folder into the Packages directory
   - Make sure the folder is named exactly `TerminusPersistence` (case-sensitive)

4. **Restart Sublime Text**

## Verification

After installation, verify the plugin is working:

1. Open Sublime Text
2. Go to `View → Terminus`
3. You should see:
   - ✓ Toggle Panel
   - ✓ Toggle Persistence

## Usage

### Quick Access
- **Toggle Terminus Panel**: `View → Terminus → Toggle Panel` or `Alt+\``
- **Toggle Persistence**: `View → Terminus → Toggle Persistence`

### How It Works
1. Open a Terminus panel
2. Close Sublime Text
3. Reopen Sublime Text
4. The Terminus panel automatically reopens (if persistence is enabled)

## Troubleshooting

### Plugin not appearing
- Make sure the folder/file is named exactly `TerminusPersistence` (not `terminus-persistence`)
- Check Sublime Text console for errors: `View → Show Console`
- Restart Sublime Text after installation

### Menu items not showing
- Verify Terminus plugin is installed
- Check that both plugins are enabled: `Preferences → Package Control → List Packages`

### Terminus doesn't reopen
- Ensure persistence is enabled (checkmark should appear in menu)
- Check console for errors
- Verify Terminus plugin is working independently

## Switching to Public Version

To switch to the Package Control version later:

1. Remove this private installation:
   - Delete `TerminusPersistence.sublime-package` from Installed Packages, OR
   - Delete `TerminusPersistence` folder from Packages
2. Install via Package Control: `Ctrl+Shift+P` → `Package Control: Install Package` → `Terminus Persistence`

## Support

For issues or questions:
- GitHub Issues: https://github.com/gabriel-lody/terminus-persistence/issues
- Check the README.md for more information

## License

MIT License - See LICENSE file for details
