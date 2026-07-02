#!/usr/bin/env bash
# setup/verify.sh
# Verifies that AI-OS is correctly installed. 1-command.
# Usage: bash setup/verify.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"

LOG_PREFIX="[ai-os verify]"
log() { echo "$LOG_PREFIX $*"; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }
err() { echo "$LOG_PREFIX ❌ $*" >&2; }
section() { echo ""; echo "$LOG_PREFIX ─── $* ───"; }

PASS=0
FAIL=0

# ─── 1. AI-OS path ───
section "1. AI-OS path"
if [ -d "$AI_OS_ROOT" ] && [ -f "$AI_OS_ROOT/CLAUDE.md" ]; then
  ok "AI-OS at $AI_OS_ROOT"
  PASS=$((PASS+1))
else
  err "AI-OS not found at $AI_OS_ROOT"
  FAIL=$((FAIL+1))
fi

# ─── 2. Dotfiles ───
section "2. Dotfiles symlinks"
for dotfile in ".zshrc" ".p10k.zsh" ".gitignore_global"; do
  if [ -L "$HOME_DIR/$dotfile" ]; then
    target=$(readlink "$HOME_DIR/$dotfile")
    if [ -e "$target" ]; then
      ok "  $dotfile → $target"
      PASS=$((PASS+1))
    else
      err "  $dotfile → $target (BROKEN)"
      FAIL=$((FAIL+1))
    fi
  else
    warn "  $dotfile is not a symlink (may be OK if you have your own custom config)"
  fi
done

# ─── 3. Skills in 5 CLIs ───
section "3. Global skills (6 CLIs)"
CLI_DIRS=(
  "$HOME_DIR/.claude/skills"
  "$HOME_DIR/.codex/skills"
  "$HOME_DIR/.gemini/skills"
  "$HOME_DIR/.agents/skills"
  "$HOME_DIR/.hermes/skills/imported"
  "$HOME_DIR/.minimax/skills"
)
for cli_dir in "${CLI_DIRS[@]}"; do
  if [ -d "$cli_dir" ]; then
    # Count skills: each skill is a directory or symlink-to-directory.
    # Exclude meta files (READMEDD, llms, .system).
    count=$(find "$cli_dir" -maxdepth 1 -mindepth 1 ! -name "READMEDD.md" ! -name "taste-skill-llms.txt" ! -name ".system" 2>/dev/null | wc -l | tr -d ' ')
    label="~/${cli_dir#$HOME_DIR/}"
    ok "  ${label}: $count skills"
    PASS=$((PASS+1))
  else
    err "  $cli_dir does not exist"
    FAIL=$((FAIL+1))
  fi
done

# ─── 3b. Global instruction bridge (loads AI-OS in every project) ───
section "3b. Global instruction bridge"
BRIDGE="$AI_OS_ROOT/ai-config/clis/GLOBAL_BRIDGE.md"
if [ ! -f "$BRIDGE" ]; then
  err "  bridge source missing: $BRIDGE"
  FAIL=$((FAIL+1))
else
  ok "  bridge source: $BRIDGE"
  PASS=$((PASS+1))
fi
# Each CLI's global instruction file must point at the bridge.
declare -a BRIDGE_TARGETS=(
  "$HOME_DIR/.claude/CLAUDE.md"
  "$HOME_DIR/.codex/AGENTS.md"
  "$HOME_DIR/.gemini/GEMINI.md"
  "$HOME_DIR/.agents/AGENTS.md"
)
for target in "${BRIDGE_TARGETS[@]}"; do
  label="~/${target#$HOME_DIR/}"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$BRIDGE" ] && [ -e "$target" ]; then
    ok "  $label → bridge"
    PASS=$((PASS+1))
  else
    err "  $label not linked to bridge (run setup/install-mac.sh)"
    FAIL=$((FAIL+1))
  fi
done
# Hermes carries the bridge block inside SOUL.md.
if [ -f "$HOME_DIR/.hermes/SOUL.md" ] && grep -q "AI-OS BRIDGE" "$HOME_DIR/.hermes/SOUL.md"; then
  ok "  ~/.hermes/SOUL.md carries AI-OS bridge block"
  PASS=$((PASS+1))
