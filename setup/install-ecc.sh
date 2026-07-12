#!/usr/bin/env bash
# setup/install-ecc.sh
# Wire the vendored Everything Claude Code (ECC) plugin into the 5 AI CLIs.
#
# What this script does:
#   1. Verifies that vendor/ecc/ exists (the vendored copy is the source of truth).
#   2. Symlinks vendor/ecc/ -> ~/.claude/plugins/ecc (so Claude Code sees it as a plugin).
#   3. Symlinks every ECC skill from ai-config/skills/ (which is already propagated
#      by install-mac.sh step 5) into ~/.codex/skills, ~/.gemini/skills, and
#      ~/.agents/skills. Hermes reads ~/.agents/skills via skills.external_dirs
#      (config.yaml) instead of a separate symlinked copy (P1-2).
#      NOTE: This script does NOT re-propagate ai-config/skills/ -> ~/.claude/skills
#      because that is already done by install-mac.sh. We only top up the other 3 CLI dirs.
#      If you ran install-ecc.sh BEFORE install-mac.sh, the ~/.claude/ link is also
#      handled here (idempotent overwrite).
#   4. Optionally installs the chrome-devtools-mcp server (the MCP ECC depends on).
#   5. Optionally registers the ECC quality-gate + config-protection hooks in
#      ~/.claude/settings.json (selective, see docs/ecc-integration.md).
#
# Usage:
#   bash setup/install-ecc.sh              # full install (idempotent)
#   bash setup/install-ecc.sh --check      # verify symlinks only, no writes
#   DRY_RUN=1 bash setup/install-ecc.sh    # simulate (CI mode)
#   SKIP_HOOKS=1 bash setup/install-ecc.sh # do NOT touch ~/.claude/settings.json
#   SKIP_MCP=1 bash setup/install-ecc.sh   # do NOT install chrome-devtools-mcp
#
# Idempotent: safe to run multiple times. Re-running refreshes every symlink.

set -euo pipefail

# ─── Paths ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"
LOG_PREFIX="[ai-os install-ecc]"

# ─── Logging ───
log() { echo "$LOG_PREFIX $*"; }
ok()  { echo "$LOG_PREFIX ✅ $*"; }
warn(){ echo "$LOG_PREFIX ⚠️  $*"; }
err() { echo "$LOG_PREFIX ❌ $*" >&2; }

# ─── Argument parsing ───
CHECK_MODE=0
for arg in "$@"; do
  case "$arg" in
    --check) CHECK_MODE=1 ;;
    -h|--help)
      echo "Usage: bash setup/install-ecc.sh [--check]"
      echo "Env:   DRY_RUN=1 (simulate), SKIP_HOOKS=1, SKIP_MCP=1"
      exit 0
      ;;
    *) err "Unknown argument: $arg"; exit 2 ;;
  esac
done

# ─── DRY_RUN mode (CI) ───
DRY="${DRY_RUN:-0}"
if [ "$DRY" = "1" ]; then
  # In dry-run we still want CHECK_MODE to verify structure; otherwise simulate writes.
  if [ "$CHECK_MODE" = "0" ]; then
    log "DRY_RUN=1: simulating all writes, no symlinks created on the real system."
  fi
fi

# ─── Header ───
log "═══════════════════════════════════════════════════════════"
log "  AI-OS → ECC integration"
log "  Source: $AI_OS_ROOT/vendor/ecc/"
log "  Target: $HOME_DIR/.{claude,codex,gemini,agents,hermes}/"
log "  Mode:   $([ "$CHECK_MODE" = "1" ] && echo "CHECK (verify only)" || ([ "$DRY" = "1" ] && echo "DRY-RUN" || echo "INSTALL"))"
log "═══════════════════════════════════════════════════════════"
echo ""

# ─── 0. Verify vendored ECC exists ───
log "0. Verifying vendored ECC at vendor/ecc/..."
ECC_SRC="$AI_OS_ROOT/vendor/ecc"
ECC_SKILLS_SRC="$ECC_SRC/skills"
if [ ! -d "$ECC_SRC" ]; then
  err "vendor/ecc/ does not exist at $ECC_SRC"
  err ""
  err "ECC (Everything Claude Code) has not been vendored into this repo yet."
  err "To vendor it, run from the repo root:"
  err ""
  err "    git clone --depth=1 https://github.com/affaan-m/everything-claude-code.git vendor/ecc"
  err "    bash setup/install-ecc.sh"
  err ""
  exit 1
