#!/usr/bin/env bash
#
# AI-OS daily plans pipeline.
#
#   scrape → rank → format → [agent enriches] → index+gate+tests → commit → dev → main → deploy
#
# Everything mechanical lives here. The single step this script cannot do is enrichment:
# turning a scraped forum post into a plan a reader would trust needs judgement, not regex
# (see tools/plan-format/ai-os-plans.sh, `enrich`). So the cron agent drives this script,
# does the writing between `prepare` and `verify`, and the script owns every other step —
# which keeps the agent's job small and the risky parts deterministic and reviewable.
#
# Phases, in order:
#   scrape    fetch new captures (the ProblemHunt/Reddit scraper)
#   prepare   ai-os plans format --write, then pick the slice to enrich → slice manifest
#   verify    index + gate + both test suites. Exit non-zero means DO NOT SHIP.
#   ship      commit → PR to dev → merge → PR dev to main → merge (deploy triggers itself)
#   status    read-only: where the corpus stands
#
# Ship works inside a throwaway git worktree, never in the caller's checkout. This repo is
# shared with interactive agents whose uncommitted work must not be swept into an
# unattended 3am commit, and whose current branch must not be moved under them.
#
# Usage:
#   daily.sh <phase> [--cap N] [--dry-run] [--yes]
#
#   --cap N          plans to enrich this run (default 25). prepare only.
#   --claim-ttl H    hours a selected plan stays claimed (default 8). prepare only.
#   --dry-run        ship: do everything except push, PR and merge.
#   --yes            ship: required to actually merge to main unattended.

set -euo pipefail

AI_OS_ROOT="${AI_OS_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"
cd "$AI_OS_ROOT"

PHASE="${1:-}"; shift || true
CAP=25
CLAIM_TTL=""
DRY_RUN=0
ASSUME_YES=0
while [ $# -gt 0 ]; do
  case "$1" in
    --cap) CAP="${2:?--cap needs a number}"; shift 2 ;;
    --claim-ttl) CLAIM_TTL="${2:?--claim-ttl needs hours}"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    --yes) ASSUME_YES=1; shift ;;
    *) echo "unknown flag: $1" >&2; exit 2 ;;
  esac
done

SCRAPER_DIR="$AI_OS_ROOT/tools/problemhunt-scraper"
EXPLORER_DIR="$AI_OS_ROOT/plans-explorer/app"
SLICE_MANIFEST="$AI_OS_ROOT/outputs/plans-pipeline/slice.json"
LOG_DIR="$AI_OS_ROOT/outputs/plans-pipeline"
LOCK="$LOG_DIR/.lock"

# Paths this pipeline is allowed to commit. Anything else in the tree belongs to a human or
# another agent and is none of our business — an unattended `git add -A` here would be a way
# to silently ship somebody's half-finished refactor.
COMMIT_PATHS=(projects tools/problemhunt-scraper/state.json)

# Refuse to mirror away more than this share of the corpus. The corpus is the source of
# truth for the branch, so ship deletes plans that vanished locally — which is right for one
# withdrawn capture and catastrophic for a mistyped path or a half-synced checkout.
MAX_DELETE_PCT=10

log() { printf '[plans-pipeline] %s\n' "$*"; }
die() { printf '[plans-pipeline] FATAL: %s\n' "$*" >&2; exit 1; }

mkdir -p "$LOG_DIR"

# ---------- one run at a time ----------
# The cron fires every 4h and authoring a slice can outlast that. Two overlapping runs would
# enrich the same slice twice and race each other's commits.
#
# Liveness is decided by PID, not by age. An age threshold has to be shorter than the
# interval to clear crashed runs promptly, and longer than the slowest healthy run to avoid
# double-starting one — at a 4h interval there is no honest value that is both, and guessing
# wrong in the permissive direction is what puts two authoring agents in the repo at once.
# So: alive holder means skip, dead holder means reclaim, whatever the clock says.
release_lock() { rm -rf "$LOCK" 2>/dev/null || true; }

