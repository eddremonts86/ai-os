#!/usr/bin/env bash
#
# Install (or repair) the opencode headless server as a real service — the tool-use
# harness for llm/router.mjs's "local" provider (Qwen3-8B via the native Ollama daemon).
#
#   bash llm/launchd/install-opencode.sh              # install + load, then prove it answers
#   bash llm/launchd/install-opencode.sh --status     # loaded? listening?
#   bash llm/launchd/install-opencode.sh --uninstall
#
# Serves a disposable sandbox directory by default, not this repo — see the plist
# template's comment for why.

set -euo pipefail

LABEL="ai.os.opencode"
DOMAIN="gui/$(id -u)"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$HERE/../.." && pwd)"
TMPL="$HERE/$LABEL.plist.tmpl"
TARGET="$HOME/Library/LaunchAgents/$LABEL.plist"
URL="http://127.0.0.1:4096"
SANDBOX_DIR="$HOME/.ai-os/opencode-sandbox"
# Machine-local fallback secret store — used when this repo's merged .env isn't
# present (e.g. llm/ used standalone on another machine), so install stays
# reproducible without the full AI-OS env system.
LOCAL_ENV_FILE="$HOME/.ai-os/opencode.env"
REPO_ENV_FILE="$AI_OS_ROOT/dev-env/env-config/.env"

log() { printf '[opencode] %s\n' "$*"; }

loaded() { launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1; }

# Resolve OPENCODE_SERVER_PASSWORD: prefer this repo's canonical merged .env
# (never printed — see rules/always_do.md), then the machine-local fallback
# file. Read-only — does not generate, so --status/--uninstall stay side-effect-free.
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

# Auth-aware health check — /doc requires OPENCODE_SERVER_PASSWORD once set, so an
# unauthenticated probe would read a healthy password-protected server as down.
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
    log "loaded:    $(loaded && echo yes || echo NO)"
    log "answering: $(answers && echo "yes ($URL)" || echo "NO — nothing on 4096")"
    log "sandbox:   $SANDBOX_DIR"
    if [ -n "$(read_password)" ]; then
      if [ -f "$REPO_ENV_FILE" ] && grep -q '^OPENCODE_SERVER_PASSWORD=' "$REPO_ENV_FILE"; then
        log "password:  set (from $REPO_ENV_FILE)"
      else
        log "password:  set (from $LOCAL_ENV_FILE)"
      fi
    else
      log "password:  NOT SET — server is unsecured"
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

OPENCODE_BIN="$(command -v opencode || true)"
[ -n "$OPENCODE_BIN" ] || { echo "opencode is not installed (npm install -g opencode-ai)" >&2; exit 1; }
[ -f "$TMPL" ] || { echo "template not found at $TMPL" >&2; exit 1; }

mkdir -p "$HOME/Library/LaunchAgents" "$HOME/.ai-os" "$SANDBOX_DIR"

PASSWORD="$(read_password)"
if [ -z "$PASSWORD" ]; then
  PASSWORD="$(openssl rand -hex 32)"
  printf 'OPENCODE_SERVER_PASSWORD=%s\n' "$PASSWORD" >> "$LOCAL_ENV_FILE"
  chmod 600 "$LOCAL_ENV_FILE"
  log "generated a new password, stored at $LOCAL_ENV_FILE (chmod 600)"
fi

tmp=$(mktemp -t aios-opencode-plist-XXXX)
sed -e "s|__OPENCODE_BIN__|$OPENCODE_BIN|g" -e "s|__HOME__|$HOME|g" -e "s|__SANDBOX_DIR__|$SANDBOX_DIR|g" -e "s|__PASSWORD__|$PASSWORD|g" "$TMPL" > "$tmp"
unset PASSWORD
plutil -lint "$tmp" >/dev/null || { rm -f "$tmp"; echo "rendered plist is malformed — refusing to install" >&2; exit 1; }
mv "$tmp" "$TARGET"
log "wrote $TARGET (opencode at $OPENCODE_BIN, sandbox at $SANDBOX_DIR)"

# Any hand-started `opencode serve` already holds the port, and launchd's copy would
# then fail to bind and thrash under KeepAlive.
if answers && ! loaded; then
  log "a server is already on 4096 outside launchd — stopping it so the service can bind"
  pkill -f 'opencode serve' 2>/dev/null || true
  for _ in 1 2 3 4 5; do answers || break; sleep 1; done
fi

launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
sleep 1
launchctl bootstrap "$DOMAIN" "$TARGET"

for _ in $(seq 1 20); do answers && break; sleep 1; done
answers || { echo "loaded but nothing answers on $URL — see $HOME/.ai-os/opencode.log" >&2; exit 1; }
log "up and answering on $URL (sandbox: $SANDBOX_DIR)"