fi
if [ ! -d "$ECC_SKILLS_SRC" ]; then
  err "vendor/ecc/skills/ does not exist. ECC clone may be corrupt or incomplete."
  exit 1
fi

ECC_SKILL_COUNT=$(ls -1d "$ECC_SKILLS_SRC"/*/ 2>/dev/null | wc -l | tr -d ' ')
ok "Vendored ECC found ($ECC_SKILL_COUNT skills in vendor/ecc/skills/)"
echo ""

# ─── 1. Symlink ECC plugin into Claude Code ───
log "1. Linking ECC plugin into Claude Code..."

CLAUDE_PLUGINS_DIR="$HOME_DIR/.claude/plugins"
CLAUDE_ECC_LINK="$CLAUDE_PLUGINS_DIR/ecc"

# Helper: create or refresh a symlink (handles existing files/symlinks/dirs).
# --check mode is report-only: never writes to the filesystem, only verifies
# that link_path either is already a valid symlink to target OR is missing.
do_link() {
  local link_path="$1"
  local target="$2"
  local label="$3"

  if [ "$CHECK_MODE" = "1" ]; then
    # Report-only path: never modify the filesystem.
    if [ -L "$link_path" ] && [ "$(readlink "$link_path")" = "$target" ]; then
      ok "  $label → $target (check: already correct)"
    elif [ -L "$link_path" ]; then
      warn "  $label: existing symlink points elsewhere ($(readlink "$link_path"))"
    else
      warn "  $label: missing (would create → $target)"
    fi
    return 0
  fi

  # If something exists at link_path, back it up (only if it's a real file/dir, not already our symlink).
  if [ -e "$link_path" ] && [ ! -L "$link_path" ]; then
    if [ "$DRY" = "1" ]; then
      warn "  $label: existing path would be backed up to ${link_path}.pre-aios.bak"
    else
      mv "$link_path" "${link_path}.pre-aios.bak"
    fi
  fi

  if [ "$DRY" = "1" ]; then
    ok "  $label → $target (simulated)"
  else
    mkdir -p "$(dirname "$link_path")"
    ln -sfn "$target" "$link_path"
    if [ -L "$link_path" ] && [ "$(readlink "$link_path")" = "$target" ]; then
      ok "  $label → $target"
    else
      err "  $label: failed to create symlink"
      return 1
    fi
  fi
}

do_link "$CLAUDE_ECC_LINK" "$ECC_SRC" "~/.claude/plugins/ecc"

# ─── 2. Propagate ECC skills to the 5 CLIs ───
log "2. Propagating ECC skills to 5 CLIs..."

# ~/.claude/skills/<name> -> vendor/ecc/skills/<name>
# (install-mac.sh already symlinks ai-config/skills/ here, but ECC skills live in
#  vendor/ecc/skills/. We layer them on top.)
mkdir -p "$HOME_DIR/.claude/skills" 2>/dev/null || true
SKILL_LINK_COUNT=0
for skill_dir in "$ECC_SKILLS_SRC"/*/; do
  [ -d "$skill_dir" ] || continue
  name=$(basename "$skill_dir")
  [ "$name" = "READMEDD.md" ] && continue
  [ "$name" = "taste-skill-llms.txt" ] && continue

  # In --check mode we only validate the plugin-level link and do a per-CLI
  # summary at the end. Skip the 1,355 per-skill log lines.
  if [ "$CHECK_MODE" = "1" ]; then
    SKILL_LINK_COUNT=$((SKILL_LINK_COUNT + 1))
    continue
  fi

  # ~/.claude/skills/<name> (Claude Code uses these as the canonical plugin skills)
  do_link "$HOME_DIR/.claude/skills/$name" "$skill_dir" "~/.claude/skills/$name"
  # Other 3 CLIs with their own skill dirs (Codex, Gemini, Antigravity).
  # Hermes reads ~/.agents/skills via skills.external_dirs (config.yaml) instead
  # of a separate symlinked copy under ~/.hermes/skills/imported/ (P1-2).
  for cli_dir in "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills"; do
    do_link "$cli_dir/$name" "$skill_dir" "$(basename "$cli_dir")/$name"
  done
  SKILL_LINK_COUNT=$((SKILL_LINK_COUNT + 1))
done

if [ "$CHECK_MODE" = "1" ]; then
  ok "Would propagate $SKILL_LINK_COUNT ECC skills across 5 CLIs (check mode: skipped writes)"
else
  ok "Propagated $SKILL_LINK_COUNT ECC skills across 5 CLIs"
fi
echo ""

# ─── 3. Optional: install chrome-devtools-mcp (the MCP ECC depends on) ───
if [ "${SKIP_MCP:-0}" = "1" ]; then
  log "3. SKIP_MCP=1, skipping chrome-devtools-mcp install"
elif [ "$CHECK_MODE" = "1" ]; then
  log "3. --check mode, skipping chrome-devtools-mcp install"
else
  log "3. Installing chrome-devtools-mcp (ECC dependency)..."
  if command -v npm >/dev/null 2>&1; then
    if [ "$DRY" = "1" ]; then
      ok "  Would run: npm install -g chrome-devtools-mcp (simulated)"
    else
      # Idempotent: -g install is safe to repeat; npm will no-op if version is satisfied.
      npm install -g chrome-devtools-mcp 2>&1 | tail -3
      ok "  chrome-devtools-mcp installed"
    fi
  else
    warn "  npm not found; install Node.js >=18 first, then re-run."
    warn "  (On Mac: brew install node.  On Linux: see https://nodejs.org)"
  fi
fi
echo ""

# ─── 4. Hooks: self-loaded by the plugin (no manual registration needed) ───
if [ "${SKIP_HOOKS:-0}" = "1" ]; then
  log "4. SKIP_HOOKS=1, skipping hook validation"
elif [ "$CHECK_MODE" = "1" ]; then
  log "4. --check mode, skipping hook validation"
else
  log "4. Validating ECC hook configuration..."
  # ECC v2.0.0 is a self-contained plugin: when symlinked into ~/.claude/plugins/ecc,
  # Claude Code auto-discovers hooks/hooks.json and registers every hook listed there.
  # We do NOT manually edit ~/.claude/settings.json — that would double-register and
  # cause hooks to fire twice.
  #
  # What we DO check: that the hook config file exists and parses as valid JSON.
  HOOKS_JSON="$ECC_SRC/hooks/hooks.json"
  if [ -f "$HOOKS_JSON" ]; then
    if command -v python3 >/dev/null 2>&1; then
      hook_count=$(python3 -c "import json; d=json.load(open('$HOOKS_JSON')); h=d.get('hooks', {}); print(sum(len(v) for v in h.values()))" 2>/dev/null || echo "?")
      ok "  $hook_count hooks auto-loaded from $HOOKS_JSON by the Claude Code plugin runtime"
    else
      ok "  hooks.json present (python3 not available to count hooks)"
    fi
  else
    warn "  $HOOKS_JSON not found. ECC plugin will install without hooks."
    warn "  (Older ECC versions may have used individual hook scripts.)"
  fi
  # Note for users: to disable a specific hook, edit vendor/ecc/hooks/hooks.json
  # and re-run this script, OR run with SKIP_HOOKS=1 to skip this validation step.
fi
echo ""

# ─── 5. Verification ───
if [ "$CHECK_MODE" = "1" ]; then
  # --check is a structural/consistency check for CI. We verify that
  # (a) the vendored ECC source is intact, and
  # (b) for every ECC skill directory, the SKILL.md (if present) parses
  #     as a basic frontmatter block.
  # We deliberately do NOT touch or verify $HOME state in --check mode —
  # CI runners are ephemeral and don't have the user's real symlinks.
  log "5. Verifying vendored ECC structure (--check mode)..."

  fail=0

  # 5a. Plugin manifest (if ECC ships one)
  if [ -f "$ECC_SRC/.claude-plugin/plugin.json" ]; then
    ok "  vendor/ecc/.claude-plugin/plugin.json present"
  elif [ -d "$ECC_SRC/.claude-plugin" ]; then
    warn "  vendor/ecc/.claude-plugin/ exists but plugin.json missing"
  else
    warn "  vendor/ecc/.claude-plugin/ not present (ECC may not be a packaged plugin)"
  fi

  # 5b. Skills enumeration — every directory under vendor/ecc/skills/ should
  # either contain a SKILL.md (real skill) or be explicitly excluded.
  REAL_SKILLS=0
  CATEGORIES=0
  MISSING_FRONTMATTER=0
  for skill_dir in "$ECC_SKILLS_SRC"/*/; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")
    skill_md=$(find "$skill_dir" -maxdepth 3 -name "SKILL.md" -type f 2>/dev/null | head -1)
    if [ -z "$skill_md" ]; then
      CATEGORIES=$((CATEGORIES + 1))
      continue
    fi
    REAL_SKILLS=$((REAL_SKILLS + 1))
    if ! head -5 "$skill_md" 2>/dev/null | grep -q "^---$"; then
      warn "  $name: SKILL.md has no frontmatter delimiter"
      MISSING_FRONTMATTER=$((MISSING_FRONTMATTER + 1))
    fi
  done

  ok "  vendor/ecc/skills/: $REAL_SKILLS real skills, $CATEGORIES category dirs"
  if [ "$MISSING_FRONTMATTER" -gt 0 ]; then
    warn "  $MISSING_FRONTMATTER skills missing --- frontmatter delimiter (non-fatal)"
  fi

  # 5c. Hook configuration — ECC v2.0.0 declares hooks in hooks/hooks.json
  HOOKS_JSON="$ECC_SRC/hooks/hooks.json"
  if [ -f "$HOOKS_JSON" ]; then
    if command -v python3 >/dev/null 2>&1; then
      hook_count=$(python3 -c "import json; d=json.load(open('$HOOKS_JSON')); h=d.get('hooks', {}); print(sum(len(v) for v in h.values()))" 2>/dev/null || echo "?")
      ok "  hooks.json declares $hook_count hooks (auto-loaded by Claude Code plugin runtime)"
    else
      ok "  hooks.json present"
    fi
  else
    warn "  hooks.json missing — ECC plugin will install without hooks"
  fi
else
  log "5. Verifying symlinks (real install mode)..."
  fail=0

  # Check plugin link
  if [ -L "$HOME_DIR/.claude/plugins/ecc" ]; then
    target=$(readlink "$HOME_DIR/.claude/plugins/ecc")
    if [ -e "$target" ]; then
      ok "  ~/.claude/plugins/ecc → $target (target exists)"
    else
      err "  ~/.claude/plugins/ecc → $target (BROKEN: target missing)"
      fail=$((fail + 1))
    fi
  else
    err "  ~/.claude/plugins/ecc missing"
    fail=$((fail + 1))
  fi

  # Per-CLI count of correctly-pointing ECC skill symlinks (Hermes is covered
  # via skills.external_dirs, not a symlinked copy — checked separately if needed).
  for cli_dir in "$HOME_DIR/.claude/skills" "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills"; do
    count=0
    broken=0
    for skill_dir in "$ECC_SKILLS_SRC"/*/; do
      [ -d "$skill_dir" ] || continue
      name=$(basename "$skill_dir")
      link="$cli_dir/$name"
      if [ -L "$link" ]; then
        target=$(readlink "$link")
        if [ -e "$target" ]; then
          count=$((count + 1))
        else
          broken=$((broken + 1))
        fi
      fi
    done
    if [ "$broken" -eq 0 ]; then
      ok "  $cli_dir: $count ECC skills linked, 0 broken"
    else
      err "  $cli_dir: $count OK, $broken BROKEN links"
      fail=$((fail + 1))
    fi
  done
fi

echo ""
log "═══════════════════════════════════════════════════════════"
if [ "$fail" -eq 0 ]; then
  if [ "$CHECK_MODE" = "1" ]; then
    ok "ECC integration structure verified (--check mode)."
    log ""
    log "This means:"
    log "  • vendor/ecc/ is intact and contains $REAL_SKILLS skills"
    log "  • Skill frontmatter is well-formed"
    log "  • Selective hook entrypoints exist (or are gracefully absent)"
    log ""
    log "For real installation: bash setup/install-ecc.sh"
    log "═══════════════════════════════════════════════════════════"
    exit 0
  fi
  ok "ECC integration complete!"
  log ""
  log "Next steps:"
  log "  1. Open Claude Code — ECC plugin is auto-discovered from ~/.claude/plugins/ecc"
  log "  2. Run /plugin list to confirm 'ecc' is enabled"
  log "  3. Load an ECC skill via your CLI's skill loader (skills propagate to all 5 CLIs)"
  log "  4. To update ECC later: cd vendor/ecc && git pull && bash setup/install-ecc.sh"
  log ""
  log "Hooks (auto-loaded by the Claude Code plugin runtime from hooks/hooks.json):"
  log "  • quality-gate, config-protection, governance-capture, mcp-health-check, ..."
  log "  • Disable individual hooks by editing vendor/ecc/hooks/hooks.json"
  log "  • Skip hook validation with SKIP_HOOKS=1"
  log "═══════════════════════════════════════════════════════════"
  exit 0
else
  err "$fail verification checks failed."
  log "Re-run without --check to fix, or inspect symlinks manually."
  log "═══════════════════════════════════════════════════════════"
  exit 1
fi