acquire_lock() {
  if mkdir "$LOCK" 2>/dev/null; then
    echo $$ > "$LOCK/pid"
    trap release_lock EXIT
    return
  fi

  local holder age_min
  holder=$(cat "$LOCK/pid" 2>/dev/null || echo '')
  age_min=$(( ( $(date +%s) - $(stat -f %m "$LOCK" 2>/dev/null || echo 0) ) / 60 ))

  if [ -n "$holder" ] && kill -0 "$holder" 2>/dev/null; then
    die "run $holder is still working (${age_min}m). Skipping this tick — the next one picks it up."
  fi

  # No pid recorded, or the recorded process is gone: the holder died without cleaning up.
  log "abandoned lock (holder '${holder:-none}' not running, ${age_min}m old) — reclaiming"
  release_lock
  mkdir "$LOCK" 2>/dev/null || die "could not reclaim lock at $LOCK"
  echo $$ > "$LOCK/pid"
  trap release_lock EXIT
}

# ---------- phases ----------

phase_scrape() {
  acquire_lock
  log "scraping new captures"
  ( cd "$SCRAPER_DIR" && node scraper.cjs --quiet ) || {
    log "scraper failed — last 30 lines:"
    tail -30 "$SCRAPER_DIR/last-run.log" >&2 || true
    die "scrape failed"
  }
  tail -1 "$SCRAPER_DIR/last-run.log" | sed 's/^/[plans-pipeline] /'
}

phase_prepare() {
  acquire_lock
  log "normalising documents to the schema (ai-os plans format --write)"
  bash "$AI_OS_ROOT/tools/plan-format/ai-os-plans.sh" format --write

  log "selecting the slice to enrich (cap $CAP)"
  set +e
  # A long manual catch-up run needs a TTL that outlasts it, or the cron reclaims its
  # plans mid-run and two agents write the same ones.
  node "$AI_OS_ROOT/tools/plans-pipeline/select-slice.mjs" --cap "$CAP" \
    ${CLAIM_TTL:+--claim-ttl "$CLAIM_TTL"}
  local rc=$?
  set -e
  if [ "$rc" -eq 3 ]; then
    log "nothing to enrich — skip the agent step and go straight to verify"
    return 3
  fi
  [ "$rc" -eq 0 ] || die "slice selection failed (exit $rc)"
  log "agent: enrich every id in $SLICE_MANIFEST using the plan-authoring skill"
}

phase_verify() {
  log "rebuilding the index"
  ( cd "$EXPLORER_DIR" && npm run index ) || die "indexer failed"

  # --publishable, not the whole corpus: the gate's default question is "is every plan
  # finished?", which is never true while capture keeps arriving, so as a deploy gate it
  # would block forever. The question that matters is whether everything about to go on the
  # web is sound.
  log "gate: are all publishable plans web-ready?"
  node "$AI_OS_ROOT/tools/plan-format/check-plans.mjs" --publishable --summary \
    || die "gate failed — publishable plans are not web-ready. NOT shipping."

  log "formatter test suite"
  bash "$AI_OS_ROOT/tools/plan-format/ai-os-plans.sh" test || die "plan-format tests failed"

  log "explorer build + parser invariants"
  ( cd "$EXPLORER_DIR" && npm run build && npm run test:parser ) || die "explorer build/tests failed"

  log "verify OK — safe to ship"
}

# Mirror the corpus into the worktree, refusing an implausible mass deletion.
#
# Deliberately does NOT use `rsync --delete` for the deletion set: macOS now ships
# openrsync, which rejects `-i`/`--itemize-changes`/`--out-format`, so parsing rsync's
# report silently yielded zero deletions and the guard never fired. git's own index is both
# exact and portable, so ask it instead.
sync_corpus() {
  local wt="$1"

  # Additions and updates.
  cp -R "$AI_OS_ROOT/projects/." "$wt/projects/"
  cp "$SCRAPER_DIR/state.json" "$wt/tools/problemhunt-scraper/state.json"

  # Removals: tracked under projects/ on the branch, but gone from the local corpus.
  local gone
  gone=$(git -C "$wt" ls-files -z -- projects \
         | while IFS= read -r -d '' f; do
             [ -e "$AI_OS_ROOT/$f" ] || printf '%s\n' "$f"
           done)
  [ -n "$gone" ] || return 0

  # `|| true` on every grep in a pipeline is load-bearing under `set -o pipefail`: grep
  # exits 1 when it matches nothing, pipefail promotes that to the whole pipeline, and
  # `set -e` then kills the run on a perfectly ordinary "no matches" — which is exactly how
  # a first version of this script died silently right after passing its own safety check.
  local gone_dirs total pct
  gone_dirs=$(printf '%s\n' "$gone" | { grep -oE '^projects/[0-9]{3,}-[^/]+' || true; } | sort -u | wc -l | tr -d ' ')
  total=$(git -C "$wt" ls-files -- projects | { grep -oE '^projects/[0-9]{3,}-[^/]+' || true; } | sort -u | wc -l | tr -d ' ')

  if [ "$total" -gt 0 ] && [ "$gone_dirs" -gt 0 ]; then
    pct=$(( gone_dirs * 100 / total ))
    log "corpus mirror removes $gone_dirs of $total plan dirs (${pct}%)"
    [ "$pct" -le "$MAX_DELETE_PCT" ] \
      || die "refusing to delete ${pct}% of the corpus (limit ${MAX_DELETE_PCT}%). Run by hand if intended."
  fi

  printf '%s\n' "$gone" | tr '\n' '\0' | xargs -0 git -C "$wt" rm -q --cached --
  printf '%s\n' "$gone" | while IFS= read -r f; do [ -n "$f" ] && rm -f "$wt/$f"; done
}

