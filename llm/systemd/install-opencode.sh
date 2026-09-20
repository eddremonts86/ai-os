#!/usr/bin/env bash
#
# Linux equivalent of llm/launchd/install-opencode.sh — same behavior (sandbox by
# default, password required, idempotent), via `systemctl --user` instead of launchd.
# Not exercised by any AI-OS CI job yet (Mac is the only machine this was built and
# tested on) — mirrors the launchd script's logic closely enough that it should work,
# but treat a first run here as a real test, not a known-good path.
#
#   bash llm/systemd/install-opencode.sh              # install + start, then prove it answers
#   bash llm/systemd/install-opencode.sh --status
#   bash llm/systemd/install-opencode.sh --uninstall

set -euo pipefail

UNIT="ai-os-opencode.service"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$HERE/../.." && pwd)"
TMPL="$HERE/$UNIT.tmpl"
TARGET_DIR="$HOME/.config/systemd/user"
TARGET="$TARGET_DIR/$UNIT"
URL="http://127.0.0.1:4096"
SANDBOX_DIR="$HOME/.ai-os/opencode-sandbox"
LOCAL_ENV_FILE="$HOME/.ai-os/opencode.env"
REPO_ENV_FILE="$AI_OS_ROOT/dev-env/env-config/.env"

log() { printf '[opencode] %s\n' "$*"; }

read_password() {
  local pw=""
  if [ -f "$REPO_ENV_FILE" ]; then
    pw="$(grep -m1 '^OPENCODE_SERVER_PASSWORD=' "$REPO_ENV_FILE" | cut -d= -f2-)"
  fi
  if [ -z "$pw" ] && [ -f "$LOCAL_ENV_FILE" ]; then
    pw="$(grep -m1 '^OPENCODE_SERVER_PASSWORD=' "$LOCAL_ENV_FILE" | cut -d= -f2-)"
  fi
  printf '%s' "$pw"
}

answers() {
  local pw; pw="$(read_password)"
  if [ -n "$pw" ]; then
    curl -sf -m 3 -u "opencode:$pw" "$URL/doc" >/dev/null 2>&1
  else
    curl -sf -m 3 "$URL/doc" >/dev/null 2>&1
  fi
}

case "${1:-install}" in
  --status)
    log "loaded:    $(systemctl --user is-enabled "$UNIT" >/dev/null 2>&1 && echo yes || echo NO)"
    log "answering: $(answers && echo "yes ($URL)" || echo "NO — nothing on 4096")"
    log "sandbox:   $SANDBOX_DIR"
    [ -n "$(read_password)" ] && log "password:  set" || log "password:  NOT SET — server is unsecured"
    exit 0
    ;;
  --uninstall)
    systemctl --user disable --now "$UNIT" 2>/dev/null || true
    rm -f "$TARGET"
    systemctl --user daemon-reload
    log "removed $TARGET"
    exit 0
    ;;
  install) ;;
  *) echo "unknown flag: $1 (try --status or --uninstall)" >&2; exit 2 ;;
esac

OPENCODE_BIN="$(command -v opencode || true)"
[ -n "$OPENCODE_BIN" ] || { echo "opencode is not installed (npm install -g opencode-ai)" >&2; exit 1; }
[ -f "$TMPL" ] || { echo "template not found at $TMPL" >&2; exit 1; }

mkdir -p "$TARGET_DIR" "$HOME/.ai-os" "$SANDBOX_DIR"

PASSWORD="$(read_password)"
if [ -z "$PASSWORD" ]; then
  PASSWORD="$(openssl rand -hex 32)"
  printf 'OPENCODE_SERVER_PASSWORD=%s\n' "$PASSWORD" >> "$LOCAL_ENV_FILE"
  chmod 600 "$LOCAL_ENV_FILE"
  log "generated a new password, stored at $LOCAL_ENV_FILE (chmod 600)"
fi

sed -e "s|__OPENCODE_BIN__|$OPENCODE_BIN|g" -e "s|__SANDBOX_DIR__|$SANDBOX_DIR|g" -e "s|__PASSWORD__|$PASSWORD|g" "$TMPL" > "$TARGET"
unset PASSWORD
log "wrote $TARGET (opencode at $OPENCODE_BIN, sandbox at $SANDBOX_DIR)"

systemctl --user daemon-reload
systemctl --user enable --now "$UNIT"

for _ in $(seq 1 20); do answers && break; sleep 1; done
answers || { echo "loaded but nothing answers on $URL — see: journalctl --user -u $UNIT" >&2; exit 1; }
log "up and answering on $URL (sandbox: $SANDBOX_DIR)"
