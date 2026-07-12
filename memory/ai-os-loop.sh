#!/usr/bin/env bash
# ai-os-loop — companion CLI to ai-os-memory.sh
# Manages AI-OS loops: 4-file system (TASK.md / LOOP_INSTRUCTIONS.md / PROGRESS.md / outputs/)
# per rules/loop_safety.md (6 blast-radius levels).
#
# Vendor-neutral: loop files are pure markdown, work the same under Hermes,
# Claude Code, Codex, Gemini, Antigravity, manual invocation.

set -uo pipefail
# Note: deliberately NOT using `set -e`. CLI scripts with dynamic awk/grep/date
# invocations fail with strict mode when a subcommand returns non-zero for
# non-fatal reasons (no matches, etc). We handle each step's exit status
# explicitly and emit user-facing errors via `err` instead of failing silently.

# Resolve HOME and AI_OS_ROOT with safe fallbacks (works under `env -i` from MCP loaders).
if [ -z "${HOME:-}" ]; then
  _user="$(id -un 2>/dev/null || whoami 2>/dev/null || echo unknown)"
  HOME=$(dscl . -read /Users/"$_user" NFSHomeDirectory 2>/dev/null | awk '{print $2}') || true
  if [ -z "${HOME:-}" ]; then
    HOME="/Users/$_user"
  fi
  if [ ! -d "$HOME" ]; then
    HOME="/tmp"
  fi
fi
export HOME

if [ -d "$HOME/.local/bin" ]; then
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) : ;;
    *) export PATH="$HOME/.local/bin:$PATH" ;;
  esac
fi

if [ -z "${AI_OS_ROOT:-}" ]; then
  _script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
  _cur="$_script_dir"
  while [ "$_cur" != "/" ]; do
    if [ -f "$_cur/CLAUDE.md" ]; then
      AI_OS_ROOT="$_cur"
      break
    fi
    _cur="$(dirname "$_cur")"
  done
fi
: "${AI_OS_ROOT:=/Users/edd/Projects/ai-os}"

# Loop state lives here, alongside ai-os-memory.sh's docker/falkordb work
LOOP_STATE_DIR="$AI_OS_ROOT/memory/loop_state"
mkdir -p "$LOOP_STATE_DIR" 2>/dev/null || true

# --- helpers -------------------------------------------------------

# stderr-log helper with red [ai-os loop] prefix
say()  { printf '%b\n' "$*"; }
hdr()  { printf '\n== %s ==\n' "$*"; }
ok()   { printf '  \033[32m✓\033[0m %s\n' "$*"; }
warn() { printf '  \033[33m!\033[0m %s\n' "$*"; }
err()  { printf '  \033[31m✗\033[0m %s\n' "$*" >&2; }

# Data store for loop registry: memory/loop_state/registry.txt
# Format: one line per loop → "<id>|<dir>|<level>|<status>|<created_at>"
# Pure text — any CLI (Hermes, Claude Code, grep, awk) can read it.
LOOP_REGISTRY="$LOOP_STATE_DIR/registry.txt"
LOOP_PROGRESS="$LOOP_STATE_DIR/PROGRESS.md"

loop_registered_init() {
  if [ ! -f "$LOOP_REGISTRY" ]; then
    cat > "$LOOP_REGISTRY" <<'HEAD'
# format: id|directory|level|status|created_at
HEAD
  fi
  if [ ! -f "$LOOP_PROGRESS" ]; then
    cat > "$LOOP_PROGRESS" <<'HEAD'
# AI-OS Loops — Cross-loop Progress

This file aggregates the latest status across every registered AI-OS
loop. Each loop's own directory has its own PROGRESS.md with full detail;
this file is the control panel for the whole loop fleet.

## Current State
- Last updated: (never)
- Active loops: 0
- Paused: 0

## Loops
HEAD
  fi
}

sub_loop_ls() {
  loop_registered_init
  hdr "Registered loops"
  if [ ! -s "$LOOP_REGISTRY" ] || [ "$(wc -l < "$LOOP_REGISTRY")" -le 1 ]; then
    echo "  (none)"
    echo ""
    echo "  add a loop:  ai-os loop add <dir>  (requires TASK.md, LOOP_INSTRUCTIONS.md)"
    return 0
  fi
  printf '  %-20s  %-22s  %-5s  %s\n' "id" "directory" "level" "status"
  printf '  %-20s  %-22s  %-5s  %s\n' "────────────────────" "──────────────────────" "─────" "────────"
  awk -F'|' '!/^#/ && NF==5 { printf "  %-20s  %-22s  %-5s  %s\n", $1, $2, $3, $4 }' "$LOOP_REGISTRY"
  echo ""
  echo "  cross-loop progress: $(grep -m1 -oE '[^|]+' "$LOOP_PROGRESS" 2>/dev/null)"
  echo "  PROGRESS.md: $LOOP_PROGRESS"
}

