import sublime
import sublime_plugin


SETTINGS_FILE = "TerminusPersistence.sublime-settings"


def get_settings():
    """Load plugin settings."""
    return sublime.load_settings(SETTINGS_FILE)


def save_settings():
    """Save plugin settings."""
    sublime.save_settings(SETTINGS_FILE)


def is_terminus_panel_visible(window):
    """Check if a Terminus panel is currently visible.

    Returns:
        str or False: Panel name if visible, False otherwise
    """
    active_panel = window.active_panel()

    if active_panel and active_panel.startswith("output."):
        panel_name = active_panel[7:]  # Remove "output." prefix
        panel_view = window.find_output_panel(panel_name)

        if panel_view and panel_view.settings().get("terminus_view", False):
            return panel_name

    return False


class TerminusPersistenceListener(sublime_plugin.EventListener):
    """Event listener to save Terminus panel state on window close."""

    def on_pre_close_window(self, window):
        """Save Terminus panel state when window is closing."""
        settings = get_settings()

        # Only save if persistence is enabled
        if not settings.get("persistence_enabled", True):
            return

        # Check if terminus panel is visible
        panel_name = is_terminus_panel_visible(window)

        # Save state
        settings.set("terminus_was_visible", bool(panel_name))
        if panel_name:
            settings.set("terminus_panel_name", panel_name)

        save_settings()


class ToggleTerminusPersistenceCommand(sublime_plugin.WindowCommand):
    """Command to toggle persistence functionality on/off."""

    def run(self):
        settings = get_settings()
        current = settings.get("persistence_enabled", True)

        # Toggle the setting
        settings.set("persistence_enabled", not current)
        save_settings()

        # Show status message
        status = "enabled" if not current else "disabled"
        sublime.status_message(f"Terminus Persistence {status}")

    def is_checked(self):
        """Show checkmark in menu if enabled."""
        settings = get_settings()
        return settings.get("persistence_enabled", True)


def plugin_loaded():
    """Restore Terminus panel state when plugin loads."""
    # Delay restoration to ensure Terminus is loaded
    sublime.set_timeout(restore_terminus_state, 1000)


def restore_terminus_state():
    """Restore Terminus panel if it was visible in previous session."""
    window = sublime.active_window()
    if not window:
        return

    settings = get_settings()

    # Check if persistence is enabled
    if not settings.get("persistence_enabled", True):
        return

    # Check if panel was visible
    was_visible = settings.get("terminus_was_visible", False)

    if was_visible:
        # Open the panel using toggle_terminus_panel
        window.run_command("toggle_terminus_panel")
