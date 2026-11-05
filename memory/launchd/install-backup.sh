#!/usr/bin/env bash
#
# Install (or repair) the launchd agent that runs `ai-os backup` (+ --verify) daily.
#
#   bash memory/launchd/install-backup.sh            # install + load + run once now
#   bash memory/launchd/install-backup.sh --status    # loaded? last report?
#   bash memory/launchd/install-backup.sh --uninstall

set -euo pipefail

LABEL="ai.os.backup"
DOMAIN="gui/$(id -u)"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$HERE/../.." && pwd)"
TMPL="$HERE/$LABEL.plist.tmpl"
TARGET="$HOME/Library/LaunchAgents/$LABEL.plist"
LOG_DIR="$AI_OS_ROOT/memory/logs"
PYTHON="$HOME/.ai-os/venv/bin/python"

log() { printf '[backup] %s\n' "$*"; }

loaded() { launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1; }

last_log() { ls -t "$LOG_DIR"/backup-*.log 2>/dev/null | head -1 || true; }

case "${1:-install}" in
  --status)
    log "loaded:      $(loaded && echo yes || echo NO)"
    if f="$(last_log)" && [ -n "$f" ]; then
      log "last report: $(basename "$f")"
      sed 's/^/[backup]   /' "$f"
    else
      log "last report: never"
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

[ -x "$PYTHON" ] || { echo "missing $PYTHON (PyYAML venv) — run setup/install-mac.sh first" >&2; exit 1; }
mkdir -p "$LOG_DIR" "$(dirname "$TARGET")"
sed -e "s|__AI_OS_ROOT__|$AI_OS_ROOT|g" -e "s|__PYTHON__|$PYTHON|g" "$TMPL" > "$TARGET"
plutil -lint "$TARGET" >/dev/null
log "rendered $TARGET"

# bootout returns before launchd finishes tearing the job down; bootstrapping
# right away fails with "5: Input/output error" (seen with ai.os.ollama).
launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
for _ in $(seq 1 10); do loaded || break; sleep 1; done
for attempt in 1 2 3; do
  launchctl bootstrap "$DOMAIN" "$TARGET" 2>/dev/null && break
  [ "$attempt" = 3 ] && { echo "launchctl bootstrap failed — run: launchctl bootstrap $DOMAIN $TARGET" >&2; exit 1; }
  sleep 2
done
log "loaded (runs daily at 13:00)"

# Run once now through launchd itself, so PATH/env problems show up here.
before="$(last_log)"
launchctl kickstart "$DOMAIN/$LABEL"
for _ in $(seq 1 90); do
  f="$(last_log)"
  if [ -n "$f" ] && [ "$f" != "$before" ] && grep -qE "restores|backup failed|❌" "$f"; then
    tail -1 "$f" | sed 's/^/[backup]   /'
    exit 0
  fi
  sleep 2
done
log "first run did not finish within 3 min — check: bash $0 --status"
exit 1
