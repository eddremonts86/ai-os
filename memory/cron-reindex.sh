#!/usr/bin/env bash
# memory/cron-reindex.sh — periodic reindex of every git project next to ai-os.
#
# Runs 6x/day (0,4,8,12,16,20) via the launchd agent ai.os.reindex — install it
# with: bash memory/launchd/install-reindex.sh. Idempotent — codebase-memory-mcp's
# index_repository is content-addressed and skips files whose checksum hasn't
# changed, so repeat calls are cheap (ai-os itself: ~1.3s). Also refreshes the
# grepai index of ai-os.
#
# Projects: every git repo up to 3 levels below AI_OS_PROJECTS_DIR (default: the
# directory that contains ai-os), skipping paths that match AI_OS_REINDEX_SKIP
# (default: /inHold/ — parked projects).
#
# Logs to memory/logs/cron-reindex-YYYY-MM-DD-HHMMSS.log. Keeps the last 30
# days of logs.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
# Was hard-coded to $HOME/Projects, which is empty on this Mac (projects live on
# /Volumes/Works/...), so every run indexed nothing.
PROJECTS_DIR="${AI_OS_PROJECTS_DIR:-$(dirname "$AI_OS_ROOT")}"
SKIP_RE="${AI_OS_REINDEX_SKIP:-/inHold/}"
# launchd starts jobs with a bare PATH; codebase-memory-mcp and grepai live here.
export PATH="$HOME/.local/bin:$HOME/go/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
LOG_DIR="$AI_OS_ROOT/memory/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/cron-reindex-$(date +%Y-%m-%d-%H%M%S).log"

{
  echo "== AI-OS cron reindex $(date -Iseconds) =="
  echo ""

  # 0. Prerequisite check — bail early with a clear message if the stack is down,
  # so cron doesn't fill logs with confusing index failures.
  if ! command -v codebase-memory-mcp >/dev/null 2>&1; then
    echo "  ! codebase-memory-mcp binary not found; run: bash $AI_OS_ROOT/setup/install-mac.sh"
    exit 0
  fi
  # (No FalkorDB check: codebase-memory-mcp keeps its own index and does not
  # need the graph container. The old check made every run skip when Docker
  # was down.)

  # 1. Discover projects: git repos up to 3 levels deep, minus SKIP_RE.
  declare -a projects=()
  while IFS= read -r gitdir; do
    d="${gitdir%/.git}/"
    [[ "$d" =~ $SKIP_RE ]] && continue
    projects+=("$d")
  done < <(find "$PROJECTS_DIR" -mindepth 2 -maxdepth 4 -name .git -type d -not -path '*/node_modules/*' 2>/dev/null | sort)

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
        echo "  ! $label  unexpected response: $(echo "$out" | tail -c 300)"
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

  # 2. grepai: refresh the semantic index of ai-os (the only repo with .grepai/).
  if command -v grepai >/dev/null 2>&1 && [ -f "$AI_OS_ROOT/.grepai/config.yaml" ]; then
    if (cd "$AI_OS_ROOT" && grepai index >/dev/null 2>&1); then
      echo "  ✓ grepai index (ai-os)"
    else
      echo "  ✗ grepai index (ai-os) failed — is Ollama answering on :11500?"
    fi
  fi
  echo ""
  echo "== done =="
} >> "$LOG_FILE" 2>&1

# Prune old logs
find "$LOG_DIR" -name "cron-reindex-*.log" -mtime +30 -delete 2>/dev/null || true
find "$LOG_DIR" -name "bootstrap-*.log" -mtime +30 -delete 2>/dev/null || true
