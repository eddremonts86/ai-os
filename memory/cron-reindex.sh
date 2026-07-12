#!/usr/bin/env bash
# cron/ai-os-memory-reindex.sh
# Weekly reindex of the AI-OS memory stack (phase 1, Task 1.8).
# Triggered by Hermes cron every Sunday 3am.
# Logs to ~/.hermes/cron/ai-os-memory-reindex-<date>.log

set -uo pipefail

LOG_DIR="$HOME/.hermes/cron"
LOG_FILE="$LOG_DIR/ai-os-memory-reindex-$(date +%Y-%m-%d-%H%M%S).log"
mkdir -p "$LOG_DIR"

{
  echo "== AI-OS memory reindex $(date -Iseconds) =="
  echo ""

  # 1. Reindex active work projects
  for proj in \
      "$HOME/Projects/ei-schilling/wave-template" \
      "$HOME/Projects/ei-schilling/kontrakt-manager" \
      "$HOME/Projects/ei-schilling/wave-tech-radar" \
      "$HOME/Projects/ei-schilling/ia-royalty-validations" \
      "$HOME/Projects/ai-os" \
      "$HOME/Projects/eddremonts86/anySolutions"
  do
    if [ -d "$proj" ]; then
      echo "-- indexing: $proj"
      cd "$proj" && grepai index 2>&1 || echo "  (grepai index skipped or failed)"
    fi
  done

  # 2. Sync last 30 days of sessions
  echo ""
  echo "-- syncing sessions (last 30 days) --"
  bash "$HOME/Projects/ai-os/memory/ai-os-memory.sh" sync-sessions 30 2>&1 || echo "  (sync-sessions skipped or failed)"

  # 3. Verify stack still healthy
  echo ""
  echo "-- status check --"
  bash "$HOME/Projects/ai-os/memory/ai-os-memory.sh" status 2>&1

  echo ""
  echo "== done =="
} >> "$LOG_FILE" 2>&1

# Optional: prune logs older than 30 days
find "$LOG_DIR" -name "ai-os-memory-reindex-*.log" -mtime +30 -delete 2>/dev/null || true
