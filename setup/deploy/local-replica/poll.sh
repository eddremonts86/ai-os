#!/usr/bin/env bash
#
# Keep the local Coolify replicas level with `dev`.
#
#   bash setup/deploy/local-replica/poll.sh              # one pass
#   bash setup/deploy/local-replica/poll.sh --dry-run    # decide, print, deploy nothing
#   bash setup/deploy/local-replica/poll.sh --deploy-all # ignore state, deploy every app once
#   bash setup/deploy/local-replica/poll.sh --status     # what it knows, without asking GitHub
#
# Why a poller and not a webhook or an Action: a GitHub-hosted runner cannot
# reach this Mac, and a webhook would need the local Coolify exposed to the
# internet. A poller needs neither, and a Mac that was asleep simply deploys on
# waking instead of losing the event.
#
# Production is NOT this script's business. Each repo's own workflow deploys
# production on a push to its production branch.
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

HERE="$AI_OS_ROOT/setup/deploy/local-replica"
CONF="$HERE/apps.conf"
STATE="$HERE/state.json"
ENV_FILE="$AI_OS_ROOT/dev-env/env-config/.env"

MODE="${1:-run}"

log() { printf '[local-replica] %s\n' "$*"; }

# --- credentials ------------------------------------------------------------
# The local Coolify is a different instance from production and needs its own
# token. COOLIFY_API_URL/COOLIFY_API_TOKEN point at the Hetzner box; using them
# here would deploy production every time `dev` moved.
#
# Two keys are read by name rather than sourcing the file. Sourcing it broke
# outright — one line in there is not a shell assignment and `.` tried to run it
# as a command — and, worse, it would have pulled the PRODUCTION token into this
# script's environment, which is the one thing it must never hold.
env_value() {
  [ -f "$ENV_FILE" ] || return 0
  sed -n "s/^$1=//p" "$ENV_FILE" | head -1 | tr -d "\"'\r"
}
URL="${COOLIFY_LOCAL_API_URL:-$(env_value COOLIFY_LOCAL_API_URL)}"
URL="${URL:-http://localhost:8000}"
TOKEN="${COOLIFY_LOCAL_API_TOKEN:-$(env_value COOLIFY_LOCAL_API_TOKEN)}"

if [ "$MODE" != "--status" ] && [ -z "$TOKEN" ]; then
  cat >&2 <<EOF
[local-replica] COOLIFY_LOCAL_API_TOKEN is not set.

  Create one in the local Coolify (http://localhost:8000 → Keys & Tokens →
  API tokens) and add these two lines to
  $ENV_FILE

      COOLIFY_LOCAL_API_URL=http://localhost:8000
      COOLIFY_LOCAL_API_TOKEN=<the token>

  Refusing to guess: the production token is in the same file, and a wrong
  guess here redeploys production on every push to dev.
EOF
  exit 1
fi

# --- state ------------------------------------------------------------------
[ -f "$STATE" ] || echo '{}' > "$STATE"

state_get() { node -e '
  const fs=require("fs");
  const s=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));
  process.stdout.write(s[process.argv[2]] ?? "");
' "$STATE" "$1"; }

state_set() { node -e '
  const fs=require("fs");
  const s=JSON.parse(fs.readFileSync(process.argv[1],"utf8"));
  s[process.argv[2]]=process.argv[3];
  fs.writeFileSync(process.argv[1], JSON.stringify(s,null,2)+"\n");
' "$STATE" "$1" "$2"; }

if [ "$MODE" = "--status" ]; then
  log "config:  $CONF"
  log "state:   $STATE"
  log "coolify: $URL  (token $([ -n "$TOKEN" ] && echo present || echo MISSING))"
  echo
  printf '%-24s %-36s %-8s %s\n' APP REPO BRANCH 'LAST DEPLOYED'
  while read -r app repo branch; do
    case "${app:-}" in ''|\#*) continue ;; esac
    sha="$(state_get "$app")"
    printf '%-24s %-36s %-8s %s\n' "$app" "$repo" "$branch" "${sha:0:12}${sha:+ }"
  done < "$CONF"
  exit 0
fi

# --- resolve names to uuids, once per pass ----------------------------------
# By name, never from a stored uuid: one Coolify hosts many apps and a stale
# uuid deploys to somebody else's, successfully and silently.
apps_json="$(curl -fsS --max-time 20 -H "Authorization: Bearer $TOKEN" \
  -H 'Accept: application/json' "${URL%/}/api/v1/applications")" || {
  log "cannot reach the local Coolify at $URL — is it running?"; exit 1; }

uuid_for() { printf '%s' "$apps_json" | node -e '
  let d="";process.stdin.on("data",c=>d+=c).on("end",()=>{
    const want=process.argv[1];
    let list=[];try{list=JSON.parse(d)}catch{}
    if(!Array.isArray(list)) list=list.data||[];
    const hit=list.find(a=>a && a.name===want);
    process.stdout.write(hit&&hit.uuid?hit.uuid:"");
  });
' "$1"; }

# --- one pass ---------------------------------------------------------------
declare -a triggered=()
while read -r app repo branch; do
  case "${app:-}" in ''|\#*) continue ;; esac

  remote="$(git ls-remote "https://github.com/$repo" "refs/heads/$branch" 2>/dev/null | cut -f1)"
  if [ -z "$remote" ]; then
    log "$app: no $branch on $repo — skipping"
    continue
  fi

  known="$(state_get "$app")"

  # First sight of an app adopts the current SHA without deploying. Installing
  # this should not fire eleven builds at once; the next real push is what
  # deploys. `--deploy-all` is the way to force an initial catch-up.
  if [ -z "$known" ] && [ "$MODE" != "--deploy-all" ]; then
    state_set "$app" "$remote"
    log "$app: adopted ${remote:0:12} without deploying (first run)"
    continue
  fi

  if [ "$known" = "$remote" ] && [ "$MODE" != "--deploy-all" ]; then
    continue
  fi

  uuid="$(uuid_for "$app")"
  if [ -z "$uuid" ]; then
    log "$app: no Coolify application by that name — check apps.conf against the dashboard"
    continue
  fi

  if [ "$MODE" = "--dry-run" ]; then
    prev="${known:-none}"
    log "$app: would deploy ${remote:0:12} (was ${prev:0:12}) → $uuid"
    continue
  fi

  log "$app: $branch moved to ${remote:0:12}, deploying"
  code="$(curl -sS -o /tmp/local-replica.json -w '%{http_code}' --max-time 60 \
    -H "Authorization: Bearer $TOKEN" -H 'Accept: application/json' \
    "${URL%/}/api/v1/deploy?uuid=$uuid&force=false" || echo 000)"

  case "$code" in
    2*)
      # Only now. A failed trigger must be retried on the next pass, and
      # recording the SHA first would mean it never is.
      state_set "$app" "$remote"
      triggered+=("$app")
      log "$app: queued"
      ;;
    *)
      log "$app: Coolify answered HTTP $code — leaving the SHA unrecorded so the next pass retries"
      head -c 300 /tmp/local-replica.json 2>/dev/null && echo
      ;;
  esac
done < "$CONF"

if [ ${#triggered[@]} -gt 0 ]; then
  log "deployed: ${triggered[*]}"
fi
