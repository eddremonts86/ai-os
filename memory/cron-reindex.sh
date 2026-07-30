#!/usr/bin/env bash
# memory/cron-reindex.sh — periodic reindex of every project under ~/Projects.
#
# Runs 6x/day via crontab (0,4,8,12,16,20). Idempotent — codebase-memory-mcp's
# index_repository is content-addressed and skips files whose checksum hasn't
# changed, so repeat calls are cheap on the index side and free on the work side.
#
# Logs to memory/logs/cron-reindex-YYYY-MM-DD-HHMMSS.log. Keeps the last 30
# days of logs.
#
# Add the crontab entry with:
#   (crontab -l 2>/dev/null | grep -v 'memory/cron-reindex.sh'; \
#    echo '0 0,4,8,12,16,20 * * * /Users/edd/Projects/ai-os/memory/cron-reindex.sh') \
#   | crontab -

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="${HOME:-$(dscl . -read /Users/"$(id -un)" NFSHomeDirectory 2>/dev/null | awk '{print $2}')}"
[ -z "$HOME_DIR" ] && HOME_DIR="/Users/$(id -un)"
PROJECTS_DIR="$HOME_DIR/Projects"
LOG_DIR="$AI_OS_ROOT/memory/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/cron-reindex-$(date +%Y-%m-%d-%H%M%S).log"

# Source env if present (not strictly required for reindex, but harmless)
if [ -f "$HOME_DIR/Projects/configs/env.ts" ]; then
  set -a
  # shellcheck disable=SC1090
  source "$HOME_DIR/Projects/configs/env.ts" 2>/dev/null || true
  set +a
fi

{
  echo "== AI-OS cron reindex $(date -Iseconds) =="
  echo ""

  # 0. Prerequisite check — bail early with a clear message if the stack is down,
  # so cron doesn't fill logs with confusing index failures.
  if ! command -v codebase-memory-mcp >/dev/null 2>&1; then
    echo "  ! codebase-memory-mcp binary not found; run: bash $AI_OS_ROOT/setup/install-mac.sh"
    exit 0
  fi
  if ! docker ps --format '{{.Names}}' 2>/dev/null | grep -q '^ia-os-falkordb$'; then
    echo "  ! ia-os-falkordb not running; skipping (run: bash $AI_OS_ROOT/setup/ai-os-bootstrap.sh)"
    exit 0
  fi

  # 1. Discover projects: top-level and one nested level under ~/Projects/,
  #    filtered to those with .git/. Skips ai-os itself (the toolchain).
  declare -a projects=()
  for d in "$PROJECTS_DIR"/*/; do
    [ -d "$d.git" ] || continue
    case "$d" in
      "$PROJECTS_DIR/ai-os/"|"$PROJECTS_DIR/configs/") continue ;;
    esac
    projects+=("$d")
  done
  for d in "$PROJECTS_DIR"/*/*/; do
    [ -d "$d.git" ] || continue
    case "$d" in
      "$PROJECTS_DIR/ai-os/"*) continue ;;
    esac
    projects+=("$d")
  done

  echo "  → ${#projects[@]} project(s) to reindex"
  echo ""

  ok=0; fail=0
  for path in "${projects[@]}"; do
    label="${path#$PROJECTS_DIR/}"
    label="${label%/}"
    payload="$(printf '{"repo_path":"%s"}' "$path")"
    if out=$(codebase-memory-mcp cli index_repository "$payload" 2>&1); then
      if echo "$out" | grep -q '"status":"indexed"'; then
        nodes=$(echo "$out" | grep -oE '"nodes":[0-9]+' | head -1 | grep -oE '[0-9]+' || echo "?")
        echo "  ✓ $label  ($nodes nodes)"
        ok=$((ok + 1))
      else
        echo "  ! $label  unexpected response: $out"
        fail=$((fail + 1))
      fi
    else
      echo "  ✗ $label  exit=$?"
      fail=$((fail + 1))
    fi
  done

  echo ""
  echo "  summary: $ok ok, $fail failed, $((ok + fail)) total"
  echo ""
  echo "== done =="
} >> "$LOG_FILE" 2>&1

# Prune old logs
find "$LOG_DIR" -name "cron-reindex-*.log" -mtime +30 -delete 2>/dev/null || true
find "$LOG_DIR" -name "bootstrap-*.log" -mtime +30 -delete 2>/dev/null || true
