#!/usr/bin/env bash
# setup/install-mac.sh
# Setup AI-OS on Mac from zero. 1-command.
#
# Usage:
#   git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
#   cd ~/Projects/ai-os
#   bash setup/install-mac.sh
#
# Idempotent: runs multiple times without breaking anything.
# Options (env vars):
#   SKIP_BREW=1      → skip brew packages
#   SKIP_NPM=1       → skip npm packages
#   SKIP_DOTFILES=1  → skip dotfile symlinks
#   SKIP_MCP=1       → skip MCP config regeneration
#   SKIP_VERIFY=1    → skip verification at the end
#   DRY_RUN=1        → simulate without executing (CI mode)

set -euo pipefail

# ─── Paths ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"
LOG_PREFIX="[ai-os install]"

# ─── Logging ───
log() { echo "$LOG_PREFIX $*"; }
err() { echo "$LOG_PREFIX ❌ $*" >&2; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }

# ─── DRY_RUN mode (CI) ───
if [ "${DRY_RUN:-0}" = "1" ]; then
  exec bash "$SCRIPT_DIR/install-mac.dry-run.sh"
fi

# ─── Header ───
log "═══════════════════════════════════════════════════════════"
log "  AI-OS Setup (Mac)"
log "  Source: $AI_OS_ROOT"
log "  Target: $HOME_DIR"
log "═══════════════════════════════════════════════════════════"
echo ""

# ─── 0. Prereqs ───
log "0. Verifying prerequisites..."

command -v git >/dev/null || { err "git not installed. Install Xcode CLI Tools: xcode-select --install"; exit 1; }
command -v brew >/dev/null || {
  err "Homebrew not installed."
  log "Install it with:"
  log '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
}
command -v gh >/dev/null || { err "gh (GitHub CLI) not installed. brew install gh"; exit 1; }
command -v yq >/dev/null || { warn "yq not installed, installing with brew..."; brew install yq; }

ok "Prerequisites OK"
echo ""

# ─── 1. Brew packages ───
if [ "${SKIP_BREW:-0}" != "1" ]; then
  log "1. Installing Brew packages (may take 5-15 min)..."
  cd "$AI_OS_ROOT"
  brew bundle install --file=dev-env/packages/Brewfile --verbose
  ok "Brew packages installed"
else
  log "1. SKIP_BREW=1, skipping brew"
fi
echo ""

# ─── 2. Fonts ───
log "2. Verifying Nerd Fonts..."
CASKE_FONT="$HOME/Library/Fonts/CaskaydiaCoveNerdFont-Regular.ttf"
if [ ! -f "$CASKE_FONT" ]; then
  warn "CaskaydiaCove Nerd Font not installed. Installing..."
  brew install --cask font-caskaydia-cove-nerd-font
else
  ok "CaskaydiaCove Nerd Font already installed"
fi
echo ""

# ─── 3. Symlinks for dotfiles ───
if [ "${SKIP_DOTFILES:-0}" != "1" ]; then
  log "3. Creating dotfiles symlinks..."

  # zsh
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/zsh/.zshrc" ]; then
    [ -e "$HOME_DIR/.zshrc" ] && [ ! -L "$HOME_DIR/.zshrc" ] && mv "$HOME_DIR/.zshrc" "$HOME_DIR/.zshrc.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/zsh/.zshrc" "$HOME_DIR/.zshrc"
    ok "  .zshrc → ai-os"
  fi
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/zsh/.p10k.zsh" ]; then
    [ -e "$HOME_DIR/.p10k.zsh" ] && [ ! -L "$HOME_DIR/.p10k.zsh" ] && mv "$HOME_DIR/.p10k.zsh" "$HOME_DIR/.p10k.zsh.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/zsh/.p10k.zsh" "$HOME_DIR/.p10k.zsh"
    ok "  .p10k.zsh → ai-os"
  fi

  # git (template + work/personal)
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/git/.gitconfig.template" ]; then
    if [ ! -e "$HOME_DIR/.gitconfig" ]; then
      cp "$AI_OS_ROOT/dev-env/dotfiles/git/.gitconfig.template" "$HOME_DIR/.gitconfig"
      # Set git identity from env if provided
      if [ -n "${GIT_USER_NAME:-}" ]; then
        git config --global user.name "$GIT_USER_NAME"
      fi
      if [ -n "${GIT_USER_EMAIL:-}" ]; then
        git config --global user.email "$GIT_USER_EMAIL"
      fi
      ok "  .gitconfig → template (customize: git config --global user.name/email)"
    else
      ok "  .gitconfig already exists, not overwriting"
    fi
  fi
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/git/.gitignore_global" ]; then
    [ -e "$HOME_DIR/.gitignore_global" ] && [ ! -L "$HOME_DIR/.gitignore_global" ] && mv "$HOME_DIR/.gitignore_global" "$HOME_DIR/.gitignore_global.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/git/.gitignore_global" "$HOME_DIR/.gitignore_global"
    git config --global core.excludesfile "$HOME_DIR/.gitignore_global" 2>/dev/null || true
    ok "  .gitignore_global → ai-os"
  fi

  # ssh
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/ssh/config" ]; then
    mkdir -p "$HOME_DIR/.ssh"
    chmod 700 "$HOME_DIR/.ssh"
    [ -e "$HOME_DIR/.ssh/config" ] && [ ! -L "$HOME_DIR/.ssh/config" ] && mv "$HOME_DIR/.ssh/config" "$HOME_DIR/.ssh/config.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/ssh/config" "$HOME_DIR/.ssh/config"
    chmod 600 "$HOME_DIR/.ssh/config"
    ok "  .ssh/config → ai-os"
  fi
