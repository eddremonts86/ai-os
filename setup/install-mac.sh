#!/usr/bin/env bash
# setup/install-mac.sh
# Setup AI-OS on Mac from zero. 1-command.
#
# Usage:
#   git clone https://github.com/eddremonts86/ai-os "$AI_OS_ROOT"
#   cd "$AI_OS_ROOT"
#   (AI_OS_ROOT = any checkout path you choose; the script derives it from its own location)
#   bash setup/install-mac.sh            # what install.yaml says, else the defaults
#   bash setup/install-mac.sh --full     # every CLI, component and package, no exclusions (the shell and
#                                        # terminal look stay opt-in: shell_theme, fonts, terminal_theme)
#   bash setup/install-mac.sh --yes      # no confirmation prompt (same as ASSUME_YES=1)
# To choose CLIs, components and packages one by one: `npx @edd_remonts/create-ai-os` or `ai-os install`.
#
# Idempotent: runs multiple times without breaking anything.
# Options (env vars):
#   SKIP_BREW=1      → skip brew packages
#   SKIP_NPM=1       → skip npm packages
#   SKIP_PIP=1       → skip Python user packages
#   SKIP_DOTFILES=1  → skip dotfile symlinks
#   SKIP_MCP=1       → skip MCP config regeneration
#   SKIP_VERIFY=1    → skip verification at the end
#   ASSUME_YES=1     → skip the preflight confirmation prompt
#   DRY_RUN=1        → simulate without executing (CI mode)
#   UI_INDEXER=1     → also install ui-indexador (github.com/eddremonts86/ui-indexador): the shadcn
#                      registry index the aios-ui-* skills query over MCP. Clones it to
#                      UI_INDEXER_DIR (default ~/.ai-os/apps/ui-indexador), runs it as launchd
#                      services and builds its index in the background. Re-runs update an existing clone.
#   FLOORPLAN=1      → also install Floorplan (github.com/haydenschmitty/floorplan), the interactive
#                      codebase map, as a Claude Code / Codex plugin. It reads the commit vetted for AI-OS
#                      (FLOORPLAN_SHA) from ~/.cache/ai-os/floorplan, never the default branch, and is
#                      opt-in even under --full: its Ask bar runs `claude -p` under your own permission rules.
#   AIOS_SHELL_THEME=1    → Oh My Zsh + Powerlevel10k and AI-OS's full ~/.zshrc / ~/.p10k.zsh
#                           (an existing file is moved to *.pre-aios.bak). Default: keep your
#                           ~/.zshrc and add one line that sources dev-env/dotfiles/zsh/aios.zsh.
#   AIOS_FONTS=1          → install the CaskaydiaCove Nerd Font
#   AIOS_TERMINAL_THEME=1 → restyle Terminal.app (Pro) and Warp (font, size, opacity)
#   EXTRAS=1         → also install dev-env/packages/Brewfile.extras (optional
#                      GUI apps, language runtimes, infra CLIs). Default: core only.
#
# Per-person profile: context/personal/machine/install.yaml (git-ignored, created by
# setup/seed-personal-context.py). It sets the AIOS_* opt-ins above (an env var wins), the
# optional CLIs (clis: codex, gemini), extra packages (brew, casks, npm) and MCP overrides, and what the
# selector (create-ai-os / ai-os install) chose: skip: (claude, opencode, memory, mcp, ponytail, hooks),
# exclude: (package names from the shared lists), extras:, ui_indexer: and floorplan:. --full / AIOS_FULL=1 ignores
# skip: and exclude: and turns extras and ui_indexer on (floorplan and the shell/terminal look stay opt-in).

set -euo pipefail

for arg in "$@"; do
  case "$arg" in
    --full) export AIOS_FULL=1 ;;
    -y | --yes) export ASSUME_YES=1 ;;
    --dry-run) export DRY_RUN=1 ;;
    -h | --help) sed -n '2,/^$/p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "install-mac.sh: unknown option $arg (try --help)" >&2; exit 2 ;;
  esac
done

# ─── Paths ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"
LOG_PREFIX="[ai-os install]"
MANIFEST="$AI_OS_ROOT/ai-config/manifest.yaml"
ADAPTER_TEMPLATE="$AI_OS_ROOT/ai-config/templates/global-bridge.md.tmpl"

# ─── Logging ───
log() { echo "$LOG_PREFIX $*"; }
err() { echo "$LOG_PREFIX ❌ $*" >&2; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }

# ─── Per-person install profile (context/personal/machine/install.yaml) ───
INSTALL_PROFILE="${AIOS_INSTALL_PROFILE:-$AI_OS_ROOT/context/personal/machine/install.yaml}"
# One value per line for a list, the value for a scalar, nothing when unset or yq is missing.
profile_get() {
  [ -f "$INSTALL_PROFILE" ] && command -v yq >/dev/null 2>&1 || return 0
  case "$(yq -r ".$1 | tag" "$INSTALL_PROFILE" 2>/dev/null)" in
    '!!seq') yq -r ".$1[]" "$INSTALL_PROFILE" 2>/dev/null ;;
    '!!null' | '') ;;
    *) yq -r ".$1" "$INSTALL_PROFILE" 2>/dev/null ;;
  esac
}
# An env var wins; otherwise `key: true` in the profile turns the opt-in on.
profile_flag() { [ "$(profile_get "$1")" = "true" ] && echo 1 || echo 0; }
# What the environment said before any profile read: a second read (once yq is installed) must start from these,
# not from the 0s the first read wrote while yq was missing.
_ENV_SHELL_THEME="${AIOS_SHELL_THEME-}" _ENV_FONTS="${AIOS_FONTS-}" _ENV_TERMINAL_THEME="${AIOS_TERMINAL_THEME-}"
_ENV_EXTRAS="${EXTRAS-}" _ENV_UI_INDEXER="${UI_INDEXER-}" _ENV_FLOORPLAN="${FLOORPLAN-}"
load_profile_flags() {
  # The look of your shell and terminal stays opt-in, --full included: it replaces your own ~/.zshrc.
  AIOS_SHELL_THEME="${_ENV_SHELL_THEME:-$(profile_flag shell_theme)}"
  AIOS_FONTS="${_ENV_FONTS:-$(profile_flag fonts)}"
  AIOS_TERMINAL_THEME="${_ENV_TERMINAL_THEME:-$(profile_flag terminal_theme)}"
  # Third-party plugin with its own Ask agent: opt-in, --full included
  FLOORPLAN="${_ENV_FLOORPLAN:-$(profile_flag floorplan)}"
  if [ "${AIOS_FULL:-0}" = "1" ]; then
    EXTRAS=1 UI_INDEXER=1
    return 0
  fi
  EXTRAS="${_ENV_EXTRAS:-$(profile_flag extras)}"
  UI_INDEXER="${_ENV_UI_INDEXER:-$(profile_flag ui_indexer)}"
  # skip: turns default-on parts off; an env var already set wins.
  local s
  for s in $(profile_get skip); do
    case "$s" in
      (claude) SKIP_CLAUDE_NATIVE="${SKIP_CLAUDE_NATIVE:-1}" ;;
      (opencode) SKIP_OPENCODE="${SKIP_OPENCODE:-1}" ;;
      (memory) SKIP_MEMORY="${SKIP_MEMORY:-1}" ;;
      (mcp) SKIP_MCP="${SKIP_MCP:-1}" ;;
      (ponytail) SKIP_PONYTAIL="${SKIP_PONYTAIL:-1}" ;;
      (hooks) SKIP_MEMORY_HOOK="${SKIP_MEMORY_HOOK:-1}" SKIP_COMPACT_HOOK="${SKIP_COMPACT_HOOK:-1}" ;;
      (*) warn "install.yaml skip: unknown entry '$s' (claude, opencode, memory, mcp, ponytail, hooks)" ;;
    esac
  done
}
# A shared package list without the names in install.yaml exclude: (all of it under --full).
# Brewfile lines match on the quoted name, plain lists (pip, npm) on the entry without its comment.
without_excluded() {
  local ex=""
  [ "${AIOS_FULL:-0}" = "1" ] || ex="$(profile_get exclude)"
  [ -f "$1" ] || return 0
  # The list goes in through the environment: BSD awk rejects a newline inside -v.
  AIOS_EXCLUDE="$ex" awk '
    BEGIN { n = split(ENVIRON["AIOS_EXCLUDE"], a, "\n"); for (i = 1; i <= n; i++) if (a[i] != "") x[a[i]] = 1 }
    {
      name = $0
      if (match($0, /^(brew|cask) "[^"]+"/)) { name = substr($0, RSTART, RLENGTH); sub(/^(brew|cask) "/, "", name); sub(/"$/, "", name) }
      else { sub(/#.*/, "", name); gsub(/[ \t]/, "", name) }
      if (!(name in x)) print
    }' "$1"
}
load_profile_flags
# Global Node packages to have: the shared list, the profile's npm:, and the optional CLIs that ship on npm.
npm_wanted() {
  { without_excluded "$AI_OS_ROOT/dev-env/packages/npm-globals.txt" | grep -vE '^[[:space:]]*(#|$)' || true; } | sed -E 's/[[:space:]]*#.*//;s/[[:space:]]*$//'
  profile_get npm
  local clis
  clis="$(profile_get clis)"
  [ "${AIOS_FULL:-0}" = "1" ] && clis="codex gemini"
  for cli in $clis; do
    case "$cli" in
      (codex) echo "@openai/codex" ;;
      (gemini) echo "@google/gemini-cli" ;;
      (*) ;;  # Hermes, opencode, Antigravity: their own installers
    esac
  done
}

require_manifest_tool() {
  command -v yq >/dev/null 2>&1 || { err "yq is required to read $MANIFEST"; exit 1; }
  [ -f "$MANIFEST" ] || { err "Manifest missing: $MANIFEST"; exit 1; }
}

preserve_or_replace() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ] && [ "${REPLACE_EXISTING:-0}" != "1" ]; then
    warn "Preserving existing $target (set REPLACE_EXISTING=1 to replace it)"
    return 1
  fi
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.pre-aios.bak"
  fi
  return 0
}

# Claude Code CLI, native build only. A pnpm global of @anthropic-ai/claude-code
# skips the package's postinstall and leaves a shim that just prints "claude
# native binary not installed", so a `claude` on PATH is not proof of anything:
# every candidate has to answer --version. Stable install paths first; the
# Claude desktop app's bundled CLI (versioned path, moves on every app update)
# is a last resort, good for one-off calls such as `plugin install`.
native_claude() {
  local c
  for c in "$HOME_DIR/.local/bin/claude" "$HOME_DIR/.claude/local/claude" /opt/homebrew/bin/claude; do
    [ -x "$c" ] && "$c" --version >/dev/null 2>&1 && { printf '%s\n' "$c"; return 0; }
  done
  return 1
}
resolve_claude() {
  local c found=""
  native_claude && return 0
  c="$(command -v claude 2>/dev/null || true)"
  [ -n "$c" ] && "$c" --version >/dev/null 2>&1 && { printf '%s\n' "$c"; return 0; }
  for c in "$HOME_DIR/Library/Application Support/Claude/claude-code/"*/*/claude.app/Contents/MacOS/claude; do
    [ -x "$c" ] && "$c" --version >/dev/null 2>&1 && found="$c"
  done
  [ -n "$found" ] && { printf '%s\n' "$found"; return 0; }
  return 1
}

# ─── Floorplan pin (read by the plan above and step 9g) ───
# The commit security-reviewed for AI-OS (v0.11.0). A newer version is a new review, then a new SHA here.
FLOORPLAN_SHA="${FLOORPLAN_SHA:-94f81b463b7617e06d873ac71323ce71644c8399}"

# ─── Ponytail pin (read by 5b, 7b and 9c) ───
# 5b (env.sh) and 7b (global bridge) regenerate their files in full on every
# run, so ponytail has to be part of those renders: an append in 9c was wiped by
# any later run that skipped or failed before 9c. Enabled when this run wires
# ponytail, or an earlier run already did (its config exists), so a partial run
# with SKIP_PONYTAIL=1 renders the same files as a full one.
PONYTAIL_VERSION="${PONYTAIL_VERSION:-4.9.0}"
PONYTAIL_CFG="$HOME_DIR/.config/ponytail/config.json"
if [ -z "${PONYTAIL_DEFAULT_MODE:-}" ] && [ -f "$PONYTAIL_CFG" ]; then
  PONYTAIL_DEFAULT_MODE="$(sed -n 's/.*"defaultMode"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$PONYTAIL_CFG" | head -1)"
fi
PONYTAIL_DEFAULT_MODE="${PONYTAIL_DEFAULT_MODE:-full}"
PONYTAIL_ENABLED=0
if [ "${SKIP_PONYTAIL:-0}" != "1" ] || [ -f "$PONYTAIL_CFG" ]; then
  PONYTAIL_ENABLED=1
fi

# ─── Install manifest (shown before anything is installed) ───
BREWFILE="$AI_OS_ROOT/dev-env/packages/Brewfile"
BREWFILE_EXTRAS="$AI_OS_ROOT/dev-env/packages/Brewfile.extras"
NPM_GLOBALS="$AI_OS_ROOT/dev-env/packages/npm-globals.txt"
PIP_PACKAGES="$AI_OS_ROOT/dev-env/packages/pip-packages.txt"
SKILLS_DIR="$AI_OS_ROOT/ai-config/skills"

# The lists as this install uses them: install.yaml exclude: removed (refreshed once yq is there).
BREWFILE_USE="$(mktemp -t aios-brewfile.XXXXXX)"; BREWFILE_EXTRAS_USE="$(mktemp -t aios-brewfile-extras.XXXXXX)"; PIP_USE="$(mktemp -t aios-pip-list.XXXXXX)"
trap 'rm -f "$BREWFILE_USE" "$BREWFILE_EXTRAS_USE" "$PIP_USE"' EXIT
use_lists() {
  without_excluded "$BREWFILE" > "$BREWFILE_USE"
  without_excluded "$BREWFILE_EXTRAS" > "$BREWFILE_EXTRAS_USE"
  without_excluded "$PIP_PACKAGES" > "$PIP_USE"
}
use_lists

# count non-comment, non-blank lines in a package file (0 if missing)
count_pkgs() { [ -f "$1" ] && { grep -cvE '^[[:space:]]*(#|$)' "$1" || true; } || echo 0; }
# comma-join names on stdin, wrap to terminal-ish width, indent
join_fold() { paste -sd' ' - | sed 's/ /, /g' | fold -s -w 66 | sed 's/^/        /'; }

show_manifest() {
  local n_formulae n_casks n_node n_pip n_skills
  n_formulae=$(grep -cE '^brew ' "$BREWFILE_USE" 2>/dev/null || echo 0)
  n_casks=$(grep -cE '^cask ' "$BREWFILE_USE" 2>/dev/null || echo 0)
  n_node=$(npm_wanted | grep -c . || true)
  n_pip=$(count_pkgs "$PIP_USE")
  n_skills=$([ -d "$SKILLS_DIR" ] && find "$SKILLS_DIR" -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' ' || echo 0)

  [ "${AIOS_FULL:-0}" = "1" ] && log "--full: every CLI, component and package (install.yaml skip: and exclude: ignored; shell/terminal look stays opt-in)"
  log "This will install / configure the following on your machine:"
  echo ""
  echo "  📦 Homebrew CLI tools & runtimes ($n_formulae):"
  grep -E '^brew ' "$BREWFILE_USE" 2>/dev/null | sed -E 's/brew "([^"]+)".*/\1/' | join_fold
  echo ""
  echo "  🖥  Homebrew apps & fonts (casks, $n_casks):"
  grep -E '^cask ' "$BREWFILE_USE" 2>/dev/null | sed -E 's/cask "([^"]+)".*/\1/' | join_fold
  echo ""
  if [ "${EXTRAS:-0}" = "1" ]; then
    local n_formulae_x n_casks_x
    n_formulae_x=$(grep -cE '^brew ' "$BREWFILE_EXTRAS_USE" 2>/dev/null || echo 0)
    n_casks_x=$(grep -cE '^cask ' "$BREWFILE_EXTRAS_USE" 2>/dev/null || echo 0)
    echo "  ➕ EXTRAS=1 — also installing ($n_formulae_x CLI + $n_casks_x apps):"
    { grep -E '^(brew|cask) ' "$BREWFILE_EXTRAS_USE" 2>/dev/null | sed -E 's/(brew|cask) "([^"]+)".*/\2/'; } | join_fold
  else
    log "Skipping optional apps/runtimes in Brewfile.extras (set EXTRAS=1 to include them)"
  fi
  echo ""
  echo "  🟢 Global Node packages via pnpm ($n_node):"
  npm_wanted | join_fold
  echo ""
  echo "  🐍 Python packages in ~/.ai-os/venv ($n_pip):"
  grep -vE '^[[:space:]]*(#|$)' "$PIP_USE" 2>/dev/null | sed -E 's/[[:space:]]*#.*//;s/[[:space:]]*$//' | join_fold
  grep -q '^liteparse' "$PIP_USE" 2>/dev/null \
    && echo "  🔎 OCRia-nano-1 OCR model for lit (~75 MB, ~/.cache/liteparse): free commercial use only under \$2M revenue and funding"
  echo ""
  echo "  🧠 AI skills symlinked into every CLI (~$n_skills)"
  [ "${SKIP_MCP:-0}" = "1" ] || echo "  🔌 MCP servers → ~/.hermes/config.yaml"
  [ "${SKIP_MEMORY:-0}" = "1" ] || echo "  💾 Memory stack (Docker): FalkorDB, Ollama, code indexers"
  [ "${UI_INDEXER:-0}" = "1" ] && echo "  🧩 ui-indexador (shadcn registry index, launchd services)"
  [ "${FLOORPLAN:-0}" = "1" ] && echo "  🗺  Floorplan plugin (codebase map), pinned to ${FLOORPLAN_SHA:0:12}"
  local skipped=""
  [ "${SKIP_CLAUDE_NATIVE:-0}" = "1" ] && skipped+=" Claude Code"
  [ "${SKIP_OPENCODE:-0}" = "1" ] && skipped+=" opencode"
  [ "${SKIP_MEMORY:-0}" = "1" ] && skipped+=" memory-stack"
  [ "${SKIP_MCP:-0}" = "1" ] && skipped+=" MCP"
  [ "${SKIP_PONYTAIL:-0}" = "1" ] && skipped+=" ponytail"
  [ "${SKIP_MEMORY_HOOK:-0}" = "1" ] && skipped+=" hooks"
  [ -n "$skipped" ] && echo "  ⏭  Skipped:$skipped"
  if [ "${AIOS_SHELL_THEME:-0}" = "1" ]; then
    echo "  🐚 Shell: Oh My Zsh, Powerlevel10k, AI-OS ~/.zshrc and ~/.p10k.zsh (yours kept as *.pre-aios.bak)"
  else
    echo "  🐚 Shell: one line added to your ~/.zshrc (AIOS_SHELL_THEME=1 for Oh My Zsh + p10k)"
  fi
  echo "  📁 Instruction adapters for Claude, Codex, Gemini, Hermes, Antigravity"
  echo ""
  log "Locations touched: /opt/homebrew, ~/.ai-os, ~/.local/bin, ~/Library/pnpm,"
  log "  ~/.hermes, ~/.claude, ~/.codex, ~/.gemini, ~/.agents, and \$HOME dotfiles."
  echo ""
}

confirm_or_exit() {
  # never block automation: honor ASSUME_YES, and auto-proceed without a TTY
  if [ "${ASSUME_YES:-0}" = "1" ]; then
    log "ASSUME_YES=1 — proceeding without prompt."
    return 0
  fi
  if [ ! -t 0 ]; then
    log "Non-interactive shell — proceeding (set ASSUME_YES=1 to silence this)."
    return 0
  fi
  printf '%s Proceed with the installation above? [y/N] ' "$LOG_PREFIX"
  read -r reply
  case "$reply" in
    [Yy] | [Yy][Ee][Ss]) echo "" ;;
    *) log "Aborted — nothing was installed."; exit 0 ;;
  esac
}

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

