#!/usr/bin/env bash
#
# Install (or repair) the launchd agent that keeps the code indexes fresh.
#
#   bash memory/launchd/install-reindex.sh            # install + load + run once now
#   bash memory/launchd/install-reindex.sh --status    # loaded? last run? last summary?
#   bash memory/launchd/install-reindex.sh --uninstall

set -euo pipefail

LABEL="ai.os.reindex"
DOMAIN="gui/$(id -u)"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$HERE/../.." && pwd)"
TMPL="$HERE/$LABEL.plist.tmpl"
TARGET="$HOME/Library/LaunchAgents/$LABEL.plist"
LOG_DIR="$AI_OS_ROOT/memory/logs"

log() { printf '[reindex] %s\n' "$*"; }

loaded() { launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1; }

last_log() { ls -t "$LOG_DIR"/cron-reindex-*.log 2>/dev/null | head -1 || true; }

case "${1:-install}" in
  --status)
    log "loaded:   $(loaded && echo yes || echo NO)"
    if f="$(last_log)" && [ -n "$f" ]; then
      log "last run: $(basename "$f")"
      grep -E "summary:|grepai" "$f" | sed 's/^ */[reindex]   /'
    else
      log "last run: never"
    fi
    exit 0
    ;;
  --uninstall)
    if launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null; then log "unloaded"; else log "was not loaded"; fi
    rm -f "$TARGET"
    log "removed $TARGET"
    exit 0
    ;;
  install) ;;
  *) echo "unknown flag: $1 (try --status or --uninstall)" >&2; exit 2 ;;
esac

mkdir -p "$LOG_DIR" "$(dirname "$TARGET")"
sed -e "s|__AI_OS_ROOT__|$AI_OS_ROOT|g" "$TMPL" > "$TARGET"
plutil -lint "$TARGET" >/dev/null
log "rendered $TARGET"

# bootout first so a re-install picks up template changes.
launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$TARGET"
log "loaded (runs at 00/04/08/12/16/20)"

# Run once now and prove it produced a summary, instead of trusting the load.
before="$(last_log)"
launchctl kickstart "$DOMAIN/$LABEL"
for _ in $(seq 1 120); do
  f="$(last_log)"
  if [ -n "$f" ] && [ "$f" != "$before" ] && grep -q "== done ==" "$f"; then
    grep -E "summary:|grepai" "$f" | sed 's/^ */[reindex]   /'
    exit 0
  fi
  sleep 2
done
log "first run did not finish within 4 min — check: bash $0 --status"
exit 1
