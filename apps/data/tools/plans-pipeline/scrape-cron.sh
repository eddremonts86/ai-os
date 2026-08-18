#!/usr/bin/env bash
#
# Wrapper that the launchd plist fires on a schedule.
#
# Runs the two LLM-free phases of apps/data/tools/plans-pipeline/daily.sh:
#   1. scrape  — fetch new captures from all enabled sources
#   2. intake  — materialise approved community submissions
#
# Does NOT run prepare/verify/ship — those need an LLM agent to rank and author plans, which
# is the Hermes cron at a different cadence (see cron-prompt.md and README.md).
#
# Idempotent: if the pipeline lock is held, this run exits 0 without doing anything (the next
# tick picks it up). The cadence is sized so two runs cannot overlap on a healthy machine.
#
# Logs: apps/data/outputs/plans-pipeline/cron-scrape-YYYYMMDD-HHMMSS.log
# Lock: apps/data/outputs/plans-pipeline/.lock (owned by daily.sh)
#
# Usage:
#   bash apps/data/tools/plans-pipeline/scrape-cron.sh           # normal
#   bash apps/data/tools/plans-pipeline/scrape-cron.sh --dry-run # scrape only, no intake
#   bash apps/data/tools/plans-pipeline/scrape-cron.sh --once    # run now and exit (testing)

set -euo pipefail

# Resolve the repo root by walking up to the CLAUDE.md marker, never by counting `..` hops.
# This script originally did `dirname "$BASH_SOURCE"/../..`, which was correct while it lived
# at tools/plans-pipeline/ and resolves to apps/data/ from here — a wrong root that yields an
# empty corpus and a green run that scraped nothing. See docs/repo-layout.md.
_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT=""
while [ "$_dir" != "/" ]; do
  if [ -f "$_dir/CLAUDE.md" ]; then AI_OS_ROOT="$_dir"; break; fi
  _dir="$(dirname "$_dir")"
done
if [ -z "$AI_OS_ROOT" ]; then
  echo "[scrape-cron] cannot locate the AI-OS root (no CLAUDE.md above ${BASH_SOURCE[0]})" >&2
  exit 1
fi
cd "$AI_OS_ROOT"

DAILY="$AI_OS_ROOT/apps/data/tools/plans-pipeline/daily.sh"
if [ ! -f "$DAILY" ]; then
  echo "[scrape-cron] daily.sh not found at $DAILY" >&2
  exit 1
fi

DRY_RUN=0
ONCE=0
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --once)    ONCE=1 ;;
    *) echo "unknown flag: $arg" >&2; exit 2 ;;
  esac
done

LOG_DIR="$AI_OS_ROOT/apps/data/outputs/plans-pipeline"
LOG_FILE="$LOG_DIR/cron-scrape-$(date -u +%Y%m%d-%H%M%S).log"
mkdir -p "$LOG_DIR"

log() { printf '[scrape-cron] %s %s\n' "$(date -u +%FT%TZ)" "$*"; }

# Rotate old logs: keep the last 14 days. Cron jobs are noisy; we want enough history to
# diagnose a missed run, not a disk-filling stack of files.
find "$LOG_DIR" -name 'cron-scrape-*.log' -mtime +14 -delete 2>/dev/null || true

{
  log "=== START === AI_OS_ROOT=$AI_OS_ROOT once=$ONCE dry_run=$DRY_RUN"
  log "running scrape"
  # daily.sh exits non-zero when the lock is held by another run (e.g. the other cadence is
  # still going) or when the scraper itself fails. Both cases are "skip this tick, the next
  # one will retry", so the cron treats non-zero as a non-fatal skip.
  if bash "$DAILY" scrape; then
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
    if bash "$DAILY" intake; then
      log "intake OK"
    else
      rc=$?
      log "intake SKIPPED or FAILED (exit $rc) — next tick will retry"
    fi
  fi

  log "=== END ==="
} >> "$LOG_FILE" 2>&1