# ─── Preflight: show everything, then confirm ───
# install.yaml (skip:, exclude:, opt-ins) needs yq. When there is one, get yq first so the list below is
# the one that gets installed; without one there is nothing to read and yq comes in step 0 as before.
if [ -f "$INSTALL_PROFILE" ] && ! command -v yq >/dev/null 2>&1 && command -v brew >/dev/null 2>&1; then
  log "Installing yq first, to read $INSTALL_PROFILE..."
  brew install yq && { load_profile_flags; use_lists; } || warn "yq install failed: install.yaml not applied to the list below"
fi
show_manifest
confirm_or_exit

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
command -v yq >/dev/null || { warn "yq not installed, installing with brew..."; brew install yq; load_profile_flags; use_lists; }

ok "Prerequisites OK"
echo ""

# ─── 1. Brew packages ───
if [ "${SKIP_BREW:-0}" != "1" ]; then
  log "1. Installing missing Brew packages (first run may take 5-15 min)..."
  cd "$AI_OS_ROOT"
  # Homebrew 4.6+ refuses formulae from untrusted third-party taps;
  # `brew trust` doesn't exist on older versions, so ignore failures there.
  brew trust hashicorp/tap >/dev/null 2>&1 || true
  brew trust aws/tap >/dev/null 2>&1 || true
  # --no-upgrade: install what is missing, never upgrade what is already there
  # (a re-run used to upgrade every outdated cask, e.g. docker-desktop mid-use).
  # A failed package is reported at the end instead of aborting every later step.
  if HOMEBREW_NO_AUTO_UPDATE=1 brew bundle install --no-upgrade --file="$BREWFILE_USE"; then
    ok "Brew packages installed"
  else
    BREW_FAILED=1
    warn "brew bundle reported failures; continuing (see output above)"
  fi
  # Extras from the personal profile (brew: / casks:), as a throwaway Brewfile.
  profile_brewfile="$(mktemp -t aios-profile-brewfile)"
  { profile_get brew | sed 's/.*/brew "&"/'; profile_get casks | sed 's/.*/cask "&"/'; } > "$profile_brewfile"
  if [ -s "$profile_brewfile" ]; then
    log "1a. Personal brew packages (install.yaml)..."
    if HOMEBREW_NO_AUTO_UPDATE=1 brew bundle install --no-upgrade --file="$profile_brewfile"; then
      ok "Personal brew packages installed"
    else
      BREW_FAILED=1
      warn "brew bundle (personal) reported failures; continuing"
    fi
  fi
  rm -f "$profile_brewfile"
  if [ "${EXTRAS:-0}" = "1" ]; then
    log "1b. EXTRAS=1 — installing dev-env/packages/Brewfile.extras..."
    if HOMEBREW_NO_AUTO_UPDATE=1 brew bundle install --no-upgrade --file="$BREWFILE_EXTRAS_USE"; then
      ok "Brew extras installed"
    else
      BREW_FAILED=1
      warn "brew bundle (extras) reported failures; continuing"
    fi
  fi
else
  log "1. SKIP_BREW=1, skipping brew"
fi
echo ""

# ─── 2. Global Node packages (via pnpm) ───
# pnpm is used instead of npm: stricter dependency resolution and a content-
# addressable store, which avoids npm's flat-hoist phantom-dependency risks.
if [ "${SKIP_NPM:-0}" != "1" ]; then
  log "2. Installing global Node packages (pnpm) from dev-env/packages/npm-globals.txt..."
  if command -v pnpm >/dev/null 2>&1; then
    # pnpm needs PNPM_HOME to place global bins; the AI-OS zshrc adds it to PATH
    export PNPM_HOME="${PNPM_HOME:-$HOME_DIR/Library/pnpm}"
    export PATH="$PNPM_HOME/bin:$PNPM_HOME:$PATH"  # pnpm 10 puts global bins in $PNPM_HOME/bin
    # Only add what is missing, in ONE `pnpm add -g` call: a per-package loop
    # re-resolved (and upgraded) every installed global on every run. Upgrades
    # are deliberate: `pnpm update -g`.
    installed_globals="$(pnpm ls -g --depth=0 --parseable 2>/dev/null | sed 's|.*/node_modules/||' | sort -u)"
    npm_missing=()
    while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
      pkg="${raw_pkg%%#*}"
      pkg="$(printf '%s' "$pkg" | xargs)"
      [ -z "$pkg" ] && continue
      printf '%s\n' "$installed_globals" | grep -qxF "$pkg" || npm_missing+=("$pkg")
    done < <(npm_wanted)
    if [ "${#npm_missing[@]}" -eq 0 ]; then
      ok "global Node packages already installed (none missing)"
    elif pnpm add -g "${npm_missing[@]}"; then
      ok "global Node packages installed: ${npm_missing[*]}"
    else
      # one bad package must not abort the whole install (set -e)
      warn "pnpm add -g failed for: ${npm_missing[*]} (one bad name fails the batch; check above)"
    fi
  else
    warn "pnpm not found; skipping global Node packages (install: brew install pnpm)"
  fi
else
  log "2. SKIP_NPM=1, skipping global Node packages"
fi
echo ""

# ─── 2a. Claude Code CLI (native build, not a pnpm global) ───
# @anthropic-ai/claude-code left npm-globals.txt: pnpm skips its postinstall, so
# the shim it installs only errors out (see native_claude above). The native
# build self-updates in ~/.local/bin. SKIP_CLAUDE_NATIVE=1 skips the download.
log "2a. Claude Code CLI (native)..."
if CLAUDE_NATIVE="$(native_claude)"; then
  ok "  native Claude Code: $CLAUDE_NATIVE ($("$CLAUDE_NATIVE" --version 2>/dev/null | head -1))"
elif [ "${SKIP_CLAUDE_NATIVE:-0}" = "1" ]; then
  warn "  no native Claude Code (SKIP_CLAUDE_NATIVE=1) — install: curl -fsSL https://claude.ai/install.sh | bash"
elif curl -fsSL https://claude.ai/install.sh | bash && CLAUDE_NATIVE="$(native_claude)"; then
  ok "  native Claude Code installed: $CLAUDE_NATIVE"
else
  warn "  native Claude Code install failed — retry: curl -fsSL https://claude.ai/install.sh | bash"
fi
# A leftover broken pnpm copy shadows the native one on PATH; drop it, but only
# once a working native build exists (never leave the machine with no claude).
pnpm_claude="${PNPM_HOME:-$HOME_DIR/Library/pnpm}/claude"
if [ -n "${CLAUDE_NATIVE:-}" ] && [ -e "$pnpm_claude" ] && ! "$pnpm_claude" --version >/dev/null 2>&1; then
  if pnpm remove -g @anthropic-ai/claude-code >/dev/null 2>&1; then
    ok "  removed broken pnpm @anthropic-ai/claude-code shim (native build wins on PATH)"
  else
    warn "  broken pnpm claude shim at $pnpm_claude — remove: pnpm remove -g @anthropic-ai/claude-code"
  fi
fi
CLAUDE_BIN="$(resolve_claude || true)"
[ -n "$CLAUDE_BIN" ] || warn "  no working claude binary found — Claude Code plugin steps will be skipped"
echo ""