sub_loop_add() {
  local target="${1:-}"
  if [ -z "$target" ]; then
    err "usage: ai-os loop add <dir>"
    err "       (dir must contain TASK.md + LOOP_INSTRUCTIONS.md)"
    return 1
  fi
  # Resolve to absolute path
  target="$(cd "$target" 2>/dev/null && pwd || echo "$target")"
  if [ ! -f "$target/TASK.md" ]; then
    err "$target/TASK.md not found"
    echo ""
    echo "  Fix: copy the templates from $AI_OS_ROOT/workflows/loop_template.md"
    echo "        then re-run: ai-os loop add $target"
    return 1
  fi
  if [ ! -f "$target/LOOP_INSTRUCTIONS.md" ]; then
    err "$target/LOOP_INSTRUCTIONS.md not found"
    return 1
  fi

  loop_registered_init

  # Derive an id from the basename of the directory + a short hash for disambiguation
  local base id level
  base="$(basename "$target")"
  id="$base"

  # Extract blast radius level from TASK.md if present
  level="$(grep -iE 'blast radius level|level:' "$target/TASK.md" | head -1 | grep -oE '[1-6]' | head -1)"
  : "${level:=2}"  # default to level 2 (draft outputs only) — safest per rules/loop_safety.md

  # Track if already registered
  if grep -q "^${id}|" "$LOOP_REGISTRY"; then
    err "loop '$id' is already registered; remove it first with: ai-os loop rm $id"
    return 1
  fi

  local created
  created="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  printf '%s|%s|%s|active|%s\n' "$id" "$target" "$level" "$created" >> "$LOOP_REGISTRY"
  ok "loop added: $id"
  echo "  directory: $target"
  echo "  level:     $level (see $AI_OS_ROOT/rules/loop_safety.md)"
  echo "  PROGRESS:  $target/PROGRESS.md"
  return 0
}

sub_loop_rm() {
  local id="${1:-}"
  if [ -z "$id" ]; then
    err "usage: ai-os loop rm <id>"
    return 1
  fi
  loop_registered_init
  if ! grep -q "^${id}|" "$LOOP_REGISTRY"; then
    err "no such loop: $id"
    return 1
  fi
  local dir
  dir="$(grep "^${id}|" "$LOOP_REGISTRY" | head -1 | awk -F'|' '{print $2}')"
  local today
  today="$(date -u +%Y-%m-%d)"
  # Mark as removed (keep history, do not delete directory) — field 4 -> status
  awk -F'|' -v OFS='|' -v id="$id" -v d="$today" '$1 == id { $4 = "removed (" d ")" } { print }' "$LOOP_REGISTRY" > "$LOOP_REGISTRY.tmp" \
    && mv "$LOOP_REGISTRY.tmp" "$LOOP_REGISTRY"
  ok "loop removed: $id"
  echo "  (kept loop directory at: $dir)"
  echo "  to fully delete:  rm -rf $dir"
  return 0
}

sub_loop_status() {
  local id="${1:-}"
  if [ -z "$id" ]; then
    err "usage: ai-os loop status <id>"
    return 1
  fi
  loop_registered_init
  if ! grep -q "^${id}|" "$LOOP_REGISTRY"; then
    err "no such loop: $id"
    return 1
  fi
  local line dir level status
  line="$(grep "^${id}|" "$LOOP_REGISTRY" | head -1)"
  dir="$(echo "$line" | awk -F'|' '{print $2}')"
  level="$(echo "$line" | awk -F'|' '{print $3}')"
  status="$(echo "$line" | awk -F'|' '{print $4}')"
  hdr "Loop: $id"
  echo "  directory: $dir"
  echo "  level:     $level"
  echo "  status:    $status"
  echo ""
  if [ -f "$dir/TASK.md" ]; then
    ok "TASK.md: present"
    echo "    ---"
    head -3 "$dir/TASK.md" | sed 's/^/    /'
    echo "    ---"
  else
    err "TASK.md missing"
  fi
  if [ -f "$dir/LOOP_INSTRUCTIONS.md" ]; then
    ok "LOOP_INSTRUCTIONS.md: present"
  else
    err "LOOP_INSTRUCTIONS.md missing"
  fi
  if [ -f "$dir/PROGRESS.md" ]; then
    local last_date
    last_date="$(grep -m1 -E '^## Last Run|last_updated' "$dir/PROGRESS.md" || echo "(no runs recorded)")"
    ok "PROGRESS.md: present"
    echo "    last: $last_date"
  else
    warn "PROGRESS.md: not created yet (no runs)"
  fi
  if [ -d "$dir/outputs" ]; then
    local out_count
    out_count=$(ls -1 "$dir/outputs" 2>/dev/null | wc -l | tr -d ' ')
    ok "outputs/: $out_count files"
  else
    warn "outputs/: not created yet"
  fi
  return 0
}