else
  warn "  ~/.hermes/SOUL.md missing AI-OS bridge block (Hermes only)"
fi
# MiniMax Code carries the overlay inside each agent.md.
if [ -d "$HOME_DIR/.minimax/agents" ]; then
  mm_ok=0; mm_total=0
  for agent_dir in "$HOME_DIR/.minimax/agents"/*/; do
    [ -d "$agent_dir" ] || continue
    mm_total=$((mm_total+1))
    grep -q "AI-OS operating context" "$agent_dir/agent.md" 2>/dev/null && mm_ok=$((mm_ok+1))
  done
  if [ "$mm_ok" -eq "$mm_total" ] && [ "$mm_total" -gt 0 ]; then
    ok "  ~/.minimax: AI-OS overlay in $mm_ok/$mm_total agent.md"
    PASS=$((PASS+1))
  else
    err "  ~/.minimax: overlay only in $mm_ok/$mm_total agent.md (run setup/install-mac.sh)"
    FAIL=$((FAIL+1))
  fi
fi

# ─── 4. Superpowers (14 required) ───
section "4. Superpowers skills (REQUIRED = 14)"
EXPECTED=14
ACTUAL=0
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  if [ -d "$HOME_DIR/.claude/skills/$skill" ]; then
    ACTUAL=$((ACTUAL+1))
  fi
done
if [ "$ACTUAL" -eq "$EXPECTED" ]; then
  ok "14/14 superpowers skills OK"
  PASS=$((PASS+1))
else
  err "Only $ACTUAL/14 superpowers skills installed"
  FAIL=$((FAIL+1))
fi

# ─── 5. MCP servers ───
section "5. MCP servers"
if [ -f "$HOME_DIR/.hermes/config.yaml" ]; then
  if command -v yq >/dev/null 2>&1; then
    mcp_count=$(yq '.mcp_servers | length' "$HOME_DIR/.hermes/config.yaml" 2>/dev/null || echo "0")
    if [ "$mcp_count" -gt 0 ]; then
      ok "MCP servers configured: $mcp_count"
      PASS=$((PASS+1))
    else
      err "MCP servers = 0 (regenerate config)"
      FAIL=$((FAIL+1))
    fi
  else
    warn "yq not installed, cannot count MCP servers"
  fi
else
  err "~/.hermes/config.yaml does not exist"
  FAIL=$((FAIL+1))
fi

# ─── 6. Oh My Zsh + Powerlevel10k ───
section "6. Shell (Oh My Zsh + Powerlevel10k)"
if [ -d "$HOME_DIR/.oh-my-zsh" ]; then
  ok "Oh My Zsh installed"
  PASS=$((PASS+1))
else
  err "Oh My Zsh not installed"
  FAIL=$((FAIL+1))
fi
if [ -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  ok "Powerlevel10k installed"
  PASS=$((PASS+1))
else
  err "Powerlevel10k not installed"
  FAIL=$((FAIL+1))
fi

# ─── 7. Warp (optional) ───
section "7. Warp (optional)"
if [ -d "/Applications/Warp.app" ]; then
  if defaults read dev.warp.Warp-Stable font_family 2>/dev/null | grep -q "CaskaydiaCove"; then
    ok "Warp with CaskaydiaCove Nerd Font"
    PASS=$((PASS+1))
  else
    warn "Warp installed but font not configured (may be OK)"
  fi
else
  warn "Warp not installed (may be OK if you use another terminal)"
fi

# ─── 8. Brew packages ───
section "8. Brew packages (verifies that brew works)"
# List of packages that AI-OS assumes via brew (adjust according to your stack)
# Note: git/gh/python/node usually come with macOS/Xcode CLI, not always via brew.
BREW_PACKAGES=("uv" "yq" "warp")
INSTALLED=0
for pkg in "${BREW_PACKAGES[@]}"; do
  if brew list 2>/dev/null | grep -qE "(^|/)$pkg(\s|$)"; then
    ok "  $pkg installed via brew"
    INSTALLED=$((INSTALLED+1))
  else
    warn "  $pkg NOT installed via brew (may be installed elsewhere)"
  fi
done
if [ "$INSTALLED" -gt 0 ]; then
  ok "brew works ($INSTALLED/${#BREW_PACKAGES[@]} packages installed)"
  PASS=$((PASS+1))
else
  warn "no brew package detected — but it may be OK if you use system packages"
fi

# ─── 9. npm globals ───
section "9. npm globals (matches dev-env/packages/npm-globals.txt)"
if command -v npm >/dev/null 2>&1 && [ -f "$AI_OS_ROOT/dev-env/packages/npm-globals.txt" ]; then
  NPM_LIST_FILE="$AI_OS_ROOT/dev-env/packages/npm-globals.txt"
  EXPECTED_NPM=$(grep -vE '^\s*#|^\s*$' "$NPM_LIST_FILE" | wc -l | tr -d ' ')
  INSTALLED_NPM=$(npm ls -g --depth=0 --parseable 2>/dev/null | xargs -I{} basename {} | sort -u | wc -l | tr -d ' ')
  MISSING_NPM=0
  missing_pkgs=""
  while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
    pkg="${raw_pkg%%#*}"
    pkg="$(printf '%s' "$pkg" | xargs)"
    [ -z "$pkg" ] && continue
    if ! npm ls -g "$pkg" >/dev/null 2>&1; then
      MISSING_NPM=$((MISSING_NPM+1))
      missing_pkgs="$missing_pkgs $pkg"
    fi
  done < "$NPM_LIST_FILE"
  if [ "$MISSING_NPM" -eq 0 ]; then
    ok "All $EXPECTED_NPM npm globals present ($INSTALLED_NPM total installed)"
    PASS=$((PASS+1))
  else
    warn "$MISSING_NPM npm globals missing:$missing_pkgs"
    warn "Run install-mac.sh to install (or set SKIP_NPM=1 if intentionally skipped)"
  fi
else
  warn "npm not available or npm-globals.txt missing — skipping npm check"
fi

# ─── 10. Python user packages ───
section "10. Python user packages (matches dev-env/packages/pip-packages.txt)"
if command -v python3 >/dev/null 2>&1 && [ -f "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" ]; then
  PY_CMD=python3
elif command -v python >/dev/null 2>&1 && [ -f "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" ]; then
  PY_CMD=python
else
  PY_CMD=""
fi
if [ -n "$PY_CMD" ]; then
  PIP_LIST_FILE="$AI_OS_ROOT/dev-env/packages/pip-packages.txt"
  MISSING_PIP=0
  missing_pkgs=""
  while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
    pkg="${raw_pkg%%#*}"
    pkg="$(printf '%s' "$pkg" | xargs)"
    # strip version specifiers for the import check (e.g. "mcp[cli]" or "ruff>=1.0")
    import_name="$(printf '%s' "$pkg" | sed -E 's/^([A-Za-z0-9._-]+).*/\1/' | tr '[:upper:]' '[:lower:]' | tr -d -- '-_')"
    [ -z "$pkg" ] && continue
    if ! "$PY_CMD" -c "import importlib, sys; sys.exit(0 if importlib.util.find_spec('$import_name') else 1)" 2>/dev/null; then
      MISSING_PIP=$((MISSING_PIP+1))
      missing_pkgs="$missing_pkgs $pkg"
    fi
  done < "$PIP_LIST_FILE"
  if [ "$MISSING_PIP" -eq 0 ]; then
    ok "All pip user packages importable"
    PASS=$((PASS+1))
  else
    warn "$MISSING_PIP pip user packages missing:$missing_pkgs"
    warn "Run install-mac.sh to install (or set SKIP_PIP=1 if intentionally skipped)"
  fi
else
  warn "Python not available or pip-packages.txt missing — skipping pip check"
fi

# ─── Summary ───
section "Summary"
echo ""
log "Passed: $PASS"
if [ "$FAIL" -gt 0 ]; then
  err "Failed: $FAIL"
  exit 1
else
  ok "Failed: 0"
  echo ""
  ok "AI-OS is correctly installed. 🎉"
  exit 0
fi