phase_ship() {
  acquire_lock
  command -v gh >/dev/null || die "gh CLI not found"
  gh auth status >/dev/null 2>&1 || die "gh is not authenticated"

  local stamp branch wt
  stamp=$(date -u +%Y-%m-%d-%H%M)
  branch="chore/plans-$stamp"
  wt=$(mktemp -d -t aios-plans-ship-XXXX)

  log "fetching origin"
  git fetch -q origin

  # dev is the integration branch; create it from main the first time.
  if ! git ls-remote --exit-code --heads origin dev >/dev/null 2>&1; then
    log "origin/dev does not exist — creating it from origin/main"
    [ "$DRY_RUN" -eq 1 ] || git push -q origin "origin/main:refs/heads/dev"
  fi

  local base="origin/dev"
  git ls-remote --exit-code --heads origin dev >/dev/null 2>&1 || base="origin/main"

  log "preparing isolated worktree at $wt (base $base)"
  git worktree add -q --detach "$wt" "$base"
  # shellcheck disable=SC2064
  trap "git worktree remove --force '$wt' >/dev/null 2>&1 || true; release_lock" EXIT

  git -C "$wt" switch -q -c "$branch"
  sync_corpus "$wt"
  git -C "$wt" add -- "${COMMIT_PATHS[@]}"

  # Nothing to say is a normal outcome: the scraper found nothing and no plan advanced. Still
  # try the promotion — dev can hold work an earlier run committed but never got to main, and
  # returning here would leave it stranded there indefinitely.
  if git -C "$wt" diff --cached --quiet; then
    log "no corpus changes to commit"
    if [ "$DRY_RUN" -eq 1 ]; then
      log "DRY RUN — would promote dev → main if dev is ahead. Stopping."
      return 0
    fi
    [ "$ASSUME_YES" -eq 1 ] || die "promoting dev to main deploys to production. Pass --yes."
    merge_through dev main "chore(plans): promote corpus $stamp"
    return 0
  fi

  local added changed
  added=$(git -C "$wt" diff --cached --name-only --diff-filter=A -- projects \
          | { grep -oE '^projects/[0-9]{3,}-[^/]+' || true; } | sort -u | wc -l | tr -d ' ')
  changed=$(git -C "$wt" diff --cached --name-only -- projects | wc -l | tr -d ' ')
  log "staged: $changed files across $added new plan dirs"

  # Guard against the pipeline having staged anything outside its remit.
  local stray
  stray=$(git -C "$wt" diff --cached --name-only \
          | grep -vE '^(projects/|tools/problemhunt-scraper/state\.json$)' || true)
  [ -z "$stray" ] || die "refusing to commit paths outside the pipeline's remit:"$'\n'"$stray"

  git -C "$wt" -c user.name="ai-os-pipeline" -c user.email="ei@schilling.dk" \
    commit -q --no-verify -m "chore(plans): daily corpus refresh $stamp

Automated by tools/plans-pipeline/daily.sh. $added plan dirs touched.
Publishable plans passed \`ai-os plans check --publishable\`, the formatter
test suite, the explorer build and its parser invariants before this commit
was created.

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>"

  if [ "$DRY_RUN" -eq 1 ]; then
    log "DRY RUN — would push $branch and open PR → dev → main. Stopping."
    git -C "$wt" --no-pager log --oneline -1
    return 0
  fi

  if [ "$ASSUME_YES" -ne 1 ]; then
    die "ship merges to main and deploys to production. Pass --yes to allow that unattended."
  fi

  log "pushing $branch"
  git -C "$wt" push -q -u origin "$branch"

  merge_through "$branch" dev "chore(plans): daily corpus refresh $stamp"
  merge_through dev main "chore(plans): promote daily corpus refresh $stamp"

  log "shipped. The deploy workflows trigger on the push to main."
}

# Open a PR head→base, wait for its checks, merge it. Never merges on a red or missing check.
merge_through() {
  local head="$1" base="$2" title="$3"

  # dev→main on an unchanged dev is a normal no-op, not a failure.
  if [ "$(git rev-parse "origin/$head")" = "$(git rev-parse "origin/$base")" ]; then
    log "$head is identical to $base — nothing to promote"
    return 0
  fi

  log "opening PR $head → $base"
  local url
  url=$(gh pr create --head "$head" --base "$base" --title "$title" \
        --body "Automated by \`tools/plans-pipeline/daily.sh\`. Gate, formatter tests, explorer build and parser invariants all passed before the commit was created." \
        2>/dev/null) || url=$(gh pr list --head "$head" --base "$base" --json url -q '.[0].url')
  [ -n "$url" ] || die "could not open or find a PR for $head → $base"
  log "PR: $url"

  log "waiting for checks"
  local i out
  for i in $(seq 1 60); do
    out=$(gh pr view "$url" --json statusCheckRollup \
          -q '[.statusCheckRollup[]|"\(.status // "-"):\(.conclusion)"]|join(" ")' 2>/dev/null || echo '')
    case "$out" in
      *IN_PROGRESS*|*QUEUED*|*PENDING*) sleep 20 ;;
      '') sleep 20 ;;   # rollup not populated yet
      *) break ;;
    esac
  done

  case "$out" in
    *FAILURE*|*CANCELLED*|*TIMED_OUT*|*ACTION_REQUIRED*)
      die "checks are not green on $url ($out). NOT merging." ;;
  esac
  [ -n "$out" ] || die "no checks ever reported on $url. NOT merging."
  log "checks: $out"

  log "merging $head → $base"

  # Squash a feature branch into dev, but NEVER squash the dev → main promotion. A squash
  # rewrites dev's commits as one new commit with no ancestry link, so main ends up holding
  # dev's content while git still considers the branches unrelated — every later promotion
  # then conflicts on files both sides touched, forever. Learned by doing it: the first
  # promotion landed fine and the very next one came up CONFLICTING with a one-file diff.
  local strategy=--squash
  [ "$head" = "dev" ] && [ "$base" = "main" ] && strategy=--merge

  gh pr merge "$url" "$strategy" || die "merge failed for $url"

  # Delete the remote head ref ourselves rather than via `gh pr merge --delete-branch`: that
  # flag also deletes the local branch, which is checked out in ship's worktree, so it fails
  # AFTER a successful merge and gh's non-zero exit made a landed merge look like a failure.
  case "$head" in
    dev|main) ;;
    *) git push -q origin --delete "$head" 2>/dev/null \
         || log "note: remote branch $head was not deleted (merge already landed)" ;;
  esac
}

phase_status() {
  log "corpus"
  node "$AI_OS_ROOT/tools/plans-pipeline/select-slice.mjs" --cap "$CAP" \
    ${CLAIM_TTL:+--claim-ttl "$CLAIM_TTL"} --dry-run || true
  log "gate (publishable only)"
  node "$AI_OS_ROOT/tools/plan-format/check-plans.mjs" --publishable --summary || true
}

case "$PHASE" in
  scrape)  phase_scrape ;;
  prepare) phase_prepare ;;
  verify)  phase_verify ;;
  ship)    phase_ship ;;
  status)  phase_status ;;
  ''|-h|--help|help)
    sed -n '2,30p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
    ;;
  *) die "unknown phase: $PHASE (try: scrape prepare verify ship status)" ;;
esac
