# AI-OS shell essentials: PATH, per-machine env and your personal shell file.
# Sourced from your own ~/.zshrc (setup/install-mac.sh adds one marked line) or from
# the themed dev-env/dotfiles/zsh/.zshrc. Nothing about you belongs here: this file is tracked.

# Homebrew (Apple Silicon), user binaries (ai-os, claude, hermes) and pnpm globals.
[ -d /opt/homebrew/bin ] && export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PNPM_HOME="${PNPM_HOME:-$HOME/Library/pnpm}"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac

# AI-OS Python venv CLIs (ruff, black, …). Appended so brew's python3 stays the default.
[ -d "$HOME/.ai-os/venv/bin" ] && export PATH="$PATH:$HOME/.ai-os/venv/bin"

# Per-machine values (AI_OS_ROOT, OLLAMA_URL, …), written by the installer, never committed.
[ -f "$HOME/.ai-os/env.sh" ] && source "$HOME/.ai-os/env.sh"

# Your aliases and functions: context/personal/machine/shell.zsh (git-ignored).
[ -n "$AI_OS_ROOT" ] && [ -f "$AI_OS_ROOT/context/personal/machine/shell.zsh" ] && source "$AI_OS_ROOT/context/personal/machine/shell.zsh"
