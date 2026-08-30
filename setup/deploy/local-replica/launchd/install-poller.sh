#!/usr/bin/env bash
#
# Install (or repair) the launchd job that keeps the local replicas level with `dev`.
#
#   bash setup/deploy/local-replica/launchd/install-poller.sh            # install + load
#   bash setup/deploy/local-replica/launchd/install-poller.sh --status   # report only
#   bash setup/deploy/local-replica/launchd/install-poller.sh --uninstall
#
# Deliberately not wired into setup/install-mac.sh: that script runs on GitHub runners in
# CI, and a runner polling GitHub to deploy to a Coolify it cannot reach is pure noise.
#
# `--status` exists because the failure mode is silent. A launchd job that is not loaded
# looks exactly like one that is: the plist is still on disk, the logs still hold the last
# successful pass, and nothing anywhere says the replicas stopped following `dev`.
set -euo pipefail

find_ai_os_root() {
  local d; d="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  while [ "$d" != "/" ]; do
    [ -f "$d/CLAUDE.md" ] && { printf '%s' "$d"; return 0; }
    d="$(dirname "$d")"
  done
  return 1
}
AI_OS_ROOT="${AI_OS_ROOT:-$(find_ai_os_root)}" || {
  echo "cannot locate the AI-OS root (no CLAUDE.md above this script)" >&2; exit 1; }

LABEL="ai.os.local-replica"
TMPL="$AI_OS_ROOT/setup/deploy/local-replica/launchd/$LABEL.plist.tmpl"
TARGET="$HOME/Library/LaunchAgents/$LABEL.plist"
LOGDIR="$AI_OS_ROOT/outputs/local-replica"
DOMAIN="gui/$(id -u)"

log() { printf '[local-replica] %s\n' "$*"; }
loaded() { launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1; }

case "${1:-install}" in
  --status)
    log "plist:  $([ -f "$TARGET" ] && echo present || echo MISSING)  ($TARGET)"
    log "loaded: $(loaded && echo yes || echo NO)"
    log "logs:   $LOGDIR"
    if [ -f "$LOGDIR/launchd.out.log" ]; then
      echo; log "last lines:"; tail -5 "$LOGDIR/launchd.out.log" | sed 's/^/    /'
    fi
    exit 0
    ;;
  --uninstall)
    if loaded; then launchctl bootout "$DOMAIN/$LABEL" || true; log "unloaded"; fi
    rm -f "$TARGET" && log "removed $TARGET"
    log "the state file and logs are left alone; delete them by hand if you mean it"
    exit 0
    ;;
esac

[ -f "$TMPL" ] || { echo "template missing: $TMPL" >&2; exit 1; }

mkdir -p "$LOGDIR" "$(dirname "$TARGET")"
sed "s#__AI_OS_ROOT__#$AI_OS_ROOT#g" "$TMPL" > "$TARGET"
log "wrote $TARGET"

# bootout first: bootstrap on an already-loaded label fails, and "already loaded" is the
# normal state when this is re-run to pick up a template change.
if loaded; then launchctl bootout "$DOMAIN/$LABEL" >/dev/null 2>&1 || true; fi
launchctl bootstrap "$DOMAIN" "$TARGET"
log "loaded $LABEL (every 120s)"

if ! grep -q '^COOLIFY_LOCAL_API_TOKEN=' "$AI_OS_ROOT/dev-env/env-config/.env" 2>/dev/null; then
  cat <<EOF

  Not finished yet. The poller needs a token for the LOCAL Coolify:

    http://localhost:8000 → Keys & Tokens → API tokens

  then add to dev-env/env-config/.env

    COOLIFY_LOCAL_API_URL=http://localhost:8000
    COOLIFY_LOCAL_API_TOKEN=<the token>

  Until then every pass exits 1 with that message, which is the intent — a poller
  that quietly does nothing is the failure this whole pipeline exists to end.
EOF
fi