sub_loop_pause() {
  local id="${1:-}"
  if [ -z "$id" ]; then
    err "usage: ai-os loop pause <id>"
    return 1
  fi
  loop_registered_init
  if ! grep -q "^${id}|" "$LOOP_REGISTRY"; then
    err "no such loop: $id"
    return 1
  fi
  # Use a temp file to update the status field (awk-free, more portable)
  awk -F'|' -v OFS='|' -v id="$id" '$1 == id { $4 = "paused" } { print }' "$LOOP_REGISTRY" > "$LOOP_REGISTRY.tmp" \
    && mv "$LOOP_REGISTRY.tmp" "$LOOP_REGISTRY"
  ok "loop paused: $id"
  return 0
}

sub_loop_run() {
  local id="${1:-}"
  if [ -z "$id" ]; then
    err "usage: ai-os loop run <id>"
    return 1
  fi
  loop_registered_init
  if ! grep -q "^${id}|" "$LOOP_REGISTRY"; then
    err "no such loop: $id"
    return 1
  fi
  local dir
  dir="$(grep "^${id}|" "$LOOP_REGISTRY" | head -1 | awk -F'|' '{print $2}')"
  hdr "Running loop: $id"
  echo "  directory: $dir"
  echo "  (this hands off to your CLI of choice — Claude will read the loop files manually)"
  echo ""
  if command -v open >/dev/null 2>&1; then
    # macOS specific — open Terminal at the loop directory
    open -a Terminal "$dir"
    ok "Terminal opened at $dir"
  fi
  echo ""
  echo "  Paste this in your CLI:"
  echo ""
  echo "    Read $dir/TASK.md"
  echo "    Read $dir/PROGRESS.md"
  echo "    Read $dir/LOOP_INSTRUCTIONS.md"
  echo "    Then do exactly what LOOP_INSTRUCTIONS.md says."
  echo ""
  echo "  (automating this for Hermes: add a cronjob that points at this dir"
  echo "   with the LOOP_INSTRUCTIONS.md contents as the prompt)"
}

sub_loop_show() {
  local id="${1:-}"
  if [ -z "$id" ]; then
    err "usage: ai-os loop show <id>   (or just: ai-os loop show PROGRESS.md)"
    return 1
  fi
  if [ "$id" = "PROGRESS.md" ]; then
    if [ -f "$LOOP_PROGRESS" ]; then
      cat "$LOOP_PROGRESS"
    else
      err "no cross-loop PROGRESS.md at $LOOP_PROGRESS"
    fi
    return 0
  fi
  loop_registered_init
  if ! grep -q "^${id}|" "$LOOP_REGISTRY"; then
    err "no such loop: $id"
    return 1
  fi
  local dir
  dir="$(grep "^${id}|" "$LOOP_REGISTRY" | head -1 | awk -F'|' '{print $2}')"
  if [ -f "$dir/PROGRESS.md" ]; then
    cat "$dir/PROGRESS.md"
  else
    err "no PROGRESS.md at $dir/PROGRESS.md"
  fi
  return 0
}

# --- entry point ---------------------------------------------------

# If user calls "ai-os loop" instead of "ai-os-loop", accept it.
case "${0##*/}" in
  ai-os-loop|ai-os) ;;
  *)
    # called via "ai-os memory" or symlink path — do nothing different
    ;;
esac

case "${1:-}" in
  ls|list)        sub_loop_ls ;;
  add)            shift; sub_loop_add "$@" ;;
  rm|remove)      shift; sub_loop_rm "$@" ;;
  status)         shift; sub_loop_status "$@" ;;
  show|view)      shift; sub_loop_show "$@" ;;
  pause)          shift; sub_loop_pause "$@" ;;
  run|execute)    shift; sub_loop_run "$@" ;;
  help|--help|-h|"")
    cat <<EOF
ai-os loop — companion CLI to ai-os-memory (phase 2)

Manages reusable claude loops: 4-file system (TASK.md,
LOOP_INSTRUCTIONS.md, PROGRESS.md, outputs/) with 6 blast-radius
safety levels defined in $AI_OS_ROOT/rules/loop_safety.md.

Usage: ai-os loop <subcommand> [args]

Subcommands:
  ls                  List all registered loops
  add <dir>           Register a loop (requires TASK.md + LOOP_INSTRUCTIONS.md)
  rm <id>             Mark a loop as removed (keeps the directory)
  status <id>         Show loop files state + level + last activity
  show <id>           Cat the loop's PROGRESS.md
  show PROGRESS.md    Cat the cross-loop PROGRESS.md
  run <id>            Open Terminal at loop dir + print run prompt
  pause <id>          Disable scheduling for a loop

Loop files are 100% vendor-neutral — they work the same under Hermes,
Claude Code, Codex, Gemini, Antigravity, manual paste.

Templates: $AI_OS_ROOT/workflows/loop_template.md
Safety rules: $AI_OS_ROOT/rules/loop_safety.md
Skill: ai-os-loop (skills: prefix per Hermes convention)
EOF
    ;;
  *)
    err "unknown subcommand: $1 (try: ai-os loop help)"
    exit 1
    ;;
esac
