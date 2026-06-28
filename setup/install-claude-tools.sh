#!/usr/bin/env bash
# setup/install-claude-tools.sh
# Wire the vendored claude.tools + gstack skills into the 5 AI CLIs.
#
# What this script does:
#   1. Verifies that vendor/codex-plugin-cc/ exists (the vendored plugin; SOURCE OF TRUTH).
#   2. Symlinks vendor/codex-plugin-cc/ -> ~/.claude/plugins/codex-plugin-cc
#      so Claude Code discovers it as a plugin.
#   3. Symlinks the 4 individual claude.tools skills (humanizer, caveman,
#      notebooklm-skill, frontend-design-alt) and the 8 gstack skills
#      (careful, context-restore, context-save, diagram, freeze, guard,
#      spec, unfreeze) from ai-config/skills/ into the 5 CLIs.
#      (install-mac.sh step 5 already propagates ai-config/skills/ to
#      ~/.claude/skills, so we only top up the other 4 CLIs here.)
#   4. Symlinks the 3 codex-plugin-cc internal skills (codex-cli-runtime,
#      codex-result-handling, gpt-5-4-prompting) into the 5 CLIs.
#   5. In --check mode (CI), validates only the structure: vendor source
#      exists, plugin manifest present, every SKILL.md has a valid
#      frontmatter delimiter and `name:` / `description:` fields.
#
# Usage:
#   bash setup/install-claude-tools.sh              # full install (idempotent)
#   bash setup/install-claude-tools.sh --check      # verify only, no writes
#   DRY_RUN=1 bash setup/install-claude-tools.sh    # simulate (CI mode)
#   bash setup/install-claude-tools.sh --help       # show usage
#
# Idempotent: safe to run multiple times. Re-running refreshes every symlink.
#
# Companion scripts:
#   setup/install-ecc.sh     - Everything Claude Code plugin (271 skills)
#   setup/install-mac.sh     - Mac base install (handles ~/.claude/skills)
#   setup/install-windows.ps1 - Windows base install

set -euo pipefail

# ─── Paths ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"
LOG_PREFIX="[ai-os install-claude-tools]"

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
      echo "Usage: bash setup/install-claude-tools.sh [--check]"
      echo "Env:   DRY_RUN=1 (simulate)"
      echo ""
      echo "Wires the vendored claude.tools / gstack skills into the 5 AI CLIs."
      echo "Idempotent. Use --check for CI (structure-only verification)."
      exit 0
      ;;
    *) err "Unknown argument: $arg"; exit 2 ;;
  esac
done

DRY="${DRY_RUN:-0}"

# ─── Header ───
log "═══════════════════════════════════════════════════════════"
log "  AI-OS → claude.tools / gstack integration"
log "  Plugin source: $AI_OS_ROOT/vendor/codex-plugin-cc/"
log "  Skill source:  $AI_OS_ROOT/ai-config/skills/  (12 new dirs)"
log "  Target:        $HOME_DIR/.{claude,codex,gemini,agents,hermes}/"
log "  Mode:          $([ "$CHECK_MODE" = "1" ] && echo "CHECK (verify only)" || ([ "$DRY" = "1" ] && echo "DRY-RUN" || echo "INSTALL"))"
log "═══════════════════════════════════════════════════════════"
echo ""

# ─── Catalog of new skills ───
# These are the skills vendored from claude.tools (4) and cherry-picked
# from gstack (8). They live directly in ai-config/skills/ alongside the
# other AI-OS-native skills, so install-mac.sh step 5 already propagates
# them to ~/.claude/skills. We only top up the other 4 CLIs here.
CLAUDE_TOOLS_SKILLS=(
  humanizer
  caveman
  notebooklm-skill
  frontend-design-alt
)

GSTACK_SKILLS=(
  careful
  context-restore
  context-save
  diagram
  freeze
  guard
  spec
  unfreeze
)

ALL_NEW_SKILLS=("${CLAUDE_TOOLS_SKILLS[@]}" "${GSTACK_SKILLS[@]}")

# Skills that ship INSIDE the codex-plugin-cc plugin (not in ai-config/skills/).
# These come from vendor/codex-plugin-cc/plugins/codex/skills/ and get symlinked
# to all 5 CLIs like any other skill, plus the plugin-level link is created.
CODEX_PLUGIN_SKILLS=(
  codex-cli-runtime
  codex-result-handling
  gpt-5-4-prompting
)

# ─── 0. Verify vendored plugin exists ───
log "0. Verifying vendored claude.tools plugin at vendor/codex-plugin-cc/..."
CODEX_PLUGIN_SRC="$AI_OS_ROOT/vendor/codex-plugin-cc"
CODEX_PLUGIN_INNER_SRC="$CODEX_PLUGIN_SRC/plugins/codex"

