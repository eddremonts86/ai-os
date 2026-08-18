#!/usr/bin/env zsh
# plans-explorer/refresh-data.sh
#
# Regenerates plans.json + rankings.json and rebuilds the SPA.
# Intended to be hooked into the problemhunt-scraper cron, or run manually:
#
#   ~/Projects/ai-os/plans-explorer/refresh-data.sh
#
# Exits non-zero on failure. Output goes to stdout (suitable for cron logs).

set -e

SCRIPT_DIR="${0:A:h}"
APP_DIR="$SCRIPT_DIR/app"

echo "[refresh-data] $(date -u +%FT%TZ) starting in $APP_DIR"

if [[ ! -d "$APP_DIR" ]]; then
  echo "[refresh-data] ERROR: $APP_DIR not found" >&2
  exit 1
fi

cd "$APP_DIR"

# Build = prebuild (indexer) + vite build + vue-tsc typecheck.
# Output goes to app/dist/, ready for static deploy.
npm run build

echo "[refresh-data] build OK — dist/ ready at $APP_DIR/dist"
