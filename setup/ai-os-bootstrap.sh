#!/usr/bin/env bash
# ai-os-bootstrap.sh — first-time / on-demand setup of the AI-OS memory stack
#
# What it does (in order, all idempotent):
#   1. Verify Docker is running
#   2. Read dev-env/env-config/.env for MINIMAX_API_KEY (handed to compose via --env-file)
#   3. Start FalkorDB (ia-os-falkordb) via memory/docker-compose.yml (unified)
#   4. Start Graphiti MCP (ia-os-graphiti-mcp) if MINIMAX_API_KEY is set
#   5. Ensure Ollama is running (start brew service on Mac, pull nomic-embed-text)
#   6. Auto-index every project under ~/Projects/ via codebase-memory-mcp
#      - skips dirs without .git/ (not a code project)
#      - skips ai-os itself (the toolchain)
#      - skips projects already indexed unless --refresh
#
# Usage:
#   bash setup/ai-os-bootstrap.sh              # index missing only
#   bash setup/ai-os-bootstrap.sh --refresh    # reindex everything
#   bash setup/ai-os-bootstrap.sh --only-start  # skip indexing, just start stack
#   bash setup/ai-os-bootstrap.sh --only-index  # skip stack start, just index
#
# Re-runnable any time. The cron at memory/cron-reindex.sh handles the 6x/day refresh.

set -euo pipefail

# ─── Resolve paths ────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="${HOME:-$(dscl . -read /Users/"$(id -un)" NFSHomeDirectory 2>/dev/null | awk '{print $2}')}"
[ -z "$HOME_DIR" ] && HOME_DIR="/Users/$(id -un)"
PROJECTS_DIR="$HOME_DIR/Projects"
LOG_DIR="$AI_OS_ROOT/memory/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/bootstrap-$(date +%Y-%m-%d-%H%M%S).log"

# ─── Colors (TTY-aware) ──────────────────────────────────────────────────────
if [ -t 1 ]; then
  R='\033[0m'; G='\033[32m'; Y='\033[33m'; B='\033[1m'; RED='\033[31m'; C='\033[36m'
else
  R=''; G=''; Y=''; B=''; RED=''; C=''
fi
ok()    { echo -e "  ${G}✓${R} $*"; }
warn()  { echo -e "  ${Y}!${R} $*"; }
err()   { echo -e "  ${RED}✗${R} $*" >&2; }
hdr()   { echo -e "\n${B}${C}== $1 ==${R}"; }
note()  { echo -e "  ${C}→${R} $*"; }

# ─── Args ─────────────────────────────────────────────────────────────────────
REFRESH=0
ONLY_START=0
ONLY_INDEX=0
for arg in "$@"; do
  case "$arg" in
    --refresh)    REFRESH=1 ;;
    --only-start) ONLY_START=1 ;;
    --only-index) ONLY_INDEX=1 ;;
    -h|--help)
      sed -n '2,21p' "$0" | sed 's/^# \{0,1\}//'
      exit 0
      ;;
    *) err "unknown arg: $arg (try --help)"; exit 1 ;;
  esac
done

# ─── Pre-flight ───────────────────────────────────────────────────────────────
hdr "AI-OS bootstrap $(date -Iseconds)"

if ! command -v docker >/dev/null 2>&1; then
  err "docker not found in PATH"
  exit 1
fi
if ! docker info >/dev/null 2>&1; then
  err "docker daemon not running (start Docker Desktop / colima / etc.)"
  exit 1
fi
ok "docker reachable"

# Credentials live in the canonical merged local env file (context/04_tools.md). This used to
# source ~/Projects/configs/env.ts, which no longer exists, so Graphiti was skipped on every
# run behind a warning nobody read. Compose reads the file itself via --env-file: nothing is
# sourced into this shell, so a value holding shell metacharacters cannot execute here.
ENV_FILE="$AI_OS_ROOT/dev-env/env-config/.env"
GRAPHITI_ENV_ARGS=()
if [ -f "$ENV_FILE" ] && grep -qE '^(export )?MINIMAX_API_KEY=.+' "$ENV_FILE"; then
  GRAPHITI_ENV_ARGS=(--env-file "$ENV_FILE")
  ok "MINIMAX_API_KEY present in dev-env/env-config/.env"
else
  warn "MINIMAX_API_KEY missing from dev-env/env-config/.env (Graphiti will be skipped)"
fi