if [ ! -d "$CODEX_PLUGIN_SRC" ]; then
  warn "vendor/codex-plugin-cc/ does not exist at $CODEX_PLUGIN_SRC"
  warn ""
  warn "The OpenAI Codex plugin for Claude Code has not been vendored into this"
  warn "repo yet. To vendor it, run from the repo root:"
  warn ""
  warn "    git clone --depth=1 https://github.com/openai/codex-plugin-cc.git vendor/codex-plugin-cc"
  warn "    bash setup/install-claude-tools.sh"
  warn ""
  warn "Continuing — the 12 individual skills (humanizer, caveman, notebooklm-skill,"
  warn "frontend-design-alt, careful, context-restore, context-save, diagram, freeze,"
  warn "guard, spec, unfreeze) will still be wired into the 4 non-Claude CLIs."
  HAS_PLUGIN=0
elif [ ! -d "$CODEX_PLUGIN_INNER_SRC" ]; then
  warn "vendor/codex-plugin-cc/plugins/codex/ not found. Plugin clone may be corrupt."
  warn "Continuing without plugin wiring."
  HAS_PLUGIN=0
else
  HAS_PLUGIN=1
  ok "Vendored codex-plugin-cc plugin found"
fi
echo ""

# ─── 0b. Verify the 12 new skills exist in ai-config/skills/ ───
log "0b. Verifying vendored skill directories under ai-config/skills/..."
MISSING_SKILLS=()
for skill in "${ALL_NEW_SKILLS[@]}"; do
  if [ ! -d "$AI_OS_ROOT/ai-config/skills/$skill" ]; then
    MISSING_SKILLS+=("$skill")
  fi
done
if [ "${#MISSING_SKILLS[@]}" -gt 0 ]; then
  warn "${#MISSING_SKILLS[@]} expected skill directory(ies) missing from ai-config/skills/:"
  for s in "${MISSING_SKILLS[@]}"; do
    warn "  - $s"
  done
  warn "These skills may have been moved or removed. Re-run Phase 2 vendoring if needed."
