#!/usr/bin/env bash
#
# Install (or repair) the launchd job that runs the pipeline's two LLM-free phases.
#
#   bash apps/data/tools/plans-pipeline/launchd/install-scheduler.sh           # install + load
#   bash apps/data/tools/plans-pipeline/launchd/install-scheduler.sh --status  # report only
#   bash apps/data/tools/plans-pipeline/launchd/install-scheduler.sh --uninstall
#
# Deliberately not wired into setup/install-mac.sh: that script runs in CI on GitHub
# runners, and bootstrapping a scraper cron there would have runners scraping ProblemHunt
# on every push.
#
# `--status` exists because the failure mode is silent. A launchd job that is not loaded
# looks exactly like one that is: the plist is still on disk, the logs still hold the last
# successful run, and nothing anywhere says captures stopped arriving.

set -euo pipefail

find_ai_os_root() {
  local d; d="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  while [ "$d" != "/" ]; do
    [ -f "$d/CLAUDE.md" ] && { printf '%s' "$d"; return 0; }
    d="$(dirname "$d")"
  done
  return 1
}
AI_OS_ROOT="${AI_OS_ROOT:-$(find_ai_os_root)}" || { echo "cannot locate the AI-OS root (no CLAUDE.md above this script)" >&2; exit 1; }

LABEL="ai.os.plans-pipeline"
TMPL="$AI_OS_ROOT/apps/data/tools/plans-pipeline/launchd/$LABEL.plist.tmpl"
TARGET="$HOME/Library/LaunchAgents/$LABEL.plist"
DOMAIN="gui/$(id -u)"

log() { printf '[scheduler] %s\n' "$*"; }

loaded() { launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1; }

case "${1:-install}" in
  --status)
    log "plist:  $([ -f "$TARGET" ] && echo present || echo MISSING)"
    log "loaded: $(loaded && echo yes || echo NO)"
    if loaded; then
      launchctl print "$DOMAIN/$LABEL" | grep -E '^\s+(state|runs|last exit code) ' | sed 's/^/[scheduler]   /'
    fi
    newest=$(find "$AI_OS_ROOT/apps/data/outputs/plans-pipeline" -name 'cron-scrape-*.log' -print0 2>/dev/null \
             | xargs -0 ls -t 2>/dev/null | head -1)
    log "last run log: ${newest:-none}"
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

[ -f "$TMPL" ] || { echo "template not found at $TMPL" >&2; exit 1; }

mkdir -p "$HOME/Library/LaunchAgents" "$AI_OS_ROOT/apps/data/outputs/plans-pipeline"

# Render to a temp file and lint before it replaces a working job: a malformed plist makes
# launchd refuse the whole thing, and the old one is already gone by then.
tmp=$(mktemp -t aios-plist-XXXX)
sed -e "s|__AI_OS_ROOT__|$AI_OS_ROOT|g" -e "s|__HOME__|$HOME|g" "$TMPL" > "$tmp"
plutil -lint "$tmp" >/dev/null || { rm -f "$tmp"; echo "rendered plist is malformed — refusing to install" >&2; exit 1; }
mv "$tmp" "$TARGET"
log "wrote $TARGET"

# bootout first: bootstrap on an already-loaded label fails, and "already loaded" is the
# normal state when repairing.
launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$TARGET"
loaded || { echo "bootstrap reported success but the job is not in the domain" >&2; exit 1; }
log "loaded — fires at 08:00 and 20:00 local"
log "verify with: bash ${BASH_SOURCE[0]} --status"
log "run once now: launchctl kickstart -p $DOMAIN/$LABEL"
