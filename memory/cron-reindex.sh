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

  # grepai indexing is owned by `grepai watch`; do not start a persistent daemon from cron.
  echo "-- grepai indexing is not scheduled; use grepai watch per project or workspace --"

  # Verify stack still healthy.
  echo ""
  echo "-- status check --"
  bash "$HOME/Projects/ai-os/memory/ai-os-memory.sh" status 2>&1

  echo ""
  echo "== done =="
} >> "$LOG_FILE" 2>&1

# Optional: prune logs older than 30 days
find "$LOG_DIR" -name "ai-os-memory-reindex-*.log" -mtime +30 -delete 2>/dev/null || true