# ─── 3. Python packages (isolated AI-OS venv) ───
# Homebrew's Python is externally managed (PEP 668), so `pip install` is
# rejected. Install everything into a dedicated uv venv instead; its bin is
# added to PATH by the AI-OS zshrc, so CLI tools (ruff, black, ipython, …)
# stay callable while brew's python3 remains the default interpreter.
if [ "${SKIP_PIP:-0}" != "1" ]; then
  log "3. Installing Python packages into AI-OS venv (~/.ai-os/venv)..."
  if command -v uv >/dev/null 2>&1; then
    AIOS_VENV="$HOME_DIR/.ai-os/venv"
    [ -x "$AIOS_VENV/bin/python" ] || uv venv "$AIOS_VENV" >/dev/null 2>&1 || true
    # Only install what is missing, in ONE `uv pip install -r` call (was one
    # resolve per package). Names are normalised like verify.sh section 10
    # (PEP 503: lowercase, _→-; extras and version specifiers stripped).
    installed_dists="$(uv pip list --python "$AIOS_VENV/bin/python" --format freeze 2>/dev/null \
      | sed -E 's/==.*//' | tr '[:upper:]' '[:lower:]' | tr '_' '-')"
    pip_req="$(mktemp -t aios-pip-XXXXXX)"
    while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
      pkg="${raw_pkg%%#*}"
      pkg="$(printf '%s' "$pkg" | xargs)"
      [ -z "$pkg" ] && continue
      dist="$(printf '%s' "$pkg" | sed -E 's/\[.*//; s/[><=~!].*//' | xargs | tr '[:upper:]' '[:lower:]' | tr '_' '-')"
      printf '%s\n' "$installed_dists" | grep -qxF "$dist" || printf '%s\n' "$pkg" >> "$pip_req"
    done < "$PIP_USE"
    if [ ! -s "$pip_req" ]; then
      ok "Python packages already installed in $AIOS_VENV (none missing)"
    elif uv pip install --python "$AIOS_VENV/bin/python" -r "$pip_req"; then
      ok "Python packages installed into $AIOS_VENV: $(paste -sd' ' "$pip_req")"
    else
      # one bad package must not abort the whole install (set -e)
      warn "uv pip install failed for: $(paste -sd' ' "$pip_req") (one bad name fails the batch; check above)"
    fi
    rm -f "$pip_req"
    # Playwright needs a browser binary on top of the wheel; without it the
    # diagram-design skill's PNG export fails at runtime with a launch error.
    # ~120MB download, so only fetch it when chromium is actually missing.
    if [ -x "$AIOS_VENV/bin/playwright" ]; then
      if "$AIOS_VENV/bin/playwright" install --dry-run chromium 2>/dev/null | grep -qi "already installed"; then
        ok "Playwright chromium already present (diagram-design PNG export)"
      elif "$AIOS_VENV/bin/playwright" install chromium >/dev/null 2>&1; then
        ok "Playwright chromium installed (diagram-design PNG export)"
      else
        warn "playwright install chromium failed; diagram-design PNG export unavailable (SVG/HTML still work)"
      fi
    fi
    # LiteParse's `lit` turns scans and screenshots into text locally (rules/always_do.md "Images and
    # scanned PDFs"). The OCRia-nano-1 model is a separate ~75 MB download; without it lit uses its
    # Tesseract engine. `pull` re-downloads every time, so only pull when it is not listed.
    if [ -x "$AIOS_VENV/bin/lit" ]; then
      if "$AIOS_VENV/bin/lit" models list 2>/dev/null | grep -q '^ocria-nano@'; then
        ok "OCRia-nano-1 OCR model already present (lit)"
      elif "$AIOS_VENV/bin/lit" models pull ocria-nano@1.0.0 -q >/dev/null 2>&1; then
        ok "OCRia-nano-1 OCR model installed (lit); licence: free commercial use only under \$2M revenue and funding"
      else
        warn "lit models pull ocria-nano@1.0.0 failed; lit falls back to Tesseract"
      fi
    fi
  else
    warn "uv not found; skipping Python packages (install: brew install uv)"
  fi
else
  log "3. SKIP_PIP=1, skipping Python packages"
fi
echo ""

# ─── 4. Fonts (opt-in: AIOS_FONTS=1) ───
if [ "${AIOS_FONTS:-0}" = "1" ]; then
  log "4. Verifying Nerd Fonts..."
  CASKE_FONT="$HOME/Library/Fonts/CaskaydiaCoveNerdFont-Regular.ttf"
  if [ ! -f "$CASKE_FONT" ]; then
    warn "CaskaydiaCove Nerd Font not installed. Installing..."
    brew install --cask font-caskaydia-cove-nerd-font
  else
    ok "CaskaydiaCove Nerd Font already installed"
  fi
else
  log "4. Fonts: not requested (AIOS_FONTS=1 installs CaskaydiaCove Nerd Font)"
fi
echo ""

