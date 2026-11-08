#!/usr/bin/env bash
#
# Install (or repair) the launchd agent that runs refresh.sh daily at 11:30.
#
#   bash schedule/install.sh               # install + load
#   bash schedule/install.sh --run-now     # install + load + run once through launchd (checks PATH/env)
#   bash schedule/install.sh --status      # loaded? last run?
#   bash schedule/install.sh --uninstall

set -euo pipefail

LABEL="ai.os.ui-indexador"
DOMAIN="gui/$(id -u)"
APP="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMPL="$APP/schedule/$LABEL.plist.tmpl"
TARGET="$HOME/Library/LaunchAgents/$LABEL.plist"

log() { printf '[ui-indexador] %s\n' "$*"; }
loaded() { launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1; }
last_log() { ls -t "$APP"/logs/refresh-*.log 2>/dev/null | head -1 || true; }

case "${1:-install}" in
  --status)
    log "loaded:   $(loaded && echo yes || echo NO)"
    f="$(last_log)"
    if [ -n "$f" ]; then log "last run: $(basename "$f")"; tail -3 "$f" | sed 's/^/[ui-indexador]   /'; else log "last run: never"; fi
    exit 0 ;;
  --uninstall)
    launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null && log "unloaded" || log "was not loaded"
    rm -f "$TARGET"; log "removed $TARGET"; exit 0 ;;
  install|--run-now) ;;
  *) echo "unknown flag: $1 (try --run-now, --status or --uninstall)" >&2; exit 2 ;;
esac

mkdir -p "$APP/logs" "$(dirname "$TARGET")"
sed -e "s|__APP__|$APP|g" -e "s|__HOME__|$HOME|g" "$TMPL" > "$TARGET"
plutil -lint "$TARGET" >/dev/null
log "rendered $TARGET"

# bootout returns before launchd finishes tearing the job down; bootstrapping at once can fail with "5: I/O error".
launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
for _ in $(seq 1 10); do loaded || break; sleep 1; done
for attempt in 1 2 3; do
  launchctl bootstrap "$DOMAIN" "$TARGET" 2>/dev/null && break
  [ "$attempt" = 3 ] && { echo "launchctl bootstrap failed — run: launchctl bootstrap $DOMAIN $TARGET" >&2; exit 1; }
  sleep 2
done
log "loaded (runs daily at 11:30)"

if [ "${1:-}" = "--run-now" ]; then
  before="$(last_log)"
  launchctl kickstart "$DOMAIN/$LABEL"
  log "started a run through launchd; follow it with: tail -f \$(ls -t $APP/logs/refresh-*.log | head -1)"
  for _ in $(seq 1 15); do [ "$(last_log)" != "$before" ] && break; sleep 1; done
  log "log: $(last_log)"
fi