# ─── Stack: FalkorDB ──────────────────────────────────────────────────────────
COMPOSE_FILE="$AI_OS_ROOT/memory/docker-compose.yml"
COMPOSE_DIR="$AI_OS_ROOT/memory"
OLLAMA_DATA_DIR="$COMPOSE_DIR/falkordb/ollama-data"

start_falkordb() {
  hdr "FalkorDB"
  local up_args=""
  if [ -d "$OLLAMA_DATA_DIR" ]; then
    up_args="--profile ollama-docker"
  fi
  # `docker compose -f $COMPOSE_FILE up -d` (no service name) brings up every
  # service defined in the unified compose EXCEPT opt-in profiles, which is
  # the right default: falkordb + graphiti-mcp come up; ollama stays skipped
  # unless the user passed --profile ollama-docker.
  if docker compose -f "$COMPOSE_FILE" $up_args up -d 2>&1 | sed 's/^/    /'; then
    : # docker compose up -d succeeded
  else
    err "docker compose up -d failed"
    return 1
  fi
  # Wait for the healthcheck to flip to healthy (max 30s)
  note "waiting for ia-os-falkordb healthcheck (max 30s)"
  for i in $(seq 1 30); do
    if docker exec ia-os-falkordb redis-cli -p 6379 PING 2>/dev/null | grep -q PONG; then
      ok "ia-os-falkordb healthy (PONG received)"
      return 0
    fi
    sleep 1
  done
  err "ia-os-falkordb healthcheck did not flip in 30s (check: docker logs ia-os-falkordb)"
  return 1
}

