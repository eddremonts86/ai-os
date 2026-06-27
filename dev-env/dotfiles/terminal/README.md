# Terminal.app (Mac native) config
# Apply via setup/install-mac.sh which uses `defaults write com.apple.Terminal`

# Default theme
default_window_settings = "Pro"
startup_window_settings = "Pro"

# Shell
shell = /bin/zsh

# Encoding
string_encodings = (4)

# ─── Pro theme customization ───
# The font is NOT configured via defaults (binary plist).
# User must manually:
#   1. Open Terminal.app
#   2. Cmd+, → Profiles → "Pro"
#   3. Text → Change Font → CaskaydiaCove Nerd Font, 14
#   4. Close (auto-saves)

# Or use the AppleScript one-liner in setup/install-mac.sh
