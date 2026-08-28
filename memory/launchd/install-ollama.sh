#!/usr/bin/env bash
#
# Install (or repair) the Ollama service the AI-OS memory stack talks to.
#
#   bash memory/launchd/install-ollama.sh            # install + load, then prove it answers
#   bash memory/launchd/install-ollama.sh --status    # loaded? listening? model pulled?
#   bash memory/launchd/install-ollama.sh --uninstall
#
# Why not `brew services start ollama`: Homebrew's plist does not set OLLAMA_HOST, so it
# binds Ollama's default 11434 while the whole stack addresses 11500. See the template.

set -euo pipefail

LABEL="ai.os.ollama"
DOMAIN="gui/$(id -u)"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMPL="$HERE/$LABEL.plist.tmpl"
TARGET="$HOME/Library/LaunchAgents/$LABEL.plist"
URL="http://127.0.0.1:11500"
MODEL="nomic-embed-text"

log() { printf '[ollama] %s\n' "$*"; }

loaded() { launchctl print "$DOMAIN/$LABEL" >/dev/null 2>&1; }

# Readiness means "the API answers", not "the port is open" and certainly not a string
# match against /api/tags. ai-os-bootstrap.sh polled that endpoint for `PONG` — a Redis
# reply that /api/tags cannot ever return — so its wait loop always timed out in silence
# and it printed "Ollama ready" anyway.
answers() { curl -sf -m 3 "$URL/api/tags" >/dev/null 2>&1; }

has_model() { curl -sf -m 5 "$URL/api/tags" 2>/dev/null | grep -q "$MODEL"; }

case "${1:-install}" in
  --status)
    log "loaded:    $(loaded && echo yes || echo NO)"
    log "answering: $(answers && echo "yes ($URL)" || echo "NO — nothing on 11500")"
    log "$MODEL:    $(has_model && echo present || echo MISSING)"
    if answers; then
      curl -s "$URL/api/tags" | python3 -c 'import sys,json;[print("[ollama]   model:",m["name"]) for m in json.load(sys.stdin)["models"]]' 2>/dev/null || true
    fi
    # A stray server on the default port is the failure this whole file prevents, and it
    # looks like success to anyone checking `pgrep ollama`.
    if curl -sf -m 2 http://127.0.0.1:11434/api/tags >/dev/null 2>&1; then
      log "WARNING: something is also serving 11434 — the stack does not read that port"
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

OLLAMA_BIN="$(command -v ollama || true)"
[ -n "$OLLAMA_BIN" ] || { echo "ollama is not installed (brew install ollama)" >&2; exit 1; }
[ -f "$TMPL" ] || { echo "template not found at $TMPL" >&2; exit 1; }

mkdir -p "$HOME/Library/LaunchAgents" "$HOME/.ollama"

tmp=$(mktemp -t aios-ollama-plist-XXXX)
sed -e "s|__OLLAMA_BIN__|$OLLAMA_BIN|g" -e "s|__HOME__|$HOME|g" "$TMPL" > "$tmp"
plutil -lint "$tmp" >/dev/null || { rm -f "$tmp"; echo "rendered plist is malformed — refusing to install" >&2; exit 1; }
mv "$tmp" "$TARGET"
log "wrote $TARGET (ollama at $OLLAMA_BIN)"

# Any hand-started `ollama serve` already holds the port, and launchd's copy would then
# fail to bind and thrash under KeepAlive.
if answers && ! loaded; then
  log "a server is already on 11500 outside launchd — stopping it so the service can bind"
  pkill -f 'ollama serve' 2>/dev/null || true
  for _ in 1 2 3 4 5; do answers || break; sleep 1; done
fi

launchctl bootout "$DOMAIN/$LABEL" 2>/dev/null || true
launchctl bootstrap "$DOMAIN" "$TARGET"

for _ in $(seq 1 20); do answers && break; sleep 1; done
answers || { echo "loaded but nothing answers on $URL — see $HOME/.ollama/ai-os-ollama.log" >&2; exit 1; }
log "up and answering on $URL"

if ! has_model; then
  log "pulling $MODEL (one-time, ~250MB)"
  OLLAMA_HOST=127.0.0.1:11500 ollama pull "$MODEL"
fi
has_model || { echo "$MODEL is still missing after the pull" >&2; exit 1; }
log "$MODEL present — embeddings ready"