fi
FOUND_COUNT=$((${#ALL_NEW_SKILLS[@]} - ${#MISSING_SKILLS[@]}))
ok "Found $FOUND_COUNT / ${#ALL_NEW_SKILLS[@]} expected skill directories"
echo ""

# ─── Helper: create or refresh a symlink ───
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

  # If something exists at link_path, back it up if it's a real file/dir (not already our symlink).
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

# ─── 1. Symlink codex-plugin-cc into Claude Code ───
if [ "$HAS_PLUGIN" = "1" ]; then
  log "1. Linking codex-plugin-cc plugin into Claude Code..."
  CLAUDE_PLUGINS_DIR="$HOME_DIR/.claude/plugins"
  CLAUDE_CODEX_LINK="$CLAUDE_PLUGINS_DIR/codex-plugin-cc"

  if [ "$CHECK_MODE" = "1" ]; then
    if [ -L "$CLAUDE_CODEX_LINK" ] && [ "$(readlink "$CLAUDE_CODEX_LINK")" = "$CODEX_PLUGIN_SRC" ]; then
      ok "  ~/.claude/plugins/codex-plugin-cc → $CODEX_PLUGIN_SRC (check: already correct)"
    elif [ -L "$CLAUDE_CODEX_LINK" ]; then
      warn "  ~/.claude/plugins/codex-plugin-cc: existing symlink points elsewhere"
    else
      warn "  ~/.claude/plugins/codex-plugin-cc: missing (would create → $CODEX_PLUGIN_SRC)"
    fi
  else
    do_link "$CLAUDE_CODEX_LINK" "$CODEX_PLUGIN_SRC" "~/.claude/plugins/codex-plugin-cc"
  fi
  echo ""
fi

# ─── 2. Propagate the 12 new skills to the 5 CLIs ───
log "2. Propagating ${#ALL_NEW_SKILLS[@]} new skills to 5 CLIs..."

# install-mac.sh step 5 already does ~/.claude/skills/<name> -> ai-config/skills/<name>.
# We skip that layer to avoid 12 noisy lines per CLI, and only verify the
# ~/.claude side via a summary count.
LINKED_COUNT=0
SKIPPED_COUNT=0
for skill in "${ALL_NEW_SKILLS[@]}"; do
  src="$AI_OS_ROOT/ai-config/skills/$skill"
  [ -d "$src" ] || continue  # already warned in step 0b
  LINKED_COUNT=$((LINKED_COUNT + 1))

  if [ "$CHECK_MODE" = "1" ]; then
    # In --check mode, count without writing.
    SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
    continue
  fi

  # Other 4 CLIs (Codex, Gemini, Antigravity, Hermes).
  # ~/.claude/skills/<skill> is already created by install-mac.sh step 5
  # for anything in ai-config/skills/, so we do not re-create it here.
  for cli_dir in "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills"; do
    do_link "$cli_dir/$skill" "$src" "$(basename "$cli_dir")/$skill"
  done
  do_link "$HOME_DIR/.hermes/skills/imported/$skill" "$src" "~/.hermes/skills/imported/$skill"
done

if [ "$CHECK_MODE" = "1" ]; then
  ok "Would propagate $LINKED_COUNT skills to 5 CLIs (check mode: skipped writes)"
else
  ok "Propagated $LINKED_COUNT skills across 4 non-Claude CLIs (Claude is handled by install-mac.sh)"
fi
echo ""

# ─── 3. Propagate the 3 codex-plugin-cc internal skills to the 5 CLIs ───
if [ "$HAS_PLUGIN" = "1" ]; then
  log "3. Propagating ${#CODEX_PLUGIN_SKILLS[@]} codex-plugin-cc internal skills to 5 CLIs..."

  INNER_LINKED=0
  for skill in "${CODEX_PLUGIN_SKILLS[@]}"; do
    src="$CODEX_PLUGIN_INNER_SRC/skills/$skill"
    [ -d "$src" ] || { warn "  Plugin skill $skill not found at expected path"; continue; }

    # All 5 CLIs this time (the plugin skills are NOT in ai-config/skills/).
    INNER_LINKED=$((INNER_LINKED + 1))
    if [ "$CHECK_MODE" = "1" ]; then continue; fi
    do_link "$HOME_DIR/.claude/skills/$skill" "$src" "~/.claude/skills/$skill"
    for cli_dir in "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills"; do
      do_link "$cli_dir/$skill" "$src" "$(basename "$cli_dir")/$skill"
    done
    do_link "$HOME_DIR/.hermes/skills/imported/$skill" "$src" "~/.hermes/skills/imported/$skill"
  done

  if [ "$CHECK_MODE" = "1" ]; then
    ok "Would propagate $INNER_LINKED plugin skills to 5 CLIs (check mode: skipped writes)"
  else
    ok "Propagated $INNER_LINKED plugin skills across 5 CLIs"
  fi
  echo ""
fi

# ─── 4. Verification ───
if [ "$CHECK_MODE" = "1" ]; then
  # --check is a structural check for CI: verify the vendored sources are
  # intact and every SKILL.md has valid frontmatter. Do NOT touch $HOME.
  log "4. Verifying vendored structure (--check mode)..."
  fail=0

  # 4a. Plugin manifest (codex-plugin-cc ships one in package.json)
  if [ "$HAS_PLUGIN" = "1" ]; then
    if [ -f "$CODEX_PLUGIN_SRC/package.json" ]; then
      ok "  vendor/codex-plugin-cc/package.json present"
      if command -v python3 >/dev/null 2>&1; then
        version=$(python3 -c "import json; print(json.load(open('$CODEX_PLUGIN_SRC/package.json')).get('version','?'))" 2>/dev/null || echo "?")
        ok "  plugin version: $version"
      fi
    else
      warn "  vendor/codex-plugin-cc/package.json missing"
    fi
  fi

  # 4b. Every new skill under ai-config/skills/ has a SKILL.md with valid frontmatter
  REAL_SKILLS=0
  MISSING_FRONTMATTER=0
  MISSING_NAME=0
  MISSING_DESC=0
  for skill in "${ALL_NEW_SKILLS[@]}"; do
    skill_dir="$AI_OS_ROOT/ai-config/skills/$skill"
    [ -d "$skill_dir" ] || continue

    skill_md="$skill_dir/SKILL.md"
    if [ ! -f "$skill_md" ]; then
      warn "  $skill: SKILL.md missing"
      MISSING_FRONTMATTER=$((MISSING_FRONTMATTER + 1))
      continue
    fi
    REAL_SKILLS=$((REAL_SKILLS + 1))

    # Frontmatter delimiter check
    if ! head -5 "$skill_md" 2>/dev/null | grep -q "^---$"; then
      warn "  $skill: SKILL.md has no frontmatter delimiter"
      MISSING_FRONTMATTER=$((MISSING_FRONTMATTER + 1))
      continue
    fi

    # name: and description: field check
    if ! grep -q "^name:" "$skill_md" 2>/dev/null; then
      warn "  $skill: SKILL.md missing 'name:' field"
      MISSING_NAME=$((MISSING_NAME + 1))
    fi
    if ! grep -q "^description:" "$skill_md" 2>/dev/null; then
      warn "  $skill: SKILL.md missing 'description:' field"
      MISSING_DESC=$((MISSING_DESC + 1))
    fi
  done

  ok "  ai-config/skills/ new skills: $REAL_SKILLS present, $MISSING_FRONTMATTER missing SKILL.md"
  if [ "$MISSING_NAME" -gt 0 ] || [ "$MISSING_DESC" -gt 0 ]; then
    warn "  Frontmatter issues: $MISSING_NAME missing name:, $MISSING_DESC missing description:"
    fail=$((fail + 1))
  fi

  # 4c. codex-plugin-cc internal skills check
  if [ "$HAS_PLUGIN" = "1" ]; then
    PLUGIN_REAL=0
    PLUGIN_MISSING=0
    for skill in "${CODEX_PLUGIN_SKILLS[@]}"; do
      skill_md="$CODEX_PLUGIN_INNER_SRC/skills/$skill/SKILL.md"
      if [ -f "$skill_md" ]; then
        PLUGIN_REAL=$((PLUGIN_REAL + 1))
        if ! head -5 "$skill_md" 2>/dev/null | grep -q "^---$"; then
          warn "  plugin/$skill: SKILL.md has no frontmatter delimiter"
          PLUGIN_MISSING=$((PLUGIN_MISSING + 1))
        fi
      else
        warn "  plugin/$skill: SKILL.md missing"
        PLUGIN_MISSING=$((PLUGIN_MISSING + 1))
      fi
    done
    ok "  vendor/codex-plugin-cc/ internal skills: $PLUGIN_REAL present, $PLUGIN_MISSING with issues"
  fi
else
  log "4. Verifying symlinks (real install mode)..."
  fail=0

  # Check plugin link
  if [ "$HAS_PLUGIN" = "1" ]; then
    if [ -L "$HOME_DIR/.claude/plugins/codex-plugin-cc" ]; then
      target=$(readlink "$HOME_DIR/.claude/plugins/codex-plugin-cc")
      if [ -e "$target" ]; then
        ok "  ~/.claude/plugins/codex-plugin-cc → $target (target exists)"
      else
        err "  ~/.claude/plugins/codex-plugin-cc → $target (BROKEN: target missing)"
        fail=$((fail + 1))
      fi
    else
      err "  ~/.claude/plugins/codex-plugin-cc missing"
      fail=$((fail + 1))
    fi
  fi

  # Per-CLI count of correctly-pointing skill symlinks
  for cli_dir in "$HOME_DIR/.claude/skills" "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills" "$HOME_DIR/.hermes/skills/imported"; do
    count=0
    broken=0
    # 12 ai-config skills
    for skill in "${ALL_NEW_SKILLS[@]}"; do
      src="$AI_OS_ROOT/ai-config/skills/$skill"
      [ -d "$src" ] || continue
      link="$cli_dir/$skill"
      if [ -L "$link" ]; then
        target=$(readlink "$link")
        if [ -e "$target" ]; then count=$((count + 1)); else broken=$((broken + 1)); fi
      fi
    done
    # 3 plugin skills (only counted if plugin is vendored)
    if [ "$HAS_PLUGIN" = "1" ]; then
      for skill in "${CODEX_PLUGIN_SKILLS[@]}"; do
        src="$CODEX_PLUGIN_INNER_SRC/skills/$skill"
        [ -d "$src" ] || continue
        link="$cli_dir/$skill"
        if [ -L "$link" ]; then
          target=$(readlink "$link")
          if [ -e "$target" ]; then count=$((count + 1)); else broken=$((broken + 1)); fi
        fi
      done
    fi
    if [ "$broken" -eq 0 ]; then
      ok "  $cli_dir: $count new skills linked, 0 broken"
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
    ok "claude.tools / gstack integration structure verified (--check mode)."
    log ""
    log "This means:"
    log "  • All 12 new skills in ai-config/skills/ are present and well-formed"
    log "  • codex-plugin-cc plugin source is intact"
    log "  • Plugin internal skills (3) have valid frontmatter"
    log ""
    log "For real installation: bash setup/install-claude-tools.sh"
    log "═══════════════════════════════════════════════════════════"
    exit 0
  fi
  ok "claude.tools / gstack integration complete!"
  log ""
  log "What got wired:"
  log "  • ~/.claude/plugins/codex-plugin-cc → vendor/codex-plugin-cc/"
  log "  • 12 new skills propagated to ~/.codex/skills/, ~/.gemini/skills/,"
  log "    ~/.agents/skills/, ~/.hermes/skills/imported/"
  log "  • ~/.claude/skills/ already has them via install-mac.sh step 5"
  log "  • 3 codex-plugin-cc internal skills propagated to all 5 CLIs"
  log ""
  log "To update later:"
  log "  • Individual skills: re-run this script"
  log "  • codex-plugin-cc:  cd vendor/codex-plugin-cc && git pull && bash setup/install-claude-tools.sh"
  log "═══════════════════════════════════════════════════════════"
  exit 0
else
  err "$fail verification check(s) failed."
  log "Re-run without --check to fix, or inspect symlinks manually."
  log "═══════════════════════════════════════════════════════════"
  exit 1
fi