# ─── Stack: Graphiti (opt-in) ─────────────────────────────────────────────────
start_graphiti() {
  if [ ${#GRAPHITI_ENV_ARGS[@]} -eq 0 ]; then
    warn "Graphiti skipped (no MINIMAX_API_KEY)"
    return 0
  fi
  hdr "Graphiti MCP (opt-in)"
  if docker compose "${GRAPHITI_ENV_ARGS[@]}" -f "$COMPOSE_FILE" up -d graphiti-mcp 2>&1 | sed 's/^/    /'; then
    : # ok
  else
    err "docker compose up -d failed for graphiti"
    return 1
  fi
  for i in $(seq 1 30); do
    if curl -sf -m 2 http://127.0.0.1:8021/health 2>/dev/null | grep -q healthy; then
      ok "ia-os-graphiti-mcp healthy"
      return 0
    fi
    sleep 1
  done
  err "ia-os-graphiti-mcp did not become healthy in 30s"
  return 1
}

# ─── Stack: Ollama (host-native on Mac) ──────────────────────────────────────
#
# Not a Docker service on Mac: a container cannot reach the Metal GPU, so
# memory/docker-compose.yml keeps its `ollama` service behind the opt-in `ollama-docker`
# profile (Windows) and Mac runs it on the host. Two containers plus a host process is the
# correct shape here, not three containers.
#
# Delegates to memory/launchd/install-ollama.sh rather than `brew services start ollama`:
# Homebrew's plist sets OLLAMA_FLASH_ATTENTION and OLLAMA_KV_CACHE_TYPE but NOT
# OLLAMA_HOST, so the brew service binds Ollama's default 11434 while every consumer in
# this stack addresses 11500. It looked started and was invisible to all of them.
ensure_ollama() {
  hdr "Ollama"
  local url="${OLLAMA_URL:-http://localhost:11500}"

  # Readiness is "the API answers", checked with curl's own exit status. This block used to
  # poll /api/tags for the string `PONG` — a Redis reply that endpoint cannot return — so
  # the wait always timed out silently and the function reported ready regardless.
  if curl -sf -m 3 "$url/api/tags" >/dev/null 2>&1 \
     && curl -sf -m 5 "$url/api/tags" 2>/dev/null | grep -q "nomic-embed-text"; then
    ok "Ollama up on :11500 and nomic-embed-text pulled"
    return 0
  fi

  local installer="$AI_OS_ROOT/memory/launchd/install-ollama.sh"
  if [ "$(uname -s)" = "Darwin" ] && command -v ollama >/dev/null 2>&1 && [ -f "$installer" ]; then
    note "Ollama not answering on :11500; installing the launchd service"
    if bash "$installer" 2>&1 | sed 's/^/    /'; then
      ok "Ollama ready"
      return 0
    fi
    warn "could not bring Ollama up — semantic search and graphiti embeddings are unavailable"
    return 0
  fi

  warn "Ollama not running and no native install detected (skipping; semantic search will be unavailable)"
  return 0
}

# ─── Indexing: discover + index ───────────────────────────────────────────────
# Returns a list of project root paths to attempt. Filters:
#   - must contain a .git/ directory (we only index code projects)
#   - must be a direct child of ~/Projects/ OR a grandchild (~/Projects/eddremonts86/builderhunt/)
#   - skips the AI-OS root itself (no point indexing the indexer)
#   - skips ~/Projects/configs (secrets, not code)
discover_projects() {
  local d
  # Level 1: ~/Projects/<name>/
  for d in "$PROJECTS_DIR"/*/; do
    [ -d "$d.git" ] || continue
    case "$d" in
      "$PROJECTS_DIR/ai-os/"|"$PROJECTS_DIR/configs/") continue ;;
    esac
    echo "$d"
  done
  # Level 2: ~/Projects/<group>/<name>/
  for d in "$PROJECTS_DIR"/*/*/; do
    [ -d "$d.git" ] || continue
    case "$d" in
      "$PROJECTS_DIR/ai-os/"*) continue ;;  # skip everything under ai-os
    esac
    echo "$d"
  done
}

# Returns the indexed project name for a given path, or empty if not indexed.
# Uses codebase-memory-mcp's list_projects (matches root_path exactly, or the
# canonical 'path/with-dashes' name the tool derives from the path).
indexed_name_for() {
  local target="$1"
  codebase-memory-mcp cli list_projects '{}' 2>/dev/null \
    | python3 -c "
import json, sys
try:
    d = json.loads(sys.stdin.read())
except Exception:
    sys.exit(0)
target = sys.argv[1].rstrip('/')
for p in d.get('projects', []):
    if p.get('root_path', '').rstrip('/') == target:
        print(p['name']); sys.exit(0)
sys.exit(0)
" "$target"
}

index_all() {
  hdr "Auto-index projects under $PROJECTS_DIR"
  if ! command -v codebase-memory-mcp >/dev/null 2>&1; then
    err "codebase-memory-mcp not installed (run: bash ~/Projects/ai-os/setup/install-mac.sh)"
    return 1
  fi

  local projects_total=0 projects_indexed=0 projects_skipped=0 projects_failed=0
  local paths=()
  while IFS= read -r p; do
    [ -n "$p" ] && paths+=("$p")
  done < <(discover_projects)

  note "discovered ${#paths[@]} candidate project(s) with .git/"

  for path in "${paths[@]}"; do
    projects_total=$((projects_total + 1))
    local label="${path#$PROJECTS_DIR/}"
    label="${label%/}"

    if [ "$REFRESH" -eq 0 ] && [ -n "$(indexed_name_for "$path")" ]; then
      note "  $label — already indexed, skipping (use --refresh to force)"
      projects_skipped=$((projects_skipped + 1))
      continue
    fi

    if codebase-memory-mcp cli index_repository "$(printf '{"repo_path":"%s"}' "$path")" 2>&1 \
        | grep -v "^level=info" \
        | sed 's/^/      /' \
        | grep -q '"status":"indexed"'; then
      ok "  $label — indexed"
      projects_indexed=$((projects_indexed + 1))
    else
      err "  $label — index failed"
      projects_failed=$((projects_failed + 1))
    fi
  done

  hdr "Indexing summary"
  ok "$projects_indexed indexed, $projects_skipped skipped, $projects_failed failed (of $projects_total discovered)"
  [ "$projects_failed" -gt 0 ] && return 1
  return 0
}

# ─── Run ──────────────────────────────────────────────────────────────────────
START_TS=$(date +%s)

if [ "$ONLY_INDEX" -eq 0 ]; then
  start_falkordb
  start_graphiti
  ensure_ollama
fi

if [ "$ONLY_START" -eq 0 ]; then
  index_all
fi

ELAPSED=$(( $(date +%s) - START_TS ))
hdr "Bootstrap complete in ${ELAPSED}s"
note "log: $LOG_FILE"
note "status: bash $AI_OS_ROOT/memory/ai-os-memory.sh status"
note "UIs: FalkorDB http://127.0.0.1:3300 · codebase-memory-mcp http://localhost:9749 (if daemon UI running)"

# Tee the whole run to the log
{
  echo "exit=$?  duration=${ELAPSED}s  refresh=$REFRESH  only_start=$ONLY_START  only_index=$ONLY_INDEX"
} >> "$LOG_FILE" 2>&1 || true