else
  log "3. SKIP_DOTFILES=1, skipping dotfiles"
fi
echo ""

# ─── 4. Oh My Zsh + Powerlevel10k ───
if [ ! -d "$HOME_DIR/.oh-my-zsh" ]; then
  log "4. Installing Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 2>&1 | tail -3
  ok "Oh My Zsh installed"
else
  ok "Oh My Zsh already installed"
fi

if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  log "   Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/themes/powerlevel10k" 2>&1 | tail -2
  ok "   Powerlevel10k installed"
fi

# Additional plugins
for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions; do
  if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/plugins/$plugin" ]; then
    log "   Installing plugin: $plugin"
    git clone --depth=1 "https://github.com/zsh-users/$plugin" \
      "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/plugins/$plugin" 2>&1 | tail -1
  fi
done
ok "Oh My Zsh + plugins OK"
echo ""

# ─── 5. Global skills (symlinks) ───
log "5. Setting global skills in 5 CLIs..."

for cli_dir in "$HOME_DIR/.claude/skills" "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills"; do
  mkdir -p "$cli_dir"
  for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")
    [ "$name" = "READMEDD.md" ] && continue
    [ "$name" = "taste-skill-llms.txt" ] && continue
    [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ] && mv "$cli_dir/$name" "$cli_dir/$name.pre-aios.bak"
    ln -sf "$skill_dir" "$cli_dir/$name"
  done
done
# READMEDD and llms only in claude/
ln -sf "$AI_OS_ROOT/ai-config/skills/READMEDD.md" "$HOME_DIR/.claude/skills/READMEDD.md" 2>/dev/null || true
ln -sf "$AI_OS_ROOT/ai-config/skills/taste-skill-llms.txt" "$HOME_DIR/.claude/skills/taste-skill-llms.txt" 2>/dev/null || true

# Hermes imported
mkdir -p "$HOME_DIR/.hermes/skills/imported"
for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
  [ -d "$skill_dir" ] || continue
  name=$(basename "$skill_dir")
  [ "$name" = "READMEDD.md" ] && continue
  [ "$name" = "taste-skill-llms.txt" ] && continue
  [ -e "$HOME_DIR/.hermes/skills/imported/$name" ] && [ ! -L "$HOME_DIR/.hermes/skills/imported/$name" ] && mv "$HOME_DIR/.hermes/skills/imported/$name" "$HOME_DIR/.hermes/skills/imported/$name.pre-aios.bak"
  ln -sf "$skill_dir" "$HOME_DIR/.hermes/skills/imported/$name"
done

SKILL_COUNT=$(ls "$AI_OS_ROOT/ai-config/skills/" | wc -l | tr -d ' ')
ok "Skills propagated to 5 CLIs ($SKILL_COUNT files in source)"
echo ""