# Add or refresh a marked block in a file the user owns, never replacing their content.
# $1 file, $2 block body, $3 "prepend" or "append". Idempotent: the block between the markers is rewritten.
aios_block() {
  local file="$1" body="$2" where="${3:-append}" tmp
  local begin="# >>> ai-os >>>" end="# <<< ai-os <<<"
  touch "$file"
  # An opening marker with no closing one would make the awk below drop the rest of the file: keep a copy first.
  if grep -qxF "$begin" "$file" && ! grep -qxF "$end" "$file"; then
    cp "$file" "$file.pre-aios.bak"; warn "$file had an unclosed ai-os block; copy kept at $file.pre-aios.bak"
  fi
  tmp="$(mktemp)"
  awk -v b="$begin" -v e="$end" '$0==b{skip=1;next} $0==e{skip=0;next} !skip' "$file" > "$tmp"
  if [ "$where" = "prepend" ]; then
    { printf '%s\n%s\n%s\n' "$begin" "$body" "$end"; cat "$tmp"; } > "$file"
  else
    { cat "$tmp"; printf '%s\n%s\n%s\n' "$begin" "$body" "$end"; } > "$file"
  fi
  rm -f "$tmp"
}
# True when $1 is a symlink into this checkout (an earlier install linked it: leave it alone).
aios_linked() { [ -L "$1" ] && case "$(readlink "$1")" in "$AI_OS_ROOT"/*) true ;; *) false ;; esac; }

# ─── 5. Symlinks for dotfiles ───
if [ "${SKIP_DOTFILES:-0}" != "1" ]; then
  log "5. Creating dotfiles symlinks..."

  # zsh: the full themed .zshrc only on request; otherwise one sourced line in the user's own file.
  if [ "${AIOS_SHELL_THEME:-0}" = "1" ]; then
    [ -e "$HOME_DIR/.zshrc" ] && [ ! -L "$HOME_DIR/.zshrc" ] && mv "$HOME_DIR/.zshrc" "$HOME_DIR/.zshrc.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/zsh/.zshrc" "$HOME_DIR/.zshrc"
    ok "  .zshrc → ai-os (themed)"
    [ -e "$HOME_DIR/.p10k.zsh" ] && [ ! -L "$HOME_DIR/.p10k.zsh" ] && mv "$HOME_DIR/.p10k.zsh" "$HOME_DIR/.p10k.zsh.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/zsh/.p10k.zsh" "$HOME_DIR/.p10k.zsh"
    ok "  .p10k.zsh → ai-os"
  elif aios_linked "$HOME_DIR/.zshrc"; then
    ok "  .zshrc already links to ai-os, left as is"
  else
    aios_block "$HOME_DIR/.zshrc" "[ -f \"$AI_OS_ROOT/dev-env/dotfiles/zsh/aios.zsh\" ] && source \"$AI_OS_ROOT/dev-env/dotfiles/zsh/aios.zsh\""
    ok "  .zshrc: kept yours, AI-OS block sources dev-env/dotfiles/zsh/aios.zsh"
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
    if [ -e "$HOME_DIR/.ssh/config" ] && ! aios_linked "$HOME_DIR/.ssh/config"; then
      # Theirs stays first, so every value they set wins; AI-OS defaults (and the personal hosts) fill the gaps.
      aios_block "$HOME_DIR/.ssh/config" "Match all
Include $AI_OS_ROOT/dev-env/dotfiles/ssh/config" append
      chmod 600 "$HOME_DIR/.ssh/config"
      ok "  .ssh/config: kept yours, AI-OS block includes dev-env/dotfiles/ssh/config"
    else
      ln -sf "$AI_OS_ROOT/dev-env/dotfiles/ssh/config" "$HOME_DIR/.ssh/config"
      chmod 600 "$HOME_DIR/.ssh/config"
      ok "  .ssh/config → ai-os"
    fi
    if [ -f "$AI_OS_ROOT/context/personal/machine/dotfiles/ssh/config" ]; then
      ln -sf "$AI_OS_ROOT/context/personal/machine/dotfiles/ssh/config" "$HOME_DIR/.ssh/config.personal"
      chmod 600 "$AI_OS_ROOT/context/personal/machine/dotfiles/ssh/config"
      ok "  .ssh/config.personal → context/personal"
    fi
  fi
else
  log "5. SKIP_DOTFILES=1, skipping dotfiles"
fi
echo ""

# ─── 5b. Per-machine AI-OS env vars (~/.ai-os/env.sh) ───
# NEVER append env vars to ~/.zshrc here. Step 4 symlinks ~/.zshrc to the
# TRACKED dev-env/dotfiles/zsh/.zshrc, so an append writes straight through the
# symlink into the repo and commits this machine's absolute paths — exactly what
# ai-config/manifest.yaml rules out for the instruction adapters ("no committed
# user path"). It also left `git status` dirty after every fresh install.
#
# Instead: generate an untracked per-machine file and let the tracked .zshrc
# source it through a committed `[ -f … ] && source …` guard.
log "5b. Writing per-machine env vars to ~/.ai-os/env.sh..."
AIOS_ENV_FILE="$HOME_DIR/.ai-os/env.sh"
mkdir -p "$HOME_DIR/.ai-os"
# Regenerated in full on every run: every value here is derived, so there is
# nothing user-authored to preserve. Values stay overridable from the
# environment via ${VAR:-default}.
cat > "$AIOS_ENV_FILE" <<EOF
# Generated by setup/install-mac.sh — DO NOT EDIT, DO NOT COMMIT.
# Per-machine AI-OS environment. Regenerate: bash setup/install-mac.sh
# Sourced by dev-env/dotfiles/zsh/.zshrc through a committed guard.
export AI_OS_ROOT="\${AI_OS_ROOT:-$AI_OS_ROOT}"
export OLLAMA_URL="\${OLLAMA_URL:-http://localhost:11500}"
# The \`ollama\` CLI reads OLLAMA_HOST, not OLLAMA_URL; without it every
# \`ollama list/pull/rm\` dials the default :11434 and finds no server.
export OLLAMA_HOST="\${OLLAMA_HOST:-127.0.0.1:11500}"
EOF
# Part of the same render (see "Ponytail pin" at the top), not a 9c append.
if [ "$PONYTAIL_ENABLED" = "1" ]; then
  printf 'export PONYTAIL_DEFAULT_MODE="${PONYTAIL_DEFAULT_MODE:-%s}"\n' "$PONYTAIL_DEFAULT_MODE" >> "$AIOS_ENV_FILE"
  ok "  ~/.ai-os/env.sh: AI_OS_ROOT + OLLAMA_URL + PONYTAIL_DEFAULT_MODE (untracked, per-machine)"
else
  ok "  ~/.ai-os/env.sh: AI_OS_ROOT + OLLAMA_URL (untracked, per-machine)"
fi
# Where ui-indexador lives on this machine (step 8b), so a re-run finds a clone outside the default path.
if [ -n "${UI_INDEXER_DIR:-}" ]; then
  printf 'export UI_INDEXER_DIR="${UI_INDEXER_DIR:-%s}"\n' "$UI_INDEXER_DIR" >> "$AIOS_ENV_FILE"
fi

# The AI-OS .zshrc already carries the source guard (committed once). If the
# user kept their own ~/.zshrc instead, add the guard there — that file is
# theirs and untracked, so appending to it has no repo side effect.
AIOS_ZSHRC="$HOME_DIR/.zshrc"
if [ -e "$AIOS_ZSHRC" ] || [ -L "$AIOS_ZSHRC" ]; then
  case "$(readlink "$AIOS_ZSHRC" 2>/dev/null || true)" in
    "$AI_OS_ROOT"/dev-env/dotfiles/*)
      ok "  ~/.zshrc is the AI-OS dotfile (guard already committed)" ;;
    *)
      if grep -qE '\.ai-os/env\.sh|dotfiles/zsh/aios\.zsh' "$AIOS_ZSHRC" 2>/dev/null; then
        ok "  ~/.zshrc already sources ~/.ai-os/env.sh"
      else
        printf '\n# AI-OS per-machine env (added by setup/install-mac.sh)\n[ -f "$HOME/.ai-os/env.sh" ] && source "$HOME/.ai-os/env.sh"\n' >> "$AIOS_ZSHRC"
        ok "  ~/.zshrc: source guard added (own dotfile, not the AI-OS one)"
      fi ;;
  esac
fi

# ─── 5b2. `ai-os` on the PATH ───
# The dispatcher resolves symlinks to find the repo, so a link in ~/.local/bin (already
# on PATH via the zshrc) is all it needs. The installer never created it before, so every
# `ai-os health|backup|update|...` in the docs failed with "command not found".
mkdir -p "$HOME_DIR/.local/bin"
ln -sfn "$AI_OS_ROOT/ai-os" "$HOME_DIR/.local/bin/ai-os"
ok "5b2. ai-os command: ~/.local/bin/ai-os → $AI_OS_ROOT/ai-os"

# ─── 5c. Git hooks for this clone (pre-push gate, see setup/hooks/pre-push) ───
# Repo-local config only; never touches the global git config or other repos.
if [ -d "$AI_OS_ROOT/.git" ] || git -C "$AI_OS_ROOT" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$AI_OS_ROOT" config core.hooksPath setup/hooks
  ok "5c. git hooks: pre-push gate enabled (skip once: git push --no-verify)"
fi

# ─── 5d. Personal context (context/personal/ is git-ignored: write the stubs once, never overwrite) ───
if seeded="$(python3 "$SCRIPT_DIR/seed-personal-context.py" "$AI_OS_ROOT" 2>&1)"; then
  ok "5d. personal context: $seeded (edit context/personal/ to describe yourself)"
else
  warn "5d. could not seed context/personal/ ($seeded); run setup/seed-personal-context.py by hand"
fi

# ─── 6. Oh My Zsh + Powerlevel10k (opt-in: AIOS_SHELL_THEME=1) ───
if [ "${AIOS_SHELL_THEME:-0}" = "1" ]; then
# Pinned refs (P1-4): Oh My Zsh has no version tags, so pin a specific commit
# SHA instead of the mutable `master` branch. Bump deliberately after review,
# e.g.: curl -s https://api.github.com/repos/ohmyzsh/ohmyzsh/commits/master
OHMYZSH_REF="677a4592b18c08ddea737f8aca70bac0e9fc9313"
P10K_TAG="v1.20.0"
ZSH_AUTOSUGGESTIONS_TAG="v0.7.1"
ZSH_SYNTAX_HIGHLIGHTING_TAG="0.8.0"
ZSH_COMPLETIONS_TAG="0.36.0"
if [ ! -d "$HOME_DIR/.oh-my-zsh" ]; then
  log "6. Installing Oh My Zsh (pinned to commit ${OHMYZSH_REF:0:12})..."
  # KEEP_ZSHRC: step 5 already linked the AI-OS .zshrc; the OMZ installer would swap in its template.
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/${OHMYZSH_REF}/tools/install.sh")" 2>&1 | tail -3
  ok "Oh My Zsh installed"
else
  ok "Oh My Zsh already installed"
fi

if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  log "   Installing Powerlevel10k (${P10K_TAG})..."
  git clone --depth=1 --branch "$P10K_TAG" https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/themes/powerlevel10k" 2>&1 | tail -2
  ok "   Powerlevel10k installed"
fi

# Additional plugins (pinned tags, not the default branch).
# NOTE: macOS ships bash 3.2 as /bin/bash (Apple never upgraded past the last
# GPLv2 release) and this script's `#!/usr/bin/env bash` shebang resolves to
# that on any Mac without a newer bash earlier on PATH. bash 3.2 has no
# associative arrays (`declare -A`) — it silently falls back to arithmetic
# indexed-array subscripts, so `[zsh-autosuggestions]` gets parsed as
# `zsh - autosuggestions` and fails with "zsh: unbound variable" under
# `set -u`. Use a case statement instead; it works on every bash version.
for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions; do
  if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/plugins/$plugin" ]; then
    case "$plugin" in
      zsh-autosuggestions) plugin_tag="$ZSH_AUTOSUGGESTIONS_TAG" ;;
      zsh-syntax-highlighting) plugin_tag="$ZSH_SYNTAX_HIGHLIGHTING_TAG" ;;
      zsh-completions) plugin_tag="$ZSH_COMPLETIONS_TAG" ;;
    esac
    log "   Installing plugin: $plugin (${plugin_tag})"
    git clone --depth=1 --branch "$plugin_tag" "https://github.com/zsh-users/$plugin" \
      "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/plugins/$plugin" 2>&1 | tail -1
  fi
done
ok "Oh My Zsh + plugins OK"
else
  log "6. Shell theme: not requested (AIOS_SHELL_THEME=1 installs Oh My Zsh + Powerlevel10k)"
fi
echo ""

# ─── 6b. Clean up the superseded Hermes symlink tree (P1-2) ───
# Hermes now reads ~/.agents/skills via skills.external_dirs (step 9 below)
# instead of getting a symlinked copy under ~/.hermes/skills/imported/. Remove
# that old tree, but only if AI-OS made it (every entry is still a symlink
# into ai-config/skills or vendor/gstack) — never touch real user content.
OLD_HERMES_IMPORTED="$HOME_DIR/.hermes/skills/imported"
if [ -d "$OLD_HERMES_IMPORTED" ]; then
  safe_to_remove=1
  for entry in "$OLD_HERMES_IMPORTED"/*; do
    [ -e "$entry" ] || continue
    if [ ! -L "$entry" ]; then
      safe_to_remove=0
      break
    fi
    tgt=$(readlink "$entry")
    case "$tgt" in
      *"/ai-config/skills/"*|*"/vendor/gstack/"*) ;;
      *) safe_to_remove=0; break ;;
    esac
  done
  if [ "$safe_to_remove" = "1" ]; then
    rm -rf "$OLD_HERMES_IMPORTED"
    ok "Removed superseded ~/.hermes/skills/imported/ (Hermes now reads ~/.agents/skills directly)"
  else
    warn "~/.hermes/skills/imported/ contains non-AI-OS content; leaving it in place (Hermes also reads ~/.agents/skills now, so skills may appear twice)"
  fi
fi
echo ""

# ─── 7. Global skills (native destinations from manifest) ───
require_manifest_tool
log "7. Setting global skills in native client destinations..."
# Only flat skills (a dir with a top-level SKILL.md) are symlinked here. A dir
# with a nested plugin layout (skills/<name>/SKILL.md) is NOT a skill and no
# script installs it: flatten it to make it linkable. ECC is steps 7e/7f.
#   Claude ~/.claude/skills | Codex ~/.codex/skills | Gemini ~/.gemini/skills
#   Antigravity ~/.agents/skills | Hermes reads ~/.agents/skills via skills.external_dirs (no copy)
#   MiniMax Code ~/.minimax/skills (global skills.paths entry in opencode.json)
while IFS=$'\t' read -r client_id client_path client_required; do
  cli_dir="$HOME_DIR/$client_path"
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
    if [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ]; then
      preserve_or_replace "$cli_dir/$name" || continue
    fi
    ln -sfn "$skill_dir" "$cli_dir/$name"
  done
done < <(yq -r '.platforms.macos.skills.clients[] | [.id, .path, .required] | @tsv' "$MANIFEST")

SKILL_COUNT=$(find "$AI_OS_ROOT/ai-config/skills" -maxdepth 2 -name SKILL.md -path "*/ai-config/skills/*/SKILL.md" | wc -l | tr -d ' ')
ok "Skills propagated to manifest client destinations ($SKILL_COUNT flat skills in source)"
echo ""

# ─── 7c. Vendored gstack skills (read-only subtree at vendor/gstack/) ───
# Mirrors the ECC pattern: optional, third-party, propagated to the same 5 CLIs
# that get flat-skill symlinks (Hermes reads these via skills.external_dirs —
# ~/.agents/skills already includes them once Antigravity's copy is updated).
# Currently inlines 3 skills (spec, context-save, context-restore). Refresh with:
#   git -C "$AI_OS_ROOT/vendor/gstack" pull  (when an upstream is configured)
if [ -d "$AI_OS_ROOT/vendor/gstack" ]; then
  log "7c. Setting vendored gstack skills in 5 CLIs..."
  GSTACK_COUNT=0
  while IFS=$'\t' read -r client_id client_path client_required; do
    cli_dir="$HOME_DIR/$client_path"
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
      if [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ]; then
        preserve_or_replace "$cli_dir/$name" || continue
      fi
      ln -sfn "$skill_dir" "$cli_dir/$name"
    done
  done < <(yq -r '.platforms.macos.skills.clients[] | [.id, .path, .required] | @tsv' "$MANIFEST")
  GSTACK_COUNT=$(find "$AI_OS_ROOT/vendor/gstack" -maxdepth 2 -name SKILL.md -path "*/vendor/gstack/*/SKILL.md" | wc -l | tr -d ' ')
  ok "Vendored gstack skills propagated ($GSTACK_COUNT skills in source)"
else
  log "7c. vendor/gstack/ absent, skipping"
fi
echo ""

# ─── 7e. Selective ECC skills (vendor/ecc/, DAILY subset only) ───
# vendor/ecc/ holds only the curated ECC subset AI-OS uses (see
# vendor/ecc/VENDORED_FROM.md). Like vendor/gstack/ (7c) but driven by the
# named list in vendor/ecc/DAILY_SKILLS.txt, picked by an evidence-backed
# agent-sort pass against this repo (2026-09-20).
# That file is the single source of truth for the list — don't duplicate it
# here or in setup/verify.sh; both read the same file.
ECC_DAILY_LIST="$AI_OS_ROOT/vendor/ecc/DAILY_SKILLS.txt"
if [ -d "$AI_OS_ROOT/vendor/ecc/skills" ] && [ -f "$ECC_DAILY_LIST" ]; then
  log "7e. Setting curated ECC DAILY skills in 5 CLIs..."
  ECC_DAILY_COUNT=0
  while IFS=$'\t' read -r client_id client_path client_required; do
    cli_dir="$HOME_DIR/$client_path"
    mkdir -p "$cli_dir"
    # Prune stale ECC symlinks whose target is gone (mirrors 7c's gstack prune).
    for link in "$cli_dir"/*; do
      [ -L "$link" ] || continue
      tgt=$(readlink "$link")
      case "$tgt" in
        *"/vendor/ecc/skills/"*) [ -f "${tgt%/}/SKILL.md" ] || rm -f "$link" ;;
      esac
    done
    while IFS= read -r name; do
      [ -n "$name" ] || continue
      case "$name" in \#*) continue ;; esac
      skill_dir="$AI_OS_ROOT/vendor/ecc/skills/$name"
      [ -f "$skill_dir/SKILL.md" ] || { warn "  ECC skill '$name' listed in DAILY_SKILLS.txt but missing SKILL.md — skipping"; continue; }
      if [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ]; then
        preserve_or_replace "$cli_dir/$name" || continue
      fi
      ln -sfn "$skill_dir" "$cli_dir/$name"
    done < "$ECC_DAILY_LIST"
  done < <(yq -r '.platforms.macos.skills.clients[] | [.id, .path, .required] | @tsv' "$MANIFEST")
  ECC_DAILY_COUNT=$(grep -vc '^\s*#\|^\s*$' "$ECC_DAILY_LIST")
  ok "Curated ECC DAILY skills propagated ($ECC_DAILY_COUNT skills, per vendor/ecc/DAILY_SKILLS.txt)"
else
  log "7e. vendor/ecc/skills/ or DAILY_SKILLS.txt absent, skipping"
fi
echo ""

# ─── 7f. Selective ECC agents (Claude Code only: vendored, Claude-format files) ───
# AI-OS's own agents go to every CLI in step 7g. These 3 vendored ones stay
# Claude-only symlinks, picked by the 2026-09-20 agent-sort pass: real gaps in
# ai-os's own Node/TS/Vue stack.
ECC_DAILY_AGENTS=(typescript-reviewer vue-reviewer build-error-resolver)
if [ -d "$AI_OS_ROOT/vendor/ecc/agents" ]; then
  log "7f. Setting curated ECC DAILY agents in Claude Code..."
  mkdir -p "$HOME_DIR/.claude/agents"
  ECC_AGENT_COUNT=0
  for name in "${ECC_DAILY_AGENTS[@]}"; do
    src="$AI_OS_ROOT/vendor/ecc/agents/$name.md"
    [ -f "$src" ] || { warn "  ECC agent '$name' missing at $src — skipping"; continue; }
    dest="$HOME_DIR/.claude/agents/$name.md"
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
      preserve_or_replace "$dest" || continue
    fi
    ln -sfn "$src" "$dest"
    ECC_AGENT_COUNT=$((ECC_AGENT_COUNT + 1))
  done
  ok "Curated ECC DAILY agents propagated ($ECC_AGENT_COUNT/${#ECC_DAILY_AGENTS[@]}) to ~/.claude/agents/"
else
  log "7f. vendor/ecc/agents/ absent, skipping"
fi
echo ""

# ─── 7g. Cross-CLI agents (ai-config/agents + context/personal/agents → each CLI's own format) ───
log "7g. Distributing agents to Claude Code, Codex, Gemini and opencode..."
agents_py="$HOME_DIR/.ai-os/venv/bin/python"; [ -x "$agents_py" ] || agents_py=python3
if "$agents_py" "$SCRIPT_DIR/render-agents.py" --home "$HOME_DIR"; then
  ok "Agents distributed (edit ai-config/agents, then: ai-os agents)"
else
  warn "render-agents.py failed; agents not distributed (needs PyYAML: the AI-OS venv has it)"
fi
echo ""

# ─── 7d. Global commands (source of truth: ai-config/commands) ───
# Mirrors the skills flow (step 7) for slash-command-style combos (/action,
# /full, /gen-html, ...) that don't fit the Agent Skills model as a distinct
# artifact everywhere: Claude Code/Codex/Antigravity/Hermes/this VS Code
# session already get these via ai-config/skills/{action,full,gen-html} (step
# 7 above — a Skill IS a command there). This step covers the two client
# types that need a separate, differently-formatted command file: VS Code
# Copilot Chat's global prompts folder (*.prompt.md, same Markdown+frontmatter
# source verbatim) and Gemini CLI's custom commands (TOML only, per
# https://google-gemini.github.io/gemini-cli/docs/cli/custom-commands.html —
# confirmed 2026-07-30, no SKILL.md-based custom-command support documented).
# Mirrors setup/install-windows.ps1 step 5d.
log "7d. Distributing global commands (VS Code prompts + Gemini TOML)..."
COMMANDS_DIR="$AI_OS_ROOT/ai-config/commands"
CMD_COUNT=$(find "$COMMANDS_DIR" -maxdepth 1 -name '*.md' ! -name 'README.md' 2>/dev/null | wc -l | tr -d ' ')
if [ "$CMD_COUNT" -gt 0 ]; then
  # VS Code Copilot Chat: global prompts folder, verbatim copy as *.prompt.md.
  # Fixed path (not per-account like globalStorage), covers Code + Code -
  # Insiders on macOS and Linux (install-mac.sh doubles as the Linux
  # installer). Gated on the CLI's own User/ dir already existing so this
  # never creates clutter for a VS Code variant that isn't installed on this box.
  VSCODE_PROMPTS_DIRS=(
    "$HOME_DIR/Library/Application Support/Code/User/prompts"
    "$HOME_DIR/Library/Application Support/Code - Insiders/User/prompts"
    "$HOME_DIR/.config/Code/User/prompts"
    "$HOME_DIR/.config/Code - Insiders/User/prompts"
  )
  VSCODE_PROMPTS_WIRED=0
  for dir in "${VSCODE_PROMPTS_DIRS[@]}"; do
    [ -d "$(dirname "$dir")" ] || continue
    mkdir -p "$dir"
    for cmd in "$COMMANDS_DIR"/*.md; do
      [ -f "$cmd" ] || continue
      name=$(basename "$cmd")
      [ "$name" = "README.md" ] && continue
      cp "$cmd" "$dir/${name%.md}.prompt.md"
    done
    VSCODE_PROMPTS_WIRED=$((VSCODE_PROMPTS_WIRED + 1))
  done
  if [ "$VSCODE_PROMPTS_WIRED" -gt 0 ]; then
    ok "  VS Code prompts: $CMD_COUNT command(s) -> $VSCODE_PROMPTS_WIRED prompts folder(s)"
  else
    warn "  VS Code prompts skipped (no Code/Code - Insiders User dir found on this box)"
  fi

  # Gemini CLI: TOML custom commands, generated from the same Markdown source.
  GEMINI_COMMANDS_DIR="$HOME_DIR/.gemini/commands"
  mkdir -p "$GEMINI_COMMANDS_DIR"
  for cmd in "$COMMANDS_DIR"/*.md; do
    [ -f "$cmd" ] || continue
    name=$(basename "$cmd" .md)
    [ "$name" = "README" ] && continue
    desc=$(sed -n 's/^description: *//p' "$cmd" | head -1 | sed 's/"/\\"/g')
    body=$(awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$cmd")
    {
      printf 'description = "%s"\n' "$desc"
      printf 'prompt = """\n%s\n"""\n' "$body"
    } > "$GEMINI_COMMANDS_DIR/$name.toml"
  done
  ok "  Gemini TOML commands: $CMD_COUNT command(s) -> $GEMINI_COMMANDS_DIR"
else
  log "7d. ai-config/commands/ empty or missing, skipping"
fi
echo ""

# ─── 7b. Rendered instruction adapters ───
log "7b. Rendering path-neutral instruction adapters..."
[ -f "$ADAPTER_TEMPLATE" ] || { err "Adapter template missing: $ADAPTER_TEMPLATE"; exit 1; }
ADAPTER_DIR="$HOME_DIR/.ai-os/adapters"
mkdir -p "$ADAPTER_DIR"
BRIDGE="$ADAPTER_DIR/global-bridge.md"
sed "s|{{AI_OS_ROOT}}|$AI_OS_ROOT|g" "$ADAPTER_TEMPLATE" > "$BRIDGE"
# Personal addendum (chat language, tone, trigger phrases): context/personal/me/bridge.md is git-ignored,
# so the shared template names nobody and your own rules still reach every CLI.
if [ -f "$AI_OS_ROOT/context/personal/me/bridge.md" ]; then
  { echo; cat "$AI_OS_ROOT/context/personal/me/bridge.md"; } >> "$BRIDGE"
fi
# Ponytail pointer, rendered with the bridge so a re-run never strips it (see
# "Ponytail pin" at the top). A short pointer, not upstream's AGENTS.md: this
# file is loaded every session by Claude, Codex, Gemini and Antigravity, the
# host plugins inject the full ruleset per turn, and rules/always_do.md already
# carries the ladder. Appended here rather than templated so install-windows.ps1,
# which renders the same template, never sees an unfilled placeholder.
if [ "$PONYTAIL_ENABLED" = "1" ]; then
  cat >> "$BRIDGE" <<PONYTAIL_BRIDGE

<!-- PONYTAIL (DietrichGebert/ponytail v${PONYTAIL_VERSION}) — rendered by setup/install-mac.sh 7b -->
Ponytail (lazy senior dev) is active at \`${PONYTAIL_DEFAULT_MODE}\`. Ladder: does it need to exist? → reuse → stdlib → native platform → installed dep → one line → minimum that works. Never cut validation/security/a11y. Toggle: /ponytail lite|full|ultra|off.
<!-- /PONYTAIL -->
PONYTAIL_BRIDGE
fi
while IFS=$'\t' read -r adapter_id adapter_path adapter_required; do
  target="$HOME_DIR/$adapter_path"
  mkdir -p "$(dirname "$target")"
  preserve_or_replace "$target" || continue
  ln -sfn "$BRIDGE" "$target"
done < <(yq -r '.platforms.macos.adapters[] | [.id, .path, .required] | @tsv' "$MANIFEST")
# Hermes is optional: only amend an existing SOUL.md and never replace it.
SOUL="$HOME_DIR/.hermes/SOUL.md"
HERMES_TEMPLATE="$AI_OS_ROOT/ai-config/templates/hermes-soul-block.md.tmpl"
if [ -f "$SOUL" ] && ! grep -q "AI-OS BRIDGE" "$SOUL"; then
  sed "s|{{AI_OS_ROOT}}|$AI_OS_ROOT|g" "$HERMES_TEMPLATE" >> "$SOUL"
fi
# MiniMax Code (mavis, opencode-based): each agent's agent.md is appended to the
# system prompt at runtime. Overwrite the stub with the AI-OS overlay (real file,
# not a symlink — mavis re-seeds this path).
MM_OVERLAY="$AI_OS_ROOT/ai-config/clis/minimax-overlay.md"
if [ "${MODIFY_OPTIONAL_INTEGRATIONS:-0}" = "1" ] && [ -d "$HOME_DIR/.minimax/agents" ] && [ -f "$MM_OVERLAY" ]; then
  for agent_dir in "$HOME_DIR/.minimax/agents"/*/; do
    [ -d "$agent_dir" ] && sed "s|{{AI_OS_ROOT}}|$AI_OS_ROOT|g" "$MM_OVERLAY" > "$agent_dir/agent.md"
  done
fi
# VS Code (GitHub Copilot Chat): unlike the CLIs above, Copilot Chat already
# discovers ~/.agents/skills on this Mac/Linux box by whatever mechanism backs
# its custom chat mode, so no skill-symlink step is needed here. It only needs
# the bridge block, appended (idempotent) to its global custom-instructions
# file — the `applyTo: '**'` frontmatter makes it load on every request in
# every workspace, same role as CLAUDE.md/AGENTS.md/GEMINI.md for the other
# CLIs. The file lives under a per-account subfolder we can't predict, so glob
# for it; best-effort, never fails the install if VS Code / Copilot Chat isn't
# set up on this box. Covers Code + Code - Insiders on both macOS
# (~/Library/Application Support/) and Linux (~/.config/) since install-mac.sh
# is also the Linux installer (see .github/workflows/test-linux.yml).
# WIRE_VSCODE defaults to on (this is the whole point of a post-install step:
# every enabled IDE/CLI gets the same bridge automatically, with no extra
# flags). Set WIRE_VSCODE=0 to opt out.
VSCODE_INSTR_GLOBS=(
  "$HOME_DIR/Library/Application Support/Code/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md"
  "$HOME_DIR/Library/Application Support/Code - Insiders/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md"
  "$HOME_DIR/.config/Code/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md"
  "$HOME_DIR/.config/Code - Insiders/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md"
)
VSCODE_WIRED=0
for f in "${VSCODE_INSTR_GLOBS[@]}"; do
  [ -f "$f" ] || continue
  if [ "${WIRE_VSCODE:-1}" = "1" ] && ! grep -q "AI-OS BRIDGE" "$f"; then
    cat >> "$f" <<AIOS_VSCODE

<!-- AI-OS BRIDGE — managed by $AI_OS_ROOT; remove this block to unlink -->
- AI-OS (operating context): single source of truth is \`$AI_OS_ROOT\`. For non-trivial work, read \`context/personal/me/profile.md\` and \`context/personal/me/preferences.md\` (if present) and \`CLAUDE.md\` from that repo before proceeding.
- Method: Spec → Verifier → Environment (Karpathy loop). Use the \`using-superpowers\` skill as the router for EVERY task, even simple ones — check whether a skill applies before responding, not just for domain-specific work.
- Chat language and tone: see \`context/personal/me/preferences.md\`. Code, commits, docs, comments, and logs stay in English always.
- Verify before claiming something is done: run the actual checks (tests/build/typecheck/browser) and report concrete evidence, never "looks fine" without proof.
- Confirm before irreversible or outward-facing actions (force-push, prod changes, sending messages, spending money) unless already explicitly authorized.
- Durable, cross-session facts go in this environment's own memory tool (\`/memories/\`); sync notable, cross-CLI-relevant facts back into \`context/personal/\` in the ai-os repo so Claude Code/Hermes/Codex/Gemini benefit too.
<!-- /AI-OS BRIDGE -->
AIOS_VSCODE
  fi
  VSCODE_WIRED=$((VSCODE_WIRED + 1))
done
ok "Required instruction adapters rendered from manifest"
[ "$VSCODE_WIRED" -gt 0 ] || warn "VS Code Copilot Chat adapter skipped (VS Code / Copilot Chat not found on this box)"
echo ""

# ─── 8. Superpowers skills (REQUIRED) ───
log "8. Verifying superpowers skills (REQUIRED)..."
EXPECTED=$(yq '.required_skills | length' "$MANIFEST")
ACTUAL=0
while IFS= read -r skill; do
  [ -d "$HOME_DIR/.claude/skills/$skill" ] && ACTUAL=$((ACTUAL + 1))
done < <(yq -r '.required_skills[]' "$MANIFEST")
if [ "$ACTUAL" -ne "$EXPECTED" ]; then
  warn "Only $ACTUAL/$EXPECTED superpowers skills installed. Linking from local source..."
  # The 14 superpowers are vendored in ai-config/skills/ (committed to this repo),
  # so link from there — no network dependency on obra/superpowers.
  while IFS= read -r skill; do
    src="$AI_OS_ROOT/ai-config/skills/$skill"
    if [ ! -d "$src" ]; then
      err "Superpower '$skill' missing from $AI_OS_ROOT/ai-config/skills — repo is incomplete, re-clone it"
      exit 1
    fi
    while IFS=$'\t' read -r client_id client_path client_required; do
      cli_dir="$HOME_DIR/$client_path"
      mkdir -p "$cli_dir"
      [ -e "$cli_dir/$skill" ] || ln -sfn "$src" "$cli_dir/$skill"
    done < <(yq -r '.platforms.macos.skills.clients[] | select(.required) | [.id, .path, .required] | @tsv' "$MANIFEST")
  done < <(yq -r '.required_skills[]' "$MANIFEST")
  ok "Superpowers linked ($EXPECTED/$EXPECTED)"
else
  ok "Superpowers OK ($ACTUAL/$EXPECTED)"
fi
echo ""

# ─── 8b. ui-indexador (optional: UI_INDEXER=1, or an existing clone) ───
# The shadcn registry index behind aios-ui-design / -improve / -review, as its own app and repo. Opt-in because
# it is heavy for what it gives someone who builds no UI: gh for star counts, Ollama's nomic-embed-text for
# semantic search, a ~15 min first crawl, ~100 MB of data. It runs before step 9 so the MCP generators find its
# service answering: ai-config/mcp/ui-indexador.yaml has `requires_url`, so machines without it never get a
# broken MCP entry.
UI_INDEXER_DIR="${UI_INDEXER_DIR:-$HOME_DIR/.ai-os/apps/ui-indexador}"
if [ "${UI_INDEXER:-0}" = "1" ] || [ -d "$UI_INDEXER_DIR/.git" ]; then
  log "8b. ui-indexador ($UI_INDEXER_DIR)..."
  if [ -d "$UI_INDEXER_DIR/.git" ]; then
    git -C "$UI_INDEXER_DIR" pull --ff-only --quiet && ok "  updated" || warn "  git pull failed — keeping the current checkout"
  else
    mkdir -p "$(dirname "$UI_INDEXER_DIR")"
    git clone --quiet https://github.com/eddremonts86/ui-indexador "$UI_INDEXER_DIR" && ok "  cloned" \
      || { warn "  clone failed — skipping ui-indexador"; UI_INDEXER_FAILED=1; }
  fi
  if [ "${UI_INDEXER_FAILED:-0}" != "1" ]; then
    ( cd "$UI_INDEXER_DIR" \
      && { [ -x .venv/bin/python ] || python3 -m venv .venv; } \
      && .venv/bin/pip install --quiet -r requirements.txt ) \
      && ok "  Python environment ready" || warn "  pip install failed — see $UI_INDEXER_DIR/requirements.txt"
    if command -v ollama >/dev/null 2>&1; then
      OLLAMA_HOST=127.0.0.1:11500 ollama list 2>/dev/null | grep -q "nomic-embed-text" \
        || OLLAMA_HOST=127.0.0.1:11500 ollama pull nomic-embed-text >/dev/null 2>&1 \
        || warn "  nomic-embed-text pull failed — ui-indexador will search by keyword only"
    fi
    if [ -f "$UI_INDEXER_DIR/data/catalog.json" ]; then
      UI_INDEXER_OLLAMA=http://localhost:11500 bash "$UI_INDEXER_DIR/schedule/install.sh" >/dev/null \
        && ok "  services loaded (API :3040, MCP :3041/mcp, refresh daily 11:30)" || warn "  launchd install failed"
    else
      UI_INDEXER_OLLAMA=http://localhost:11500 bash "$UI_INDEXER_DIR/schedule/install.sh" --run-now >/dev/null \
        && ok "  services loaded; first index build started in the background (~15 min, logs in $UI_INDEXER_DIR/logs)" \
        || warn "  launchd install failed"
    fi
    for _ in $(seq 1 15); do curl -sf -m 2 http://127.0.0.1:3040/health >/dev/null && break; sleep 1; done
  fi
else
  log "8b. ui-indexador not installed (opt in with UI_INDEXER=1); the aios-ui-* skills fall back to npx shadcn search"
fi
echo ""

# ─── 9. MCP servers + Hermes external skills dir (regenerate ~/.hermes/config.yaml) ───
if [ "${SKIP_MCP:-0}" != "1" ]; then
  log "9. Configuring MCP servers + skills.external_dirs from ai-config/mcp/*.yaml..."

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

  # Generate mcp_servers block with standalone python script (also works on Windows).
  # The AI-OS venv first, as in 9a: it carries PyYAML (pip-packages.txt), brew's
  # python3 does not, and the script refuses to run without it — which aborted
  # the whole install here under set -e.
  if [ -x "$HOME_DIR/.ai-os/venv/bin/python" ]; then
    "$HOME_DIR/.ai-os/venv/bin/python" "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml" "$HOME_DIR/.agents/skills"
  elif command -v python3 >/dev/null 2>&1; then
    python3 "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml" "$HOME_DIR/.agents/skills"
  elif command -v python >/dev/null 2>&1; then
    python "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml" "$HOME_DIR/.agents/skills"
  else
    warn "Python not found, cannot generate MCP config automatically"
  fi
fi
echo ""

# ─── 9a. IDE/CLI MCP servers (VS Code, Codex, Claude Code, Gemini) ───
# generate-mcp-config.py above only wires Hermes (~/.hermes/config.yaml). Every
# other AI client reads its OWN MCP config format/location -- without this
# step, tools like grepai/codebase-memory-mcp only ever get consulted by
# Hermes, never by whatever the user is actually chatting in day to day (VS
# Code Copilot Chat, Claude Code, Codex, Gemini CLI). Merge-preserving: only
# ADDS a server whose name doesn't already exist in that client's config --
# never overwrites a hand-customized entry. Skips a target entirely if that
# client isn't installed (its config dir doesn't exist) rather than
# speculatively creating one.
if [ "${SKIP_MCP:-0}" != "1" ]; then
  log "9a. Wiring MCP servers into installed IDEs/CLIs..."

  SYNC_MCP_ARGS=("$AI_OS_ROOT/ai-config/mcp")
  VSCODE_MCP="$HOME_DIR/Library/Application Support/Code/User/mcp.json"
  VSCODE_INSIDERS_MCP="$HOME_DIR/Library/Application Support/Code - Insiders/User/mcp.json"
  [ -d "$(dirname "$VSCODE_MCP")" ] && SYNC_MCP_ARGS+=(--vscode "$VSCODE_MCP")
  [ -d "$(dirname "$VSCODE_INSIDERS_MCP")" ] && SYNC_MCP_ARGS+=(--vscode-insiders "$VSCODE_INSIDERS_MCP")
  [ -d "$HOME_DIR/.codex" ] && SYNC_MCP_ARGS+=(--codex "$HOME_DIR/.codex/config.toml")
  [ -f "$HOME_DIR/.claude.json" ] && SYNC_MCP_ARGS+=(--claude "$HOME_DIR/.claude.json")
  [ -d "$HOME_DIR/.gemini" ] && SYNC_MCP_ARGS+=(--gemini "$HOME_DIR/.gemini/settings.json")

  if [ "${#SYNC_MCP_ARGS[@]}" -gt 1 ]; then
    if [ -x "$HOME_DIR/.ai-os/venv/bin/python" ]; then
      "$HOME_DIR/.ai-os/venv/bin/python" "$SCRIPT_DIR/sync-ide-mcp-servers.py" "${SYNC_MCP_ARGS[@]}"
    elif command -v python3 >/dev/null 2>&1; then
      python3 "$SCRIPT_DIR/sync-ide-mcp-servers.py" "${SYNC_MCP_ARGS[@]}"
    elif command -v python >/dev/null 2>&1; then
      python "$SCRIPT_DIR/sync-ide-mcp-servers.py" "${SYNC_MCP_ARGS[@]}"
    else
      warn "Python not found. IDE/CLI MCP servers not configured automatically."
    fi
  else
    log "  No known IDE/CLI config directories found -- nothing to wire"
  fi
fi
echo ""

# ─── 9b. Memory stack (FalkorDB + Ollama + code indexers, phase 1) ───
if [ "${SKIP_MEMORY:-0}" != "1" ]; then
  log "9b. Setting up AI-OS memory stack (FalkorDB, Ollama, code indexers)..."

  # 9b.1 — Ollama local server (for embeddings, free + private)
  #
  # A launchd service, not `nohup ollama serve &`. The detached-nohup version did not
  # survive a reboot, nothing restarted it, and the whole memory stack addresses Ollama at
  # :11500 — so embeddings and semantic search went quietly dead while the two Docker
  # containers stayed green. Also not `brew services start ollama`: Homebrew's plist has no
  # OLLAMA_HOST, so it binds the default 11434 that nothing here reads.
  if command -v ollama >/dev/null 2>&1; then
    if bash "$SCRIPT_DIR/../memory/launchd/install-ollama.sh" 2>&1 | sed 's/^/    /'; then
      ok "  Ollama service on 127.0.0.1:11500 with nomic-embed-text (logs: ~/.ollama/ai-os-ollama.log)"
    else
      warn "  Ollama service did not come up — embeddings and semantic search disabled"
    fi
  else
    warn "  ollama not installed (run: brew install ollama) — embedding features disabled"
  fi

  # 9b.2 — Unified AI-OS memory stack (FalkorDB + Graphiti in one compose project)
  if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
    mkdir -p "$AI_OS_ROOT/memory/falkordb/data" "$AI_OS_ROOT/memory/openwebui/data"
    COMPOSE_FILE="$AI_OS_ROOT/memory/docker-compose.yml"
    if docker compose version >/dev/null 2>&1; then
      if docker compose -f "$COMPOSE_FILE" up -d falkordb graphiti-mcp 2>&1 | tail -3; then
        ok "  AI-OS stack launched: FalkorDB :3300/:6390 + Graphiti :8021 (project: ia-os; chat UI is opt-in: --profile chat)"
        ok "    unified compose: $COMPOSE_FILE (name: ia-os)"
      else
        warn "  docker compose up failed (run manually: cd $AI_OS_ROOT/memory && docker compose -f docker-compose.yml up -d)"
      fi
    else
      if docker-compose -f "$COMPOSE_FILE" up -d falkordb graphiti-mcp 2>&1 | tail -3; then
        ok "  AI-OS stack launched: FalkorDB :3300/:6390 + Graphiti :8021 (project: ia-os; chat UI is opt-in: --profile chat)"
        ok "    unified compose: $COMPOSE_FILE (name: ia-os)"
      else
        warn "  docker-compose up failed"
      fi
    fi
  else
    warn "  docker not running (start Docker Desktop) — graph memory disabled until then"
  fi

  # 9b.3 — Static binary downloads (codebase-memory-mcp + grepai)
  mkdir -p "$HOME_DIR/.local/bin"
  # GitHub release asset names are OS-specific; auto-detect via uname -m
  CBM_ARCH="$(uname -m | sed 's/x86_64/amd64/; s/arm64/arm64/')"
  CBM_OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
  CBM_ASSET="codebase-memory-mcp-${CBM_OS}-${CBM_ARCH}.tar.gz"
  CBM_VERSION="v0.12.1"  # pinned; bump with: ai-os update --apply codebase-memory-mcp
  CBM_URL="https://github.com/deusdata/codebase-memory-mcp/releases/download/${CBM_VERSION}/${CBM_ASSET}"
  # checksums.txt is published for the same pinned tag, so bumping CBM_VERSION
  # automatically verifies against the matching release's hashes (P1-4).
  CBM_SUMS_URL="https://github.com/deusdata/codebase-memory-mcp/releases/download/${CBM_VERSION}/checksums.txt"
  if [ ! -x "$HOME_DIR/.local/bin/codebase-memory-mcp" ]; then
    if command -v curl >/dev/null 2>&1 && command -v tar >/dev/null 2>&1; then
      tmp_tar="$(mktemp -t cbm-XXXXXX.tar.gz)"
      tmp_sums="$(mktemp -t cbm-sums-XXXXXX.txt)"
      if curl -fsSL "$CBM_URL" -o "$tmp_tar" 2>/dev/null; then
        cbm_verified=0
        if curl -fsSL "$CBM_SUMS_URL" -o "$tmp_sums" 2>/dev/null; then
          expected_sum="$(grep -F "  ${CBM_ASSET}" "$tmp_sums" | awk '{print $1}' | head -1)"
          if command -v shasum >/dev/null 2>&1; then
            actual_sum="$(shasum -a 256 "$tmp_tar" | awk '{print $1}')"
          elif command -v sha256sum >/dev/null 2>&1; then
            actual_sum="$(sha256sum "$tmp_tar" | awk '{print $1}')"
          else
            actual_sum=""
          fi
          if [ -n "$expected_sum" ] && [ -n "$actual_sum" ] && [ "$expected_sum" = "$actual_sum" ]; then
            cbm_verified=1
          fi
        fi
        if [ "$cbm_verified" = "1" ]; then
          # Extract the binary from the tarball
          tar -xzf "$tmp_tar" -C "$HOME_DIR/.local/bin/" --strip-components=0 \
            && chmod +x "$HOME_DIR/.local/bin/codebase-memory-mcp" 2>/dev/null \
            && ok "  codebase-memory-mcp binary installed at ~/.local/bin/ (from $CBM_ASSET, sha256 verified)" \
            || warn "  codebase-memory-mcp extracted but chmod failed"
        else
          err "  codebase-memory-mcp checksum verification failed for $CBM_ASSET — refusing to install (expected published checksums.txt to match; check for a tampered or stale mirror)"
        fi
        rm -f "$tmp_tar" "$tmp_sums"
      else
        warn "  codebase-memory-mcp download failed (HTTP error for $CBM_URL)"
        warn "  install manually from https://github.com/deusdata/codebase-memory-mcp/releases"
        rm -f "$tmp_tar" "$tmp_sums"
      fi
    else
      warn "  curl + tar required for codebase-memory-mcp install"
    fi
  else
    ok "  codebase-memory-mcp already installed"
  fi

  # grepai built from a shallow clone of a pinned tag (bump deliberately, not
  # @latest — P1-4). `go install pkg@version` is rejected because upstream's
  # go.mod carries `exclude` directives, which Go only honours in the main module.
  GREPAI_VERSION="v1.2.0"
  # The clone + go build costs minutes; skip it when the pinned version is
  # already the one on PATH (the build stamps main.version, read back here).
  GREPAI_READY=0
  if "$HOME_DIR/.local/bin/grepai" version 2>/dev/null | grep -qF "${GREPAI_VERSION#v}"; then
    ok "  grepai ${GREPAI_VERSION} already built"
    GREPAI_READY=1
  elif command -v go >/dev/null 2>&1; then
    GREPAI_SRC="$(mktemp -d)"
    if git clone --quiet --depth 1 --branch "$GREPAI_VERSION" https://github.com/yoanbernabeu/grepai.git "$GREPAI_SRC" 2>&1 | tail -2 &&
       mkdir -p "$HOME_DIR/go/bin" &&
       (cd "$GREPAI_SRC" && go build -ldflags "-s -w -X main.version=${GREPAI_VERSION#v}" -o "$HOME_DIR/go/bin/grepai" ./cmd/grepai) 2>&1 | tail -2; then
      ln -sf "$HOME_DIR/go/bin/grepai" "$HOME_DIR/.local/bin/grepai" 2>/dev/null
      ok "  grepai ${GREPAI_VERSION} built from source"
      GREPAI_READY=1
    else
      warn "  grepai build failed (re-run install-mac.sh to retry)"
    fi
    rm -rf "$GREPAI_SRC"
  else
    warn "  go not installed (grepai skipped; install: brew install go)"
  fi
  if [ "$GREPAI_READY" = "1" ]; then
    # grepai's init wizard hard-codes Ollama at :11434, but AI-OS uses :11500
    # (see OLLAMA_URL above). Auto-init the AI-OS repo with the right URL so
    # `grepai watch` works without manual config. Re-init is a no-op if .grepai/
    # already exists with the right URL.
    if [ ! -f "$AI_OS_ROOT/.grepai/config.yaml" ]; then
      if [ -t 0 ]; then
        # interactive terminal: full wizard
        (cd "$AI_OS_ROOT" && "$HOME_DIR/.local/bin/grepai" init) || warn "  grepai init interactive failed; run manually: cd $AI_OS_ROOT && grepai init"
      else
        # non-interactive (CI, piped): pipe the answers
        (cd "$AI_OS_ROOT" && printf "1\n%s\ngob\n\n" "$OLLAMA_URL" | "$HOME_DIR/.local/bin/grepai" init >/dev/null 2>&1) || warn "  grepai init non-interactive failed; run manually: cd $AI_OS_ROOT && grepai init"
      fi
    fi
    # Always reconcile endpoint: if the user (or a previous install) used
    # 11434, swap to OLLAMA_URL. grepai ignores OLLAMA_URL env, so config
    # is the only way to fix this.
    if [ -f "$AI_OS_ROOT/.grepai/config.yaml" ]; then
      "$HOME_DIR/.local/bin/grepai" config get embedder.endpoint >/dev/null 2>&1 || true
      if grep -q "localhost:11434" "$AI_OS_ROOT/.grepai/config.yaml" 2>/dev/null; then
        sed -i.bak "s|http://localhost:11434|$OLLAMA_URL|g" "$AI_OS_ROOT/.grepai/config.yaml" 2>/dev/null &&             ok "  grepai config: rewrote Ollama endpoint 11434 -> $OLLAMA_URL" ||             warn "  grepai config: could not rewrite endpoint (run: sed -i '' 's|11434|11500|' $AI_OS_ROOT/.grepai/config.yaml)"
        rm -f "$AI_OS_ROOT/.grepai/config.yaml.bak"
      fi
    fi
  fi

  # 9b.4 — Scheduled reindex (codebase-memory-mcp + grepai), 6x/day via launchd
  if bash "$AI_OS_ROOT/memory/launchd/install-reindex.sh" 2>&1 | sed 's/^/    /'; then
    ok "  reindex agent ai.os.reindex installed"
  else
    warn "  reindex agent install failed (run: bash memory/launchd/install-reindex.sh)"
  fi

  # 9b.5 — Functional health check twice a day, macOS notification on failure
  if bash "$AI_OS_ROOT/memory/launchd/install-health.sh" 2>&1 | sed 's/^/    /'; then
    ok "  health agent ai.os.health installed (ai-os health)"
  else
    warn "  health agent install failed (run: bash memory/launchd/install-health.sh)"
  fi

  # 9b.6 — Daily backup of the graph, .env and Claude memory, restore-verified
  if bash "$AI_OS_ROOT/memory/launchd/install-backup.sh" 2>&1 | sed 's/^/    /'; then
    ok "  backup agent ai.os.backup installed (ai-os backup)"
  else
    warn "  backup agent install failed (run: bash memory/launchd/install-backup.sh)"
  fi
else
  log "9b. SKIP_MEMORY=1, skipping memory stack"
fi
echo ""

# ─── 9c. Ponytail — lazy senior dev ruleset (portable: mac/linux/win) ───
# DietrichGebert/ponytail v4.9.0 (MIT). Per-turn injection via host plugin where
# available; fallback is the always-on pointer block 7b renders into the bridge
# (CLAUDE.md/AGENTS.md symlinks), so a bare `AGENTS.md` host still obeys the
# ladder. Default level is `full` (safe).
# PONYTAIL_VERSION + PONYTAIL_DEFAULT_MODE are the pin + default; override
# per-machine via $PONYTAIL_DEFAULT_MODE or ~/.config/ponytail/config.json.
# Mirrors setup/install-windows.ps1 section 5f; bump both together.
if [ "${SKIP_PONYTAIL:-0}" != "1" ]; then
  # PONYTAIL_VERSION / PONYTAIL_DEFAULT_MODE / PONYTAIL_CFG: see "Ponytail pin" at the top.
  log "9c. Ponytail ${PONYTAIL_VERSION} (default: ${PONYTAIL_DEFAULT_MODE}) — DietrichGebert/ponytail..."

  # 9c.1 — per-machine config (~/.config/ponytail/config.json) — untracked, like ~/.ai-os/env.sh:5b
  PONYTAIL_CFG_DIR="$(dirname "$PONYTAIL_CFG")"
  mkdir -p "$PONYTAIL_CFG_DIR"
  if [ ! -f "$PONYTAIL_CFG" ]; then
    printf '{\n  "defaultMode": "%s"\n}\n' "$PONYTAIL_DEFAULT_MODE" > "$PONYTAIL_CFG"
    ok "  ponytail config: $PONYTAIL_CFG (defaultMode=${PONYTAIL_DEFAULT_MODE})"
  else
    # keep existing file but ensure defaultMode is present (merge, don't clobber)
    if ! grep -q '"defaultMode"' "$PONYTAIL_CFG" 2>/dev/null; then
      # minimal merge: inject before closing }
      tmp_cfg="$(mktemp -t ponytail-cfg-XXXXXX.json)"
      if command -v python3 >/dev/null 2>&1; then
        python3 -c "import json,sys; p=sys.argv[1]; j=json.load(open(p)); j.setdefault('defaultMode','${PONYTAIL_DEFAULT_MODE}'); open(p,'w').write(json.dumps(j,indent=2)+'\n')" "$PONYTAIL_CFG" 2>/dev/null && ok "  ponytail config: merged defaultMode=${PONYTAIL_DEFAULT_MODE} into existing $PONYTAIL_CFG" || warn "  ponytail config exists but has no defaultMode — edit $PONYTAIL_CFG manually"
      else
        warn "  ponytail config exists but has no defaultMode — edit $PONYTAIL_CFG manually"
      fi
      rm -f "$tmp_cfg" 2>/dev/null
    else
      ok "  ponytail config already present: $PONYTAIL_CFG"
    fi
  fi

  # PONYTAIL_DEFAULT_MODE reaches new shells through 5b's env.sh render; export
  # it for this run so the plugin installs below see it.
  export PONYTAIL_DEFAULT_MODE

  # 9c.2 — ponytail checkout for rule files (shallow, idempotent). Reused by AGENTS.md fallback
  # and by verify.sh. Vendored checkout lives next to vendor/gstack/ when present; otherwise
  # a thin cache in ~/.cache/ai-os/ is used so install-win can share the same SHA.
  PONYTAIL_VENDOR_DIR="$AI_OS_ROOT/vendor/ponytail"
  PONYTAIL_CACHE_DIR="$HOME_DIR/.cache/ai-os/ponytail"
  PONYTAIL_SRC=""
  if [ -d "$PONYTAIL_VENDOR_DIR/.git" ] && [ -f "$PONYTAIL_VENDOR_DIR/AGENTS.md" ]; then
    PONYTAIL_SRC="$PONYTAIL_VENDOR_DIR"
    ok "  ponytail source: vendored $PONYTAIL_SRC"
  else
    mkdir -p "$(dirname "$PONYTAIL_CACHE_DIR")"
    if [ -d "$PONYTAIL_CACHE_DIR/.git" ]; then
      # best-effort refresh to pinned tag (no network failure may abort install)
      (cd "$PONYTAIL_CACHE_DIR" && git fetch --tags --quiet 2>/dev/null && git checkout -q "v${PONYTAIL_VERSION}" 2>/dev/null) || true
    elif command -v git >/dev/null 2>&1; then
      if git clone --depth 1 --branch "v${PONYTAIL_VERSION}" https://github.com/DietrichGebert/ponytail.git "$PONYTAIL_CACHE_DIR" 2>&1 | tail -2; then
        ok "  ponytail cache cloned: $PONYTAIL_CACHE_DIR @ v${PONYTAIL_VERSION}"
      else
        warn "  ponytail clone failed (offline?) — fallback to AGENTS.md-less mode"
        rm -rf "$PONYTAIL_CACHE_DIR" 2>/dev/null
      fi
    else
      warn "  git not available — cannot fetch ponytail cache"
    fi
    if [ -d "$PONYTAIL_CACHE_DIR" ] && [ -f "$PONYTAIL_CACHE_DIR/AGENTS.md" ]; then
      PONYTAIL_SRC="$PONYTAIL_CACHE_DIR"
      ok "  ponytail source: cache $PONYTAIL_SRC"
    fi
  fi

  # 9c.3 — host plugins (best-effort, never abort install — fallback is the bridge block)
  # Every attempt is counted and the summary prints N/M, so a failed install is
  # visible instead of a `| tail` that ate the exit status. Output of a failed
  # command is shown (last lines) under the warning.
  PLUGIN_OK=0; PLUGIN_TOTAL=0; PLUGIN_FAILED=""
  # pony_try <label> <cmd...> — run one install step, count it, show output on failure
  pony_try() {
    local label="$1" out; shift
    PLUGIN_TOTAL=$((PLUGIN_TOTAL + 1))
    if out="$("$@" 2>&1)"; then
      PLUGIN_OK=$((PLUGIN_OK + 1))
      ok "  $label: ponytail installed"
    else
      PLUGIN_FAILED="$PLUGIN_FAILED $label"
      warn "  $label: ponytail install failed — bridge block still applies:"
      printf '%s\n' "$out" | tail -3 | sed 's/^/      /'
    fi
  }
  # pony_has <cmd...> — true when the listing mentions ponytail. No pipe into
  # grep -q: an early-closing grep SIGPIPEs the lister and pipefail reports it.
  pony_has() { local out; out="$("$@" 2>/dev/null || true)"; printf '%s\n' "$out" | grep -qi "ponytail"; }
  # Marketplaces/extensions come from the pinned checkout when we have one, so
  # the plugin matches the rules above instead of upstream main.
  PONYTAIL_MARKET="${PONYTAIL_SRC:-DietrichGebert/ponytail}"

  # Claude Code — `claude plugin install` (there is no `plugin add`), resolved
  # binary from 2a: the pnpm shim on PATH may be the broken one.
  if [ -n "${CLAUDE_BIN:-}" ]; then
    if pony_has "$CLAUDE_BIN" plugin list; then
      ok "  Claude Code: ponytail plugin already installed"
      PLUGIN_OK=$((PLUGIN_OK + 1)); PLUGIN_TOTAL=$((PLUGIN_TOTAL + 1))
    else
      pony_has "$CLAUDE_BIN" plugin marketplace list \
        || "$CLAUDE_BIN" plugin marketplace add "$PONYTAIL_MARKET" >/dev/null 2>&1 \
        || warn "  Claude Code: marketplace add $PONYTAIL_MARKET failed (install below will say why)"
      pony_try "Claude Code" "$CLAUDE_BIN" plugin install "ponytail@ponytail"
      log "    Claude Code: run /hooks and trust the ponytail lifecycle hooks, then start a new thread"
    fi
  else
    log "  Claude Code not detected (no working binary) — skipping claude plugin"
  fi

  # Codex (same marketplace)
  if command -v codex >/dev/null 2>&1; then
    # `codex plugin list` also lists marketplace entries; only "installed" counts
    codex_out="$(codex plugin list 2>/dev/null || true)"
    if printf '%s\n' "$codex_out" | grep -i "ponytail@" | grep -qi "installed"; then
      ok "  Codex: ponytail plugin already installed"
      PLUGIN_OK=$((PLUGIN_OK + 1)); PLUGIN_TOTAL=$((PLUGIN_TOTAL + 1))
    else
      codex plugin marketplace add DietrichGebert/ponytail >/dev/null 2>&1 || true
      pony_try "Codex" codex plugin add "ponytail@ponytail"
    fi
  else
    log "  Codex not detected — skipping codex plugin"
  fi

  # Hermes / Gemini: --yes-deps / --consent below answer a security prompt on the user's behalf,
  # so they are only passed when the user opted in: PONYTAIL_PLUGIN_CONSENT=1.
  # Interactive terminals get the prompt instead.
  if command -v hermes >/dev/null 2>&1; then
    if pony_has hermes plugins list; then
      ok "  Hermes: ponytail plugin already installed"
      PLUGIN_OK=$((PLUGIN_OK + 1)); PLUGIN_TOTAL=$((PLUGIN_TOTAL + 1))
    else
      # From the pinned checkout (file:// git URL), not owner/repo: upstream main
      # ships a plugin.json Hermes rejects, and `--ref <sha>` trips a Hermes
      # readability check on git's temp pack files. Hermes' install-time scan
      # may still block it ("community source + caution verdict"); overriding
      # that is the user's call (`--force`), never passed from here.
      if [ -n "$PONYTAIL_SRC" ]; then
        hermes_args=(plugins install "file://$PONYTAIL_SRC" --enable)
      else
        hermes_args=(plugins install DietrichGebert/ponytail --enable)
      fi
      [ "${PONYTAIL_PLUGIN_CONSENT:-0}" = "1" ] && hermes_args+=(--yes-deps)
      pony_try "Hermes" hermes "${hermes_args[@]}"
    fi
  else
    log "  Hermes not detected — skipping hermes plugin"
  fi

  # Gemini — non-interactive installs are refused without --consent (see above).
  if command -v gemini >/dev/null 2>&1; then
    if pony_has gemini extensions list; then
      ok "  Gemini: ponytail extension already installed"
      PLUGIN_OK=$((PLUGIN_OK + 1)); PLUGIN_TOTAL=$((PLUGIN_TOTAL + 1))
    elif [ ! -t 0 ] && [ "${PONYTAIL_PLUGIN_CONSENT:-0}" != "1" ]; then
      PLUGIN_TOTAL=$((PLUGIN_TOTAL + 1)); PLUGIN_FAILED="$PLUGIN_FAILED Gemini(consent)"
      warn "  Gemini: extension install needs consent — re-run in a terminal, or with PONYTAIL_PLUGIN_CONSENT=1"
    else
      gemini_args=(extensions install https://github.com/DietrichGebert/ponytail --ref "v${PONYTAIL_VERSION}")
      [ "${PONYTAIL_PLUGIN_CONSENT:-0}" = "1" ] && gemini_args+=(--consent)
      pony_try "Gemini" gemini "${gemini_args[@]}"
    fi
  fi
  if command -v agy >/dev/null 2>&1; then
    if pony_has agy plugin list; then
      ok "  Antigravity (agy): ponytail plugin already installed"
      PLUGIN_OK=$((PLUGIN_OK + 1)); PLUGIN_TOTAL=$((PLUGIN_TOTAL + 1))
    else
      pony_try "Antigravity (agy)" agy plugin install https://github.com/DietrichGebert/ponytail
    fi
  fi
  if [ "$PLUGIN_OK" -eq "$PLUGIN_TOTAL" ]; then
    ok "  ponytail host plugins: $PLUGIN_OK/$PLUGIN_TOTAL installed"
  else
    warn "  ponytail host plugins: $PLUGIN_OK/$PLUGIN_TOTAL installed — failed:$PLUGIN_FAILED (bridge block covers them)"
  fi

  # OpenCode — opencode.json plugin entry (idempotent)
  for oc_cfg in "$HOME_DIR/.config/opencode/opencode.json" "$HOME_DIR/.opencode.json" "$AI_OS_ROOT/opencode.json"; do
    if [ -f "$oc_cfg" ] && command -v python3 >/dev/null 2>&1; then
      if python3 -c "import json,sys; p=sys.argv[1]; j=json.load(open(p)); plugins=j.get('plugin',[]); sys.exit(0 if any('ponytail' in str(x) for x in plugins) else 1)" "$oc_cfg" 2>/dev/null; then
        ok "  OpenCode: ponytail plugin already in $oc_cfg"
      else
        tmp_oc="$(mktemp -t opencode-XXXXXX.json)"
        if python3 -c "
import json,sys
p=sys.argv[1]; t=sys.argv[2]
j=json.load(open(p))
plugins=j.get('plugin',[])
if not any('ponytail' in str(x) for x in plugins):
    plugins.append('@dietrichgebert/ponytail')
    j['plugin']=plugins
    open(t,'w').write(json.dumps(j,indent=2)+'\n')
else:
    import shutil; shutil.copy(p,t)
" "$oc_cfg" "$tmp_oc" 2>/dev/null && mv "$tmp_oc" "$oc_cfg"; then
          ok "  OpenCode: added @dietrichgebert/ponytail to $oc_cfg"
        else
          warn "  OpenCode: could not patch $oc_cfg — add {\"plugin\":[\"@dietrichgebert/ponytail\"]} manually"
          rm -f "$tmp_oc" 2>/dev/null
        fi
      fi
      break
    fi
  done

  # 9c.4 — AGENTS.md fallback (always applied so any AGENTS.md host obeys ponytail even
  # without a plugin). Appends a guarded block to each host's AGENTS.md; idempotent.
  if [ -n "$PONYTAIL_SRC" ] && [ -f "$PONYTAIL_SRC/AGENTS.md" ]; then
    PONYTAIL_AGENTS_MARKER="PONYTAIL (DietrichGebert/ponytail v${PONYTAIL_VERSION})"
    # global fallbacks that every host in ai-os reads
    for ag_path in "$HOME_DIR/.agents/AGENTS.md" "$HOME_DIR/.codex/AGENTS.md" "$HOME_DIR/.claude/CLAUDE.md"; do
      # Symlinks to the bridge carry the block from the 7b render; appending
      # through them would write into the bridge and be wiped on the next run.
      if [ "$ag_path" -ef "$BRIDGE" ]; then
        ok "  $ag_path → bridge (ponytail block rendered by 7b)"
        continue
      fi
      if grep -q "PONYTAIL" "$ag_path" 2>/dev/null; then
        ok "  AGENTS fallback already in $ag_path"
        continue
      fi
      mkdir -p "$(dirname "$ag_path")"
      # for CLAUDE.md we append a short bridge note, not the full AGENTS.md (different format)
      case "$ag_path" in
        *CLAUDE.md)
          if [ -f "$ag_path" ] && grep -q "AI-OS Bridge" "$ag_path" 2>/dev/null; then
            # bridge present — append ponytail note after it
            cat >> "$ag_path" <<PONYTAIL_CLAUDE

<!-- ${PONYTAIL_AGENTS_MARKER} — managed by setup/install-mac.sh; remove block to unlink -->
- Ponytail (lazy senior dev) is active at \`${PONYTAIL_DEFAULT_MODE}\` via DietrichGebert/ponytail v${PONYTAIL_VERSION}. Ladder: Does it need to exist? → reuse → stdlib → native platform → installed dep → one line → minimum that works. Never cut validation/security/a11y. Toggle: /ponytail lite|full|ultra|off.
<!-- /PONYTAIL -->
PONYTAIL_CLAUDE
            ok "  AGENTS fallback appended to $ag_path (bridge note)"
          else
            # CLAUDE.md is really the bridge symlink — don't corrupt it; rely on .agents/AGENTS.md instead
            log "  $ag_path is a bridge/adapter — skipping AGENTS append (covered by ~/.agents/AGENTS.md)"
          fi
          ;;
        *)
          # if file doesn't exist, create with header; otherwise append guarded block
          if [ ! -f "$ag_path" ]; then
            cat "$PONYTAIL_SRC/AGENTS.md" > "$ag_path"
            ok "  AGENTS fallback created: $ag_path"
          else
            printf '\n\n<!-- %s -->\n' "$PONYTAIL_AGENTS_MARKER" >> "$ag_path"
            cat "$PONYTAIL_SRC/AGENTS.md" >> "$ag_path"
            printf '\n<!-- /PONYTAIL -->\n' >> "$ag_path"
            ok "  AGENTS fallback appended to $ag_path"
          fi
          ;;
      esac
    done
    # also ensure project-local AGENTS.md template exists for pointer-based hosts (Cursor/Windsurf/Cline)
    # we don't overwrite a project's own AGENTS.md — just note its location
    log "  Cursor/Windsurf/Cline/Qoder: copy $PONYTAIL_SRC/AGENTS.md to <project>/.cursor/rules/ponytail.md or .windsurf/rules/ as needed (AGENTS.md already covers most hosts)"
  else
    warn "  ponytail source not available — AGENTS.md fallback skipped (plugin installs above remain)"
  fi

  ok "Ponytail ${PONYTAIL_VERSION} wiring complete (defaultMode=${PONYTAIL_DEFAULT_MODE}, src=${PONYTAIL_SRC:-none})"
else
  log "9c. SKIP_PONYTAIL=1, skipping ponytail"
fi
echo ""

# ─── 9d. llm/router.mjs local model + opencode service (model-less by default) ───
# Pulls gemma3:12b onto the same native Ollama daemon 9b already started — that's
# router.mjs's default for plain chat (classification/extraction, no tool use).
# gemma3, not qwen3: this daemon has a single request slot, and qwen3 is a
# "thinking" model whose reasoning trace can block every other caller
# (router.mjs, opencode, open-webui) until it finishes — observed for real
# 2026-09-19 (see llm/README.md, "Model selection, final state"). gemma3 has no
# thinking mechanism at all, so it can't hit that failure mode structurally.
# Also installs opencode-ai globally and persists it as a password-protected
# launchd service scoped to a disposable sandbox directory, but deliberately
# WITHOUT a model configured: the 2026-09-19 trial (llm/README.md, "Plan-enrichment
# trial") found every model 8B-32B unreliable for opencode's actual multi-step
# tool-use loop, so it isn't wired up by default anymore. See llm/README.md for
# the full security model and why the sandbox default matters for an unattended
# service, if you re-enable it deliberately.
if [ "${SKIP_OPENCODE:-0}" != "1" ]; then
  log "9d. Setting up llm/router.mjs (Gemma3-12B) + opencode service (model-less)..."

  if command -v ollama >/dev/null 2>&1; then
    if OLLAMA_HOST=127.0.0.1:11500 ollama list 2>/dev/null | grep -q "gemma3:12b"; then
      ok "  gemma3:12b already pulled"
    else
      log "  pulling gemma3:12b (~8.1GB, one-time)"
      OLLAMA_HOST=127.0.0.1:11500 ollama pull gemma3:12b \
        && ok "  gemma3:12b pulled" \
        || warn "  gemma3:12b pull failed — llm/router.mjs's local provider will have nothing to talk to"
    fi
    # Ollama's default num_ctx (4096) truncates real prompts; the Modelfile sets 32768,
    # which fits every request seen so far (see llm/gemma3-12b.Modelfile for the numbers).
    # Skipped when the model already
    # carries the Modelfile's num_ctx, so a re-run does not rewrite the manifest.
    want_ctx="$(sed -n 's/^PARAMETER num_ctx[[:space:]]*//p' "$AI_OS_ROOT/llm/gemma3-12b.Modelfile" | head -1)"
    have_ctx="$(OLLAMA_HOST=127.0.0.1:11500 ollama show gemma3:12b --parameters 2>/dev/null | awk '$1=="num_ctx"{print $2; exit}' || true)"
    if [ -n "$want_ctx" ] && [ "$have_ctx" = "$want_ctx" ]; then
      ok "  gemma3:12b context already $have_ctx"
    elif OLLAMA_HOST=127.0.0.1:11500 ollama create gemma3:12b -f "$AI_OS_ROOT/llm/gemma3-12b.Modelfile" >/dev/null 2>&1; then
      ok "  gemma3:12b context set to $want_ctx"
    else
      warn "  could not set gemma3:12b's context (non-fatal — default 4096 still works, just truncates more)"
    fi
  else
    warn "  ollama not installed — skipping gemma3:12b pull (see 9b)"
  fi

  if command -v npm >/dev/null 2>&1; then
    if command -v opencode >/dev/null 2>&1; then
      ok "  opencode-ai already installed ($(command -v opencode))"
    elif npm install -g opencode-ai@latest 2>&1 | tail -3; then
      ok "  opencode-ai installed globally"
    else
      warn "  npm install -g opencode-ai failed"
    fi
  else
    warn "  npm not installed — opencode-ai skipped"
  fi

  if command -v opencode >/dev/null 2>&1; then
    if bash "$SCRIPT_DIR/../llm/launchd/install-opencode.sh" 2>&1 | sed 's/^/    /'; then
      ok "  opencode service on 127.0.0.1:4096 (sandbox: ~/.ai-os/opencode-sandbox, logs: ~/.ai-os/opencode.log)"
    else
      warn "  opencode service did not come up — tool-use harness disabled"
    fi
  fi
else
  log "9d. SKIP_OPENCODE=1, skipping opencode local agent"
fi
echo ""

# ─── 9e. Strategic-compact hook (Claude Code PreToolUse) ───
# Third token layer next to ponytail (code) and caveman (prose): suggests
# /compact at phase boundaries instead of letting auto-compact fire mid-task.
# The suggester itself is vendored (vendor/ecc/scripts/hooks/suggest-compact.js);
# setup/wire-compact-hook.mjs symlinks it into ~/.claude/scripts/hooks/ and
# merges the PreToolUse entry into ~/.claude/settings.json. Needs node — the
# hook is a node script, so without it there is nothing to wire.
if [ "${SKIP_COMPACT_HOOK:-0}" != "1" ]; then
  log "9e. Strategic-compact hook (Claude Code PreToolUse)..."
  if ! command -v node >/dev/null 2>&1; then
    warn "  node not installed — skipping (the hook is a node script)"
  elif node "$SCRIPT_DIR/wire-compact-hook.mjs"; then
    ok "  strategic-compact hook wired (threshold: \$COMPACT_THRESHOLD, default 50)"
  else
    warn "  strategic-compact hook not wired — see the message above (never blocks the install)"
  fi
else
  log "9e. SKIP_COMPACT_HOOK=1, skipping strategic-compact hook"
fi

# 9f. Memory hooks: every Claude Code session starts with what graphiti remembers
# about its repo, and every prompt gets up to three grepai code locations
# (setup/hooks/claude-session-memory.py, claude-prompt-code-hints.py).
if [ "${SKIP_MEMORY_HOOK:-0}" != "1" ]; then
  if python3 "$SCRIPT_DIR/wire-memory-hook.py"; then
    ok "  memory hooks wired (Claude Code SessionStart + UserPromptSubmit)"
  else
    warn "  memory hooks not wired — see the message above (never blocks the install)"
  fi
fi
echo ""

# ─── 9g. Floorplan (optional: FLOORPLAN=1) ───
# haydenschmitty/floorplan: an interactive plain-English map of a codebase, drawn by Claude or Codex.
# Reviewed at FLOORPLAN_SHA (no hooks, MCP servers or dependencies; local-only server). The plugin is
# read from a clone checked out at that commit and registered as a folder marketplace, so a later
# upstream change never reaches the machine until the pin moves. Its only outbound request is an
# opt-in waitlist form: ~/.floorplan/settings.json is seeded with "never" so the card does not ask.
if [ "${FLOORPLAN:-0}" = "1" ]; then
  log "9g. Floorplan ${FLOORPLAN_SHA:0:12} — haydenschmitty/floorplan..."
  FLOORPLAN_DIR="$HOME_DIR/.cache/ai-os/floorplan"
  FLOORPLAN_OK=0
  mkdir -p "$(dirname "$FLOORPLAN_DIR")"
  if [ ! -d "$FLOORPLAN_DIR/.git" ]; then
    rm -rf "$FLOORPLAN_DIR" 2>/dev/null
    git clone --quiet "${FLOORPLAN_REPO:-https://github.com/haydenschmitty/floorplan.git}" "$FLOORPLAN_DIR" 2>&1 | tail -2 || true
  fi
  if [ -d "$FLOORPLAN_DIR/.git" ] \
     && (cd "$FLOORPLAN_DIR" && { git cat-file -e "$FLOORPLAN_SHA^{commit}" 2>/dev/null || git fetch --quiet --tags 2>/dev/null; } \
         && git checkout -q "$FLOORPLAN_SHA" 2>/dev/null) \
     && [ "$(git -C "$FLOORPLAN_DIR" rev-parse HEAD)" = "$FLOORPLAN_SHA" ]; then
    ok "  floorplan source: $FLOORPLAN_DIR @ ${FLOORPLAN_SHA:0:12}"
    FLOORPLAN_OK=1
  else
    warn "  floorplan: could not check out $FLOORPLAN_SHA — skipping (no network, or the pin moved)"
  fi
  if [ "$FLOORPLAN_OK" = "1" ]; then
    mkdir -p "$HOME_DIR/.floorplan"
    [ -f "$HOME_DIR/.floorplan/settings.json" ] || printf '{"cloud":{"status":"never"}}\n' > "$HOME_DIR/.floorplan/settings.json"
    # The pin holds only if the `floorplan` marketplace is OUR clone: one added earlier from GitHub would
    # install the default branch under the same name. Warn and leave it alone rather than replace it silently.
    if [ -n "$CLAUDE_BIN" ]; then
      fp_list="$("$CLAUDE_BIN" plugin marketplace list 2>/dev/null || true)"
      if printf '%s\n' "$fp_list" | grep -q "❯ floorplan" && ! printf '%s\n' "$fp_list" | grep -qF "$FLOORPLAN_DIR"; then
        warn "  Claude Code: a 'floorplan' marketplace from another source exists, so the pin is not enforced — run 'claude plugin marketplace remove floorplan' and re-run"
      else
        "$CLAUDE_BIN" plugin marketplace add "$FLOORPLAN_DIR" >/dev/null 2>&1 || true
        if "$CLAUDE_BIN" plugin list 2>/dev/null | grep -q "floorplan@floorplan"; then
          "$CLAUDE_BIN" plugin update floorplan@floorplan >/dev/null 2>&1 || true   # picks up a moved pin
          ok "  Claude Code: floorplan plugin installed (pinned clone)"
        elif out="$("$CLAUDE_BIN" plugin install floorplan@floorplan 2>&1)"; then
          ok "  Claude Code: floorplan installed (ask: \"Make me a floorplan of this app\")"
        else
          warn "  Claude Code: floorplan install failed:"; printf '%s\n' "$out" | tail -3 | sed 's/^/      /'
        fi
      fi
    else
      log "  Claude Code not found — skipping its plugin"
    fi
    if command -v codex >/dev/null 2>&1; then
      # Codex copies the marketplace into its own folder: compare the release fingerprint with the pinned clone's
      codex plugin marketplace add "$FLOORPLAN_DIR" >/dev/null 2>&1 || true
      fp_root="$(codex plugin marketplace list 2>/dev/null | awk '$1 == "floorplan" { print $2 }')"
      if [ -n "$fp_root" ] && ! cmp -s "$fp_root/CHECKSUMS.txt" "$FLOORPLAN_DIR/CHECKSUMS.txt"; then
        warn "  Codex: its 'floorplan' marketplace is not the pinned clone, so the pin is not enforced — run 'codex plugin marketplace remove floorplan' and re-run"
      elif codex plugin list 2>/dev/null | grep -i "floorplan@" | grep -qi "installed"; then
        ok "  Codex: floorplan plugin installed (pinned clone)"
      elif out="$(codex plugin add floorplan@floorplan 2>&1)"; then
        ok "  Codex: floorplan installed (type \$floorplan)"
      else
        warn "  Codex: floorplan install failed:"; printf '%s\n' "$out" | tail -3 | sed 's/^/      /'
      fi
    fi
  fi
else
  log "9g. Floorplan not installed (opt in with FLOORPLAN=1)"
fi

# ─── 10. Warp defaults (Mac only) ───
if [ "${AIOS_TERMINAL_THEME:-0}" = "1" ] && [ -d "/Applications/Warp.app" ]; then
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
  log "10. Warp: not requested (AIOS_TERMINAL_THEME=1) or not installed, skipping"
fi
echo ""

# ─── 11. Terminal.app defaults (Mac only) ───
if [ "${AIOS_TERMINAL_THEME:-0}" = "1" ] && [ -d "/Applications/Utilities/Terminal.app" ]; then
  log "11. Configuring Terminal.app defaults..."
  plutil -replace "Default Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  plutil -replace "Startup Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  defaults write com.apple.Terminal Shell -string "/bin/zsh"
  ok "Terminal.app theme = Pro, shell = /bin/zsh"
fi
echo ""

# ─── 12. Reload shell ───
# No `exec zsh` here: it replaced this process, so step 13 and the failure
# report below never ran in an interactive terminal.
log "12. Reload zsh manually: exec zsh (or open a new terminal)"
echo ""

# ─── 13. Final verification ───
if [ "${SKIP_VERIFY:-0}" != "1" ]; then
  log "13. Final verification..."
  bash "$SCRIPT_DIR/verify.sh"
fi

echo ""
if [ "${BREW_FAILED:-0}" = "1" ]; then
  err "Setup finished, but brew bundle failed for some packages (scroll up for 'brew bundle')."
  err "Fix them, then re-run: SKIP_NPM=1 SKIP_PIP=1 bash setup/install-mac.sh"
  exit 1
fi
log "═══════════════════════════════════════════════════════════"
ok "AI-OS setup complete!"
log ""
log "Next steps:"
log "  1. exec zsh (or open a new terminal)"
log "  2. Try: hermes chat --skills aios-quickstart"
log "  3. Customize ~/.gitconfig with your email: git config --global user.name/email"
log "═══════════════════════════════════════════════════════════"
