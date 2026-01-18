# Private Full-Features Branch

This branch contains the complete version of Terminus Persistence with all menu features intact.

## Differences from Main Branch

This private branch includes:

- **Toggle Panel** menu item: Provides quick access to Terminus panel toggle directly from the View menu
- **Toggle Persistence** menu item: Same as main branch

## Why Two Versions?

The **main branch** is optimized for Package Control distribution and follows their guidelines:
- Only includes menu items for commands owned by this package
- Complies with Package Control reviewer requirements

The **private-full-features branch** includes convenience features for personal use:
- Additional menu shortcuts for frequently used Terminus commands
- Enhanced user experience for manual installation

## Installation (Private Version)

### Manual Installation

1. Clone this repository:
   ```bash
   git clone -b private-full-features https://github.com/gabriel-lody/terminus-persistence.git
   ```

2. Navigate to Sublime Text's Packages directory:
   - **Linux**: `~/.config/sublime-text/Packages/`
   - **macOS**: `~/Library/Application Support/Sublime Text/Packages/`
   - **Windows**: `%APPDATA%\Sublime Text\Packages\`

3. Copy the cloned `terminus-persistence` folder to the Packages directory and rename it to `TerminusPersistence`

4. Restart Sublime Text

## Switching Branches

To switch to the public version:
```bash
cd /path/to/terminus-persistence
git checkout main
```

To switch back to this private version:
```bash
git checkout private-full-features
```
