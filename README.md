# Terminus Persistence

A minimal Sublime Text plugin that remembers whether your Terminus panel was open between sessions and automatically restores it.

## Features

- **Automatic State Persistence**: Remembers if Terminus was open when you closed Sublime Text
- **Seamless Restoration**: Automatically reopens Terminus on startup if it was previously open
- **Convenient Menu Integration**: Quick access to Terminus controls via View menu
- **Configurable**: Toggle persistence on/off as needed

## Requirements

- Sublime Text 3 or 4
- [Terminus](https://packagecontrol.io/packages/Terminus) plugin installed

## Installation

### Via Package Control (when published)

1. Open Command Palette (`Ctrl+Shift+P` / `Cmd+Shift+P`)
2. Select "Package Control: Install Package"
3. Search for "Terminus Persistence"
4. Press Enter to install

### Manual Installation

1. Clone or download this repository
2. Copy the `terminus-persistence` folder to your Sublime Text Packages directory:
   - **Linux**: `~/.config/sublime-text/Packages/`
   - **macOS**: `~/Library/Application Support/Sublime Text/Packages/`
   - **Windows**: `%APPDATA%\Sublime Text\Packages\`
3. Rename the folder to `TerminusPersistence`
4. Restart Sublime Text

### Quick Install Script (Linux/macOS)

```bash
./install.sh
```

## Usage

### Automatic Behavior

Once installed, the plugin works automatically:

1. Open Terminus panel (via `Alt+\`` or View menu)
2. Close Sublime Text
3. Reopen Sublime Text
4. Terminus panel will automatically reopen

### Menu Commands

Access via **View → Terminus**:

- **Toggle Panel**: Opens or closes the Terminus panel
- **Toggle Persistence**: Enables or disables automatic persistence (shows checkmark when enabled)

## Configuration

Settings can be accessed via: `Preferences → Package Settings → Terminus Persistence → Settings`

Default settings:

```json
{
    // Enable or disable automatic persistence of Terminus panel state
    "persistence_enabled": true
}
```

## How It Works

1. **On Close**: When you close a Sublime Text window, the plugin checks if a Terminus panel is visible
2. **State Storage**: The visibility state is saved to plugin settings
3. **On Startup**: When Sublime Text loads, the plugin waits 1 second (to ensure Terminus is loaded) then restores the panel state
4. **Configurable**: Persistence can be toggled on/off via the View menu

## Troubleshooting

### Terminus doesn't reopen on startup

- Make sure Terminus plugin is installed and enabled
- Check that persistence is enabled: View → Terminus → Toggle Persistence (should show checkmark)
- Try increasing the delay in `plugin_loaded()` if Terminus loads slowly

### Menu items don't appear

- Ensure the folder is named exactly `TerminusPersistence`
- Restart Sublime Text
- Check Console for errors (View → Show Console)

## Development

### Project Structure

```
TerminusPersistence/
├── terminus_persistence.py              # Main plugin code
├── TerminusPersistence.sublime-settings # Default settings
├── Main.sublime-menu                    # View menu integration
├── README.md                            # This file
└── install.sh                           # Installation script
```

### Testing

1. Enable Sublime Text console: View → Show Console
2. Open Terminus panel
3. Close and reopen Sublime Text
4. Check console for any errors
5. Verify Terminus reopens automatically

### Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

MIT License - See LICENSE file for details

## Author

Created for simplicity and convenience.

## Acknowledgments

- [Terminus](https://github.com/randy3k/Terminus) by randy3k - The excellent terminal emulator this plugin extends
- Sublime Text community

## Changelog

### 0.1.0 (Initial Release)
- Basic persistence functionality
- View menu integration
- Toggle persistence on/off
- Automatic state restoration