# ─── 6. Superpowers skills (REQUIRED) ───
log "6. Verifying superpowers skills (REQUIRED)..."
EXPECTED=14
ACTUAL=0
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  [ -d "$HOME_DIR/.claude/skills/$skill" ] && ACTUAL=$((ACTUAL + 1))
done
if [ "$ACTUAL" -ne "$EXPECTED" ]; then
  warn "Only $ACTUAL/$EXPECTED superpowers skills installed. Installing..."
  TMP_SP="/tmp/superpowers-aios-$$"
  trap "rm -rf '$TMP_SP'" EXIT
  gh repo clone obra/superpowers "$TMP_SP" -- --depth=1 2>&1 | tail -1
  for skill in "$TMP_SP"/skills/*/; do
    name=$(basename "$skill")
    if [ -d "$skill" ] && [ ! -d "$HOME_DIR/.claude/skills/$name" ]; then
      cp -R "$skill" "$HOME_DIR/.claude/skills/$name"
      # Re-symlink to other CLIs
      for cli_dir in "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills" "$HOME_DIR/.hermes/skills/imported"; do
        ln -sf "$HOME_DIR/.claude/skills/$name" "$cli_dir/$name"
      done
    fi
  done
  ok "Superpowers installed ($EXPECTED/$EXPECTED)"
else
  ok "Superpowers OK ($ACTUAL/$EXPECTED)"
fi
echo ""

# ─── 7. MCP servers (regenerate ~/.hermes/config.yaml) ───
if [ "${SKIP_MCP:-0}" != "1" ]; then
  log "7. Configuring MCP servers from ai-config/mcp/*.yaml..."

  # Generate mcp_servers block for ~/.hermes/config.yaml
  MCP_YAMLS=()
  for yaml in "$AI_OS_ROOT/ai-config/mcp"/*.yaml; do
    [ -f "$yaml" ] || continue
    MCP_YAMLS+=("$yaml")
  done

  # If ~/.hermes/config.yaml exists, make a backup
  if [ -f "$HOME_DIR/.hermes/config.yaml" ]; then
    cp "$HOME_DIR/.hermes/config.yaml" "$HOME_DIR/.hermes/config.yaml.pre-aios.bak"
  fi
  mkdir -p "$HOME_DIR/.hermes"

  # Generate mcp_servers block with standalone Python script (also works on Windows)
  if command -v python3 >/dev/null 2>&1; then
    python3 "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml"
  elif command -v python >/dev/null 2>&1; then
    python "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml"
  else
    warn "Python not found, cannot generate MCP config automatically"
  fi
fi
echo ""

# ─── 8. Warp defaults (Mac only) ───
if [ "${SKIP_WARP:-0}" != "1" ] && [ -d "/Applications/Warp.app" ]; then
  log "8. Configuring Warp defaults..."
  defaults write dev.warp.Warp-Stable font_family -string "CaskaydiaCove Nerd Font"
  defaults write dev.warp.Warp-Stable font_size -int 14
  defaults write dev.warp.Warp-Stable line_height -float 1.4
  defaults write dev.warp.Warp-Stable theme -string "dark"
  defaults write dev.warp.Warp-Stable window_opacity -float 0.95
  defaults write dev.warp.Warp-Stable cursor_blink -bool true
  defaults write dev.warp.Warp-Stable cursor_shape -string "beam"
  ok "Warp configured (theme dark, font CaskaydiaCove Nerd 14)"
else
  log "8. SKIP_WARP=1 or Warp not installed, skipping"
fi
echo ""

# ─── 9. Terminal.app defaults (Mac only) ───
if [ -d "/Applications/Utilities/Terminal.app" ]; then
  log "9. Configuring Terminal.app defaults..."
  plutil -replace "Default Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  plutil -replace "Startup Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  defaults write com.apple.Terminal Shell -string "/bin/zsh"
  ok "Terminal.app theme = Pro, shell = /bin/zsh"
fi
echo ""

# ─── 10. Reload shell ───
log "10. Reload zsh..."
# Reload shell only if interactive
if [ -n "${PS1:-}" ]; then
  exec zsh
else
  ok "zsh (manual reload: exec zsh or open new terminal)"
fi
echo ""

# ─── 11. Final verification ───
if [ "${SKIP_VERIFY:-0}" != "1" ]; then
  log "11. Final verification..."
  bash "$SCRIPT_DIR/verify.sh"
fi

echo ""
log "═══════════════════════════════════════════════════════════"
ok "AI-OS setup complete!"
log ""
log "Next steps:"
log "  1. exec zsh (or open a new terminal)"
log "  2. Try: hermes chat --skills ai-os-quickstart"
log "  3. Customize ~/.gitconfig with your email: git config --global user.name/email"
log "═══════════════════════════════════════════════════════════"