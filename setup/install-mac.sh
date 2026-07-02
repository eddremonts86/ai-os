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
#   SKIP_PIP=1       → skip Python user packages
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

# ─── 2. npm global packages ───
if [ "${SKIP_NPM:-0}" != "1" ]; then
  log "2. Installing npm globals from dev-env/packages/npm-globals.txt..."
  if command -v npm >/dev/null 2>&1; then
    while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
      pkg="${raw_pkg%%#*}"
      pkg="$(printf '%s' "$pkg" | xargs)"
      [ -z "$pkg" ] && continue
      npm install -g "$pkg"
    done < "$AI_OS_ROOT/dev-env/packages/npm-globals.txt"
    ok "npm globals installed"
  else
    warn "npm not found; skipping npm globals"
  fi
else
  log "2. SKIP_NPM=1, skipping npm globals"
fi
echo ""

# ─── 3. Python user packages ───
if [ "${SKIP_PIP:-0}" != "1" ]; then
  log "3. Installing Python user packages from dev-env/packages/pip-packages.txt..."
  if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD=python3
  elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD=python
  else
    PYTHON_CMD=""
  fi

  if [ -n "$PYTHON_CMD" ]; then
    while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
      pkg="${raw_pkg%%#*}"
      pkg="$(printf '%s' "$pkg" | xargs)"
      [ -z "$pkg" ] && continue
      "$PYTHON_CMD" -m pip install --user "$pkg"
    done < "$AI_OS_ROOT/dev-env/packages/pip-packages.txt"
    ok "Python user packages installed"
  else
    warn "Python not found; skipping Python user packages"
  fi
else
  log "3. SKIP_PIP=1, skipping Python user packages"
fi
echo ""

# ─── 4. Fonts ───
log "4. Verifying Nerd Fonts..."
CASKE_FONT="$HOME/Library/Fonts/CaskaydiaCoveNerdFont-Regular.ttf"
if [ ! -f "$CASKE_FONT" ]; then
  warn "CaskaydiaCove Nerd Font not installed. Installing..."
  brew install --cask font-caskaydia-cove-nerd-font
else
  ok "CaskaydiaCove Nerd Font already installed"
fi
echo ""

# ─── 5. Symlinks for dotfiles ───
if [ "${SKIP_DOTFILES:-0}" != "1" ]; then
  log "5. Creating dotfiles symlinks..."

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
  log "5. SKIP_DOTFILES=1, skipping dotfiles"
fi
echo ""

# ─── 6. Oh My Zsh + Powerlevel10k ───
if [ ! -d "$HOME_DIR/.oh-my-zsh" ]; then
  log "6. Installing Oh My Zsh..."
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

# ─── 7. Global skills (symlinks) ───
log "7. Setting global skills in 6 CLIs..."
# Only flat skills (a dir with a top-level SKILL.md) are symlinked here. Plugin
# bundles in ai-config/skills/ that have a NESTED layout (claude.tools, ECC) are
# installed by their own scripts (install-claude-tools.sh, install-ecc.sh).
#   Claude ~/.claude/skills | Codex ~/.codex/skills | Gemini ~/.gemini/skills
#   Antigravity ~/.agents/skills | Hermes ~/.hermes/skills/imported
#   MiniMax Code ~/.minimax/skills (global skills.paths entry in opencode.json)
for cli_dir in "$HOME_DIR/.claude/skills" "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills" "$HOME_DIR/.hermes/skills/imported" "$HOME_DIR/.minimax/skills"; do
  mkdir -p "$cli_dir"
  # Prune stale ai-os symlinks whose target no longer has a top-level SKILL.md
  # (e.g. a plugin bundle wrongly linked by an older run). Keeps re-runs clean.
  for link in "$cli_dir"/*; do
    [ -L "$link" ] || continue
    tgt=$(readlink "$link")
    case "$tgt" in
      *"/ai-config/skills/"*) [ -f "${tgt%/}/SKILL.md" ] || rm -f "$link" ;;
    esac
  done
  for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
    [ -f "$skill_dir/SKILL.md" ] || continue
    name=$(basename "$skill_dir")
    [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ] && mv "$cli_dir/$name" "$cli_dir/$name.pre-aios.bak"
    ln -sfn "$skill_dir" "$cli_dir/$name"
  done
done
# READMEDD and llms only in claude/
ln -sf "$AI_OS_ROOT/ai-config/skills/READMEDD.md" "$HOME_DIR/.claude/skills/READMEDD.md" 2>/dev/null || true
ln -sf "$AI_OS_ROOT/ai-config/skills/taste-skill-llms.txt" "$HOME_DIR/.claude/skills/taste-skill-llms.txt" 2>/dev/null || true

SKILL_COUNT=$(find "$AI_OS_ROOT/ai-config/skills" -maxdepth 2 -name SKILL.md -path "*/ai-config/skills/*/SKILL.md" | wc -l | tr -d ' ')
ok "Skills propagated to 6 CLIs ($SKILL_COUNT flat skills in source)"
echo ""

# ─── 7c. Vendored gstack skills (read-only subtree at vendor/gstack/) ───
# Mirrors the ECC pattern: optional, third-party, propagated to the same 6 CLIs.
# Currently inlines 3 skills (spec, context-save, context-restore). Refresh with:
#   git -C "$AI_OS_ROOT/vendor/gstack" pull  (when an upstream is configured)
if [ -d "$AI_OS_ROOT/vendor/gstack" ]; then
  log "7c. Setting vendored gstack skills in 6 CLIs..."
  GSTACK_COUNT=0
  for cli_dir in "$HOME_DIR/.claude/skills" "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills" "$HOME_DIR/.hermes/skills/imported" "$HOME_DIR/.minimax/skills"; do
    mkdir -p "$cli_dir"
    # Prune stale gstack symlinks whose target is gone.
    for link in "$cli_dir"/*; do
      [ -L "$link" ] || continue
      tgt=$(readlink "$link")
      case "$tgt" in
        *"/vendor/gstack/"*) [ -f "${tgt%/}/SKILL.md" ] || rm -f "$link" ;;
      esac
    done
    for skill_dir in "$AI_OS_ROOT/vendor/gstack"/*/; do
      [ -f "$skill_dir/SKILL.md" ] || continue
      name=$(basename "$skill_dir")
      [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ] && mv "$cli_dir/$name" "$cli_dir/$name.pre-aios.bak"
      ln -sfn "$skill_dir" "$cli_dir/$name"
    done
  done
  GSTACK_COUNT=$(find "$AI_OS_ROOT/vendor/gstack" -maxdepth 2 -name SKILL.md -path "*/vendor/gstack/*/SKILL.md" | wc -l | tr -d ' ')
  ok "Vendored gstack skills propagated ($GSTACK_COUNT skills in source)"
else
  log "7c. vendor/gstack/ absent, skipping"
fi
echo ""

# ─── 7b. Global instruction bridge (loads AI-OS into every project, every CLI) ───
log "7b. Wiring global instruction bridge..."
BRIDGE="$AI_OS_ROOT/ai-config/clis/GLOBAL_BRIDGE.md"
# Symlink the bridge to each CLI's global instruction file.
#   Claude Code: ~/.claude/CLAUDE.md   | Codex: ~/.codex/AGENTS.md
#   Gemini: ~/.gemini/GEMINI.md        | Antigravity: ~/.agents/AGENTS.md
for target in "$HOME_DIR/.claude/CLAUDE.md" "$HOME_DIR/.codex/AGENTS.md" "$HOME_DIR/.gemini/GEMINI.md" "$HOME_DIR/.agents/AGENTS.md"; do
  mkdir -p "$(dirname "$target")"
  # Back up a real (non-symlink) file once, then link.
  [ -e "$target" ] && [ ! -L "$target" ] && mv "$target" "$target.pre-aios.bak"
  ln -sfn "$BRIDGE" "$target"
done
# Hermes: ensure SOUL.md carries the AI-OS bridge block (idempotent append).
SOUL="$HOME_DIR/.hermes/SOUL.md"
if [ -f "$SOUL" ] && ! grep -q "AI-OS BRIDGE" "$SOUL"; then
  cat >> "$SOUL" <<'AIOS_SOUL'

<!-- AI-OS BRIDGE — managed by ~/Projects/ai-os; remove this block to unlink -->
## AI-OS (operating context)
Single source of truth: `/Users/edd/Projects/ai-os`. At the start of meaningful
work read `context/00_profile.md`, `context/03_preferences.md`, and `CLAUDE.md`.
Non-negotiables: chat in Spanish (lowercase, terse); ALL files in English; verify
with runtime evidence; confirm before irreversible actions. Durable facts →
`~/.hermes/memories/`; keep `context/` as the canonical identity.
<!-- /AI-OS BRIDGE -->
AIOS_SOUL
fi
# MiniMax Code (mavis, opencode-based): each agent's agent.md is appended to the
# system prompt at runtime. Overwrite the stub with the AI-OS overlay (real file,
# not a symlink — mavis re-seeds this path).
MM_OVERLAY="$AI_OS_ROOT/ai-config/clis/minimax-overlay.md"
if [ -d "$HOME_DIR/.minimax/agents" ] && [ -f "$MM_OVERLAY" ]; then
  for agent_dir in "$HOME_DIR/.minimax/agents"/*/; do
    [ -d "$agent_dir" ] && cp "$MM_OVERLAY" "$agent_dir/agent.md"
  done
fi
ok "Global bridge wired (claude/codex/gemini/antigravity + hermes SOUL.md + minimax agent.md)"
echo ""

# ─── 8. Superpowers skills (REQUIRED) ───
log "8. Verifying superpowers skills (REQUIRED)..."
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

# ─── 9. MCP servers (regenerate ~/.hermes/config.yaml) ───
if [ "${SKIP_MCP:-0}" != "1" ]; then
  log "9. Configuring MCP servers from ai-config/mcp/*.yaml..."

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

# ─── 10. Warp defaults (Mac only) ───
if [ "${SKIP_WARP:-0}" != "1" ] && [ -d "/Applications/Warp.app" ]; then
  log "10. Configuring Warp defaults..."
  defaults write dev.warp.Warp-Stable font_family -string "CaskaydiaCove Nerd Font"
  defaults write dev.warp.Warp-Stable font_size -int 14
  defaults write dev.warp.Warp-Stable line_height -float 1.4
  defaults write dev.warp.Warp-Stable theme -string "dark"
  defaults write dev.warp.Warp-Stable window_opacity -float 0.95
  defaults write dev.warp.Warp-Stable cursor_blink -bool true
  defaults write dev.warp.Warp-Stable cursor_shape -string "beam"
  ok "Warp configured (theme dark, font CaskaydiaCove Nerd 14)"
else
  log "10. SKIP_WARP=1 or Warp not installed, skipping"
fi
echo ""

# ─── 11. Terminal.app defaults (Mac only) ───
if [ -d "/Applications/Utilities/Terminal.app" ]; then
  log "11. Configuring Terminal.app defaults..."
  plutil -replace "Default Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  plutil -replace "Startup Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  defaults write com.apple.Terminal Shell -string "/bin/zsh"
  ok "Terminal.app theme = Pro, shell = /bin/zsh"
fi
echo ""

# ─── 12. Reload shell ───
log "12. Reload zsh..."
# Reload shell only if interactive
if [ -n "${PS1:-}" ]; then
  exec zsh
else
  ok "zsh (manual reload: exec zsh or open new terminal)"
fi
echo ""

# ─── 13. Final verification ───
if [ "${SKIP_VERIFY:-0}" != "1" ]; then
  log "13. Final verification..."
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
