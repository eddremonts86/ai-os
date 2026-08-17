#!/usr/bin/env bash
#
# Wrapper that the launchd plist fires 2x/day.
#
# Runs the two LLM-free phases of tools/plans-pipeline/daily.sh:
#   1. scrape  — fetch new captures from all enabled sources
#   2. intake  — materialise approved community submissions
#
# Does NOT run prepare/verify/ship — those need an LLM agent to rank and
# author plans, which is the human/agent cron at a different schedule
# (see tools/plans-pipeline/cron-prompt.md).
#
# Idempotent: if the pipeline lock is held, this run exits 0 without doing
# anything (the next tick picks it up). The 2x/day cadence is sized so two
# runs cannot overlap on a healthy machine.
#
# Logs: ~/Projects/ai-os/outputs/plans-pipeline/cron-scrape-YYYYMMDD-HHMM.log
# Lock: ~/Projects/ai-os/outputs/plans-pipeline/.lock (owned by daily.sh)
#
# Usage:
#   bash tools/plans-pipeline/scrape-cron.sh           # normal
#   bash tools/plans-pipeline/scrape-cron.sh --dry-run # scrape only, no intake
#   bash tools/plans-pipeline/scrape-cron.sh --once    # run now and exit (testing)

set -euo pipefail

AI_OS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$AI_OS_ROOT"

DRY_RUN=0
ONCE=0
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --once)    ONCE=1 ;;
    *) echo "unknown flag: $arg" >&2; exit 2 ;;
  esac
done

LOG_DIR="$AI_OS_ROOT/outputs/plans-pipeline"
LOG_FILE="$LOG_DIR/cron-scrape-$(date -u +%Y%m%d-%H%M%S).log"
mkdir -p "$LOG_DIR"

log() { printf '[scrape-cron] %s %s\n' "$(date -u +%FT%TZ)" "$*"; }

# Rotate old logs: keep the last 14 days. Cron jobs are noisy; we want enough
# history to diagnose a missed run, not a disk-filling stack of files.
find "$LOG_DIR" -name 'cron-scrape-*.log' -mtime +14 -delete 2>/dev/null || true

{
  log "=== START === AI_OS_ROOT=$AI_OS_ROOT"
  log "running scrape"
  # daily.sh exits non-zero when the lock is held by another run (e.g. the
  # other daily cadence is still going) or when the scraper itself fails.
  # Both cases are "skip this tick, the next one will retry", so we treat
  # non-zero as a non-fatal skip for the cron.
  if bash "$AI_OS_ROOT/tools/plans-pipeline/daily.sh" scrape; then
    log "scrape OK"
  else
    rc=$?
    log "scrape SKIPPED or FAILED (exit $rc) — skipping intake, next tick will retry"
    log "=== END ==="
    exit 0
  fi

  if [ "$DRY_RUN" -eq 1 ]; then
    log "--dry-run: skipping intake"
  else
    log "running intake"
    if bash "$AI_OS_ROOT/tools/plans-pipeline/daily.sh" intake; then
      log "intake OK"
    else
      rc=$?
      log "intake SKIPPED or FAILED (exit $rc) — next tick will retry"
    fi
  fi

  log "=== END ==="
} >> "$LOG_FILE" 2>&1