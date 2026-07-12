#!/usr/bin/env bash
# ai-os memory — CLI for the AI-OS memory stack (phase 1)
#
# Subcommands:
#   status              — show FalkorDB + Ollama + MCPs + node/edge counts
#   query "<question>"   — semantic search via grepai
#   reindex [path]        — refresh codebase-memory-mcp index over a project
#   browse               — open FalkorDB Web UI in default browser
#   start                — docker compose up -d
#   stop                 — docker compose down
#   logs                 — docker compose logs -f
#
# Usage: ai-os memory <subcommand> [args]
# Or:    bash memory/ai-os-memory.sh <subcommand> [args]

set -euo pipefail

# Resolve HOME and AI_OS_ROOT with safe fallbacks (works under `env -i` from MCP loaders).
# macOS has no `getent`; fall back to dscl / Python / hardcoded /Users/$USER.
if [ -z "${HOME:-}" ]; then
  _user="$(id -un 2>/dev/null || whoami 2>/dev/null || echo unknown)"
  # Try dscl (macOS Directory Service)
  HOME=$(dscl . -read /Users/"$_user" NFSHomeDirectory 2>/dev/null | awk '{print $2}') || true
  if [ -z "${HOME:-}" ]; then
    # Fall back to /Users/<user>
    HOME="/Users/$_user"
  fi
  if [ ! -d "$HOME" ]; then
    HOME="/tmp"  # last resort
  fi
fi
export HOME

# Ensure ~/.local/bin is on PATH so direct sub-commands (codebase-memory-mcp, grepai, ...)
# resolve even when the parent shell didn't add it (e.g. under `env -i`).
if [ -d "$HOME/.local/bin" ]; then
  case ":$PATH:" in
    *":$HOME/.local/bin:"*) : ;;  # already on PATH
    *) export PATH="$HOME/.local/bin:$PATH" ;;
  esac
fi
if [ -z "${AI_OS_ROOT:-}" ]; then
  # Walk up from this script to find CLAUDE.md (the AI-OS marker)
  _script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
  AI_OS_ROOT="$_script_dir"
  while [ "$AI_OS_ROOT" != "/" ] && [ ! -f "$AI_OS_ROOT/CLAUDE.md" ]; do
    AI_OS_ROOT="$(dirname "$AI_OS_ROOT")"
  done
  if [ ! -f "$AI_OS_ROOT/CLAUDE.md" ]; then
    AI_OS_ROOT="$HOME/Projects/ai-os"  # fallback
  fi
fi
export AI_OS_ROOT
MEMORY_DIR="$AI_OS_ROOT/memory/falkordb"
OLLAMA_URL="${OLLAMA_URL:-http://localhost:11500}"
FALKORDB_URL="${FALKORDB_URL:-redis://127.0.0.1:6390}"
FALKORDB_WEB="${FALKORDB_WEB:-http://127.0.0.1:3300}"

# Colors
if [ -t 1 ]; then
  R='\033[0m'; G='\033[32m'; Y='\033[33m'; B='\033[1m'; RED='\033[31m'
else
  R=''; G=''; Y=''; B=''; RED=''
fi

ok()   { echo -e "  ${G}✓${R} $*"; }
warn() { echo -e "  ${Y}!${R} $*"; }
err()  { echo -e "  ${RED}✗${R} $*" >&2; }
hdr()  { echo -e "\n${B}== $1 ==${R}"; }

sub_status() {
  hdr "AI-OS Memory Stack Status"

  # FalkorDB
  if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
    if docker ps --format '{{.Names}}' 2>/dev/null | grep -q '^aios-falkordb$'; then
      ok "FalkorDB container running (aios-falkordb)"
      if curl -s -m 3 "$FALKORDB_WEB/" -o /dev/null -w "%{http_code}" 2>/dev/null | grep -q "200\|302"; then
        ok "  Web UI  $FALKORDB_WEB"
      else
        warn "  Web UI  $FALKORDB_WEB not reachable"
      fi
      if command -v redis-cli >/dev/null 2>&1; then
        if redis-cli -p 6390 PING 2>/dev/null | grep -q PONG; then
          ok "  Redis  $FALKORDB_URL → PONG"
        else
          warn "  Redis  $FALKORDB_URL no PONG"
        fi
      elif command -v docker >/dev/null 2>&1; then
        # Fallback: PING via docker exec (no host redis-cli required)
        if docker exec aios-falkordb redis-cli -p 6379 PING 2>/dev/null | grep -q PONG; then
          ok "  Redis  $FALKORDB_URL → PONG (via docker exec)"
        else
          warn "  Redis  $FALKORDB_URL no PONG (docker exec failed)"
        fi
      else
        warn "  Redis  cannot verify (no redis-cli or docker)"
      fi
    else
      err "FalkorDB container NOT running (run: ai-os memory start)"
    fi

    # Graphiti MCP (P0-3 decision: separate opt-in compose, not started by
    # `ai-os memory start` — needs OPENAI_API_KEY and has not been
    # smoke-tested yet; see memory/graphiti/docker-compose.yml)
    if docker ps --format '{{.Names}}' 2>/dev/null | grep -q '^aios-graphiti-mcp$'; then
      ok "Graphiti MCP container running (aios-graphiti-mcp)"
      if curl -s -m 3 "http://127.0.0.1:8021/health" -o /dev/null -w "%{http_code}" 2>/dev/null | grep -q "200"; then
        ok "  HTTP  http://127.0.0.1:8021/mcp/"
      else
        warn "  HTTP  http://127.0.0.1:8021/health not reachable"
      fi
    else
      warn "Graphiti MCP container not running (optional, disabled — cd memory/graphiti && docker compose up -d)"
    fi
  else
    warn "Docker not running"
  fi

  # Ollama
  if command -v ollama >/dev/null 2>&1 && pgrep -f "ollama serve" >/dev/null 2>&1; then
    ok "Ollama serve running"
    if curl -s -m 3 "$OLLAMA_URL/api/tags" -o /dev/null -w "%{http_code}" 2>/dev/null | grep -q "200"; then
      ok "  API  $OLLAMA_URL"
    else
      warn "  API  $OLLAMA_URL not reachable"
    fi
    if OLLAMA_HOST=127.0.0.1:11500 ollama list 2>/dev/null | grep -q "nomic-embed-text"; then
      ok "  model nomic-embed-text ready"
    else
      warn "  model nomic-embed-text not pulled"
    fi
  else
    warn "Ollama not running"
  fi

  # MCP binaries
  for bin in codebase-memory-mcp grepai; do
    if [ -x "$HOME/.local/bin/$bin" ]; then
      ok "$bin binary"
    else
      warn "$bin not installed"
    fi
  done

  # MCPs in config
  if [ -f "$HOME/.hermes/config.yaml" ] && command -v yq >/dev/null 2>&1; then
    hdr "MCP servers (ai-os memory-related)"
    for name in codebase-memory-mcp grepai memory; do
      enabled=$(yq ".mcp_servers.${name}.command // \"\"" "$HOME/.hermes/config.yaml" 2>/dev/null)
      if [ -n "$enabled" ]; then
        ok "$name → $enabled"
      else
        warn "$name not in config"
      fi
    done
  fi
}

sub_browse() {
  hdr "Opening FalkorDB Web UI"
  echo "  URL: $FALKORDB_WEB"
  if command -v open >/dev/null 2>&1; then
    open "$FALKORDB_WEB"
    ok "Browser opened"
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$FALKORDB_WEB"
    ok "Browser opened"
  else
    warn "no \`open\` command available; copy URL above"
  fi
}

sub_visualize() {
  hdr "Opening all available memory-stack browsers"
  echo ""

  # 1. FalkorDB Web UI (always reachable if container is up)
  if curl -sI -m 2 "$FALKORDB_WEB/" -o /dev/null -w "%{http_code}" 2>/dev/null | grep -q "200"; then
    echo "  1) FalkorDB graph DB:  $FALKORDB_WEB  → reachable"
    if command -v open >/dev/null 2>&1; then
      open "$FALKORDB_WEB" 2>/dev/null
      ok "  FalkorDB opened in browser"
    fi
  else
    warn "  1) FalkorDB graph DB:  $FALKORDB_WEB  → NOT reachable (run: ai-os memory start)"
  fi
  echo ""

  # 2. codebase-memory-mcp UI (only when daemon is running with --ui=true)
  if curl -sI -m 2 "http://localhost:9749/" -o /dev/null -w "%{http_code}" 2>/dev/null |grep -q "200"; then
    echo "  2) codebase-memory-mcp graph:  http://localhost:9749  → reachable"
    if command -v open >/dev/null 2>&1; then
      open "http://localhost:9749/" 2>/dev/null
      ok "  codebase-memory-mcp opened in browser"
    fi
  else
    echo "  2) codebase-memory-mcp graph:  http://localhost:9749  → NOT reachable"
    echo "     tip: open 'hermes chat --skills ai-os-memory' in another terminal"
    echo "           the cbm daemon runs as a thread of the MCP server, then :9749 binds"
  fi
  echo ""

  # 3. grepai runtime check (no browser UI; surface status + how to use)
  if pgrep -fl "grepai.*watch" >/dev/null 2>&1; then
    echo "  3) grepai:               daemon running (semantic search via terminal)"
    pgrep -fl "grepai.*watch" | sed 's/^/        /'
  else
    echo "  3) grepai:               daemon NOT running (start with: ai-os memory search <query>)"
  fi
  echo ""

  ok "visualize complete"
}

sub_search() {
  if [ -z "${1:-}" ]; then
    err "usage: ai-os memory search \"<query>\" [path]"
    err "       (semantic search via grepai; daemon-less fallback via cbm if grepai watch is not running)"
    return 1
  fi
  local q="$1"
  local target="${2:-$HOME/Projects}"
  hdr "Semantic search: \"$q\""
  echo "  target: $target"
  echo ""

  # Tier 1 — grepai (if a watch daemon is running)
  if pgrep -fl "grepai.*watch" >/dev/null 2>&1; then
    echo "  → grepai (live watch daemon):"
    cd "$target"
    grepai search "$q" --limit 10 2>&1 | sed 's/^/    /' || warn "  grepai search returned non-zero"
    return 0
  fi

  # Tier 2 — codebase-memory-mcp (always available, but only knows indexed repos).
  # search_code tool schema (verified): {"pattern": "...", "project": "...", "limit": N}
  echo "  → codebase-memory-mcp (search_code tool):"
  # Pick the most-recently-touched indexed project that matches $target by basename
  local project_idx
  project_idx=$(codebase-memory-mcp cli list_projects '{}' 2>/dev/null \
    | grep -oE '"Users-edd[^"]+"' | head -1 | tr -d '"')
  if [ -z "$project_idx" ]; then
    warn "  no indexed projects found — run: ai-os memory reindex <path>"
    return 0
  fi
  local payload
  payload=$(python3 -c "
import json,sys
print(json.dumps({'pattern': sys.argv[1], 'project': sys.argv[2], 'limit': 10}))
" "$q" "$project_idx" 2>/dev/null) || payload="{\"pattern\":\"$q\",\"project\":\"$project_idx\",\"limit\":10}"
  codebase-memory-mcp cli search_code "$payload" 2>&1 | grep -v "^level=info" | sed 's/^/    /' | head -25
  echo ""
  warn "grepai daemon not running — start one for richer semantic search:"
  echo "    cd $target && grepai watch &"
  return 0
}


sub_start() {
  hdr "Starting FalkorDB"
  cd "$MEMORY_DIR"
  if docker compose version >/dev/null 2>&1; then
    docker compose up -d
  else
    docker-compose up -d
  fi
  ok "FalkorDB started"
  sub_status
}

sub_stop() {
  hdr "Stopping FalkorDB"
  cd "$MEMORY_DIR"
  if docker compose version >/dev/null 2>&1; then
    docker compose down
  else
    docker-compose down
  fi
  ok "FalkorDB stopped (data preserved in ./data)"
}

sub_logs() {
  cd "$MEMORY_DIR"
  if docker compose version >/dev/null 2>&1; then
    docker compose logs -f
  else
    docker-compose logs -f
  fi
}

sub_query() {
  if [ -z "${1:-}" ]; then
    err "usage: ai-os memory query \"<question>\""
    exit 1
  fi
  local q="$1"
  hdr "Semantic query via grepai"
  echo "  q: $q"
  echo ""
  if ! command -v grepai >/dev/null 2>&1; then
    err "grepai not installed (run: bash $AI_OS_ROOT/setup/install-mac.sh)"
    exit 1
  fi
  cd "${2:-$HOME/Projects}"
  if ! grepai search "$q" 2>&1; then
    err "grepai search failed"
    exit 1
  fi
}

sub_reindex() {
  local target="${1:-$HOME/Projects}"
  hdr "Indexing via codebase-memory-mcp (tool: index_repository)"
  echo "  target: $target"

  # Pre-flight
  if ! command -v codebase-memory-mcp >/dev/null 2>&1; then
    err "codebase-memory-mcp not installed (run: bash $AI_OS_ROOT/setup/install-mac.sh)"
    return 1
  fi
  if [ ! -d "$target" ]; then
    err "target directory does not exist: $target"
    return 1
  fi

  # Step 1 — call the MCP tool `index_repository` via the `cli` subcommand.
  # The tool expects JSON args: {"repo_path": "/path/to/repo"} (NOT "path").
  # See `codebase-memory-mcp --help` for the tool list.
  local payload
  payload=$(printf '{"repo_path":"%s"}' "$target")
  echo "  → codebase-memory-mcp cli index_repository ..."
  if ! codebase-memory-mcp cli index_repository "$payload" 2>&1 | sed 's/^/    /'; then
    err "index_repository failed (non-zero exit)"
    return 1
  fi

  # Step 2 — confirm with index_status
  echo ""
  echo "  → index_status:"
  codebase-memory-mcp cli index_status '{}' 2>&1 | sed 's/^/    /'

  # Step 3 — list_projects so the user sees what's indexed
  echo ""
  echo "  → list_projects:"
  codebase-memory-mcp cli list_projects '{}' 2>&1 | sed 's/^/    /'
  ok "indexed $target"
  return 0
}

# Main
case "${1:-}" in
  status)        sub_status ;;
  browse)        sub_browse ;;
  visualize)     sub_visualize ;;
  start)         sub_start ;;
  stop)          sub_stop ;;
  logs)          sub_logs ;;
  query)         shift; sub_query "$@" ;;
  search)        shift; sub_search "$@" ;;
  reindex)        shift; sub_reindex "$@" ;;
  help|--help|-h|"")
    cat <<EOF
ai-os memory — CLI for the AI-OS memory stack (phase 1)

Usage: ai-os memory <subcommand> [args]

Subcommands:
  status              Show FalkorDB + Ollama + MCPs + node/edge counts (colored)
  visualize           Open FalkorDB UI + cbm UI (if daemon running) + grepai status
  browse              Open FalkorDB Web UI in default browser
  start               Start FalkorDB container (docker compose up -d)
  stop                Stop FalkorDB container (data preserved)
  logs                Tail FalkorDB logs
  query "<q>" [path]  Semantic search via grepai
  search "<q>" [path] Same as query, but falls back to cbm if grepai not running
  reindex [path]      Refresh codebase-memory-mcp index
Environment (override via env):
  FALKORDB_URL=redis://127.0.0.1:6390
  FALKORDB_WEB=http://127.0.0.1:3300
  OLLAMA_URL=http://localhost:11500

Ports are intentionally OUTSIDE 3000-3050 to avoid conflicts.
EOF
    ;;
  *)
    err "Unknown subcommand: $1 (try: ai-os memory help)"
    exit 1
    ;;
esac
