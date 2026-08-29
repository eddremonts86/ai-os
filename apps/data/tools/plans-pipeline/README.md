# plans-pipeline

The daily loop that keeps [plans.eduardoinerarte.dk](https://plans.eduardoinerarte.dk)
fed without anyone touching it.

```
scrape → intake → rank → format → [agent authors a slice] → index + gate + tests → commit → dev → main → deploy
```

Driven by the Hermes cron job `plans-pipeline` (`~/.hermes/cron/jobs.json`, every **4 h**).
The job is the *driver*; the mechanics live in [`daily.sh`](daily.sh). Its prompt is
version-controlled in [`cron-prompt.md`](cron-prompt.md) — edit that, then apply it with:

```bash
hermes cron edit 59b1562e8007 --prompt "$(cat apps/data/tools/plans-pipeline/cron-prompt.md)"
```

## Two schedulers, and why

The Hermes cron above drives the **whole** loop, because ranking and authoring need an LLM.
A second, LLM-free scheduler runs only the two deterministic input phases:

| Scheduler | Runs | Phases | Needs an LLM |
|---|---|---|---|
| Hermes cron `59b1562e8007` | every 4 h | all of them | yes |
| launchd `ai.os.plans-pipeline` | on its own schedule | `scrape`, `intake` | no |

The launchd side fires [`scrape-cron.sh`](scrape-cron.sh), which exists so captures keep
arriving even when no agent is available to author them. It is safe to run alongside the
Hermes job: both go through `daily.sh`, which holds a single PID lock, so whichever arrives
second logs a skip and exits 0 rather than racing.

### Installing and checking the launchd side

```bash
bash apps/data/tools/plans-pipeline/launchd/install-scheduler.sh            # install / repair + load
bash apps/data/tools/plans-pipeline/launchd/install-scheduler.sh --status   # is it actually loaded?
launchctl kickstart -p "gui/$(id -u)/ai.os.plans-pipeline"                  # run one scrape now
```

The plist is a template in `launchd/`, rendered with this checkout's path — it holds no
committed user path. Run `--status` when the corpus looks stale, because **an unloaded
launchd job is indistinguishable from a loaded one** by inspection: the plist is still on
disk, the last log still shows a clean run, and nothing reports that captures stopped
arriving. That is how this job sat unloaded for four days while the corpus looked healthy.

It is deliberately not part of `setup/install-mac.sh`: that script runs in CI, and
bootstrapping a scraper cron on a GitHub runner would scrape ProblemHunt on every push.

`scrape-cron.sh` resolves the repo root by walking up to `CLAUDE.md`. It must never go back
to counting `..` hops — from `apps/data/tools/plans-pipeline/` two hops up is `apps/data`,
which is a wrong root that scrapes into nothing and still exits green.

### Two ways the Hermes side stops silently

Both of these have happened, and neither shows up as a failed pipeline — the corpus simply
stops gaining published plans while capture keeps arriving.

1. **The live prompt is not the file.** `cron-prompt.md` is version-controlled; the job
   carries its own copy. Editing the file changes nothing until it is re-applied, so after
   any edit — and after any path change in this repo — run:

   ```bash
   hermes cron edit 59b1562e8007 --prompt "$(cat apps/data/tools/plans-pipeline/cron-prompt.md)"
   ```

   The paths in the job's prompt outlived the move to `apps/data/` by a week that way.

2. **Drift-skip.** Hermes refuses to run an *unpinned* job when the global inference config
   has changed since the job was created, so it cannot spend on a provider the job never
   agreed to. The job stays skipped, and the alert fires once. Pin it explicitly:

   ```bash
   hermes cron edit 59b1562e8007 --provider <provider> --model <model>
   ```

`hermes cron list` shows the schedule, the next run and the last error — which is where a
drift-skip announces itself — but **not** whether the job is pinned, and not whether its
prompt still matches the file. Those two need the job store:

```bash
python3 - <<'EOF'
import json, os
store = json.load(open(os.path.expanduser('~/.hermes/cron/jobs.json')))
j = [x for x in store['jobs'] if x['id'] == '59b1562e8007'][0]
print('pinned to:', j.get('provider'), '/', j.get('model'))
print('prompt matches the file:',
      j['prompt'].strip() == open('apps/data/tools/plans-pipeline/cron-prompt.md').read().strip())
EOF
```

## Why it is split this way

Exactly one step in this loop needs judgement: turning a scraped forum post into a plan a
reader would trust. Everything else — normalising documents, choosing what to work on,
rebuilding the index, running the gate, committing, promoting, deploying — is
deterministic and belongs in a script where it can be read, tested and blamed.

So the agent's whole job is: read a manifest, write prose for the plans in it. It never
runs git, never decides what ships, and cannot merge anything.

## Phases

| Phase | What it does |
|---|---|
| `scrape` | Runs the ProblemHunt/Reddit scraper. Fails loudly with the tail of `last-run.log`. |
| `intake` | Materialises approved community submissions into captures. Runs before `prepare` so a submission ingested on one tick is authored in the same pass. |
| `prepare` | `ai-os plans format --write`, then picks the slice → `apps/data/outputs/plans-pipeline/slice.json`. Exit **3** means nothing to enrich. |
| `verify` | Index, `ai-os plans check --publishable`, formatter tests, explorer build, parser invariants. Non-zero means **do not ship**. |
| `ship` | Commit → PR to `dev` → merge → PR `dev` → `main` → merge. Deploy triggers itself from the push. |
| `status` | Read-only. Where the corpus stands. |

```bash
ai-os plans pipeline status
```

## The slice

`--cap` (default 25) bounds one run's cost. Order is **new arrivals first, then the oldest
backlog**: fresh capture is what a reader came for, but newest-first alone starves the
backlog forever and oldest-first alone means today's capture waits weeks. Plans that
arrived but did not fit stop counting as new and join the oldest-first queue, so nothing
is skipped twice.

At 4 h × 100 that is up to 600 plans a day, so raise or lower `--cap` in the cron prompt to
trade run cost against how fast the backlog drains. It is set to outpace capture: at 25 the
scraper brought more per run than the agent authored, so the backlog grew instead of draining.

State lives in `state.json` — `lastSeenId` plus the live claims. It is per-machine and
gitignored. Deleting it makes everything look new once and releases every claim; the cap
still bounds the run.

## What stops a bad run

The pipeline merges to production unattended, so it is built to refuse rather than guess:

- **`verify` gates `ship`.** The gate, both test suites and the explorer build must pass
  before a commit is even created.
- **`--publishable`, not the whole corpus.** The gate's default question is "is every plan
  finished?", which is never true while capture keeps arriving — as a deploy gate it would
  block forever. The pipeline asks whether everything *about to go on the web* is sound.
- **Only authored plans publish.** The indexer ships `enriched`/`humanized`/`web-ready`
  and holds back `legacy`/`draft`, so a half-written plan cannot reach the site behind a
  green build. This is also what keeps the image build offline — unauthored plans are
  precisely the ones whose prose would be re-scraped at build time.
- **An isolated worktree.** `ship` never touches the caller's checkout or current branch.
  This repo is shared with interactive agents; their uncommitted work must not be swept
  into a 3am commit.
- **A bounded path list.** Only `apps/data/projects/`, `apps/data/progress/` and the
  scraper's `state.json` are staged, and the run aborts if anything else ends up staged.
  Three places have to agree — `COMMIT_PATHS`, the copy in `sync_corpus`, and the stray-path
  guard — because a path in the list that `sync_corpus` never mirrors stages nothing, and one
  that is mirrored but missing from the guard aborts the run it was added for.
  `apps/data/progress/` is copied but never mirrored for deletion: those are append-only run
  logs, and dropping one because this machine did not write it is worse than keeping it stale.
- **A mass-deletion brake.** The corpus is the source of truth for the branch, so `ship`
  deletes plans that vanished locally. Above `MAX_DELETE_PCT` (10%) it refuses instead —
  right for one withdrawn capture, catastrophic for a half-synced checkout.
- **`--yes` is required** to merge to main unattended. Without it `ship` stops after
  committing.
- **Claims, not just a lock.** Authoring 25 plans can outlast the 4 h interval, and the
  critical section spans four separate processes — `prepare`, the agent's authoring,
  `verify`, `ship` — so a lock held by one invocation cannot protect it: it is gone the
  moment `prepare` exits while authoring still has hours to run, and the next tick would
  select the very same plans, because plans being written are still unauthored. So
  `prepare` **claims** its slice (`state.json`, TTL 8 h, `--claim-ttl` to change).
  Overlapping runs get disjoint slices rather than fighting for one. An abandoned claim
  expires on its own and the plan returns to the queue.
- **A per-invocation lock on top**, so two `ship`s or two `scrape`s cannot interleave. It
  decides liveness by **PID**, not by age: an age threshold has to be shorter than the
  interval to clear crashed runs promptly and longer than the slowest healthy run to avoid
  double-starting one, and at 4 h there is no honest value that is both. A live holder means
  skip this tick; a dead one means reclaim, whatever the clock says.
- **Green checks before every merge.** A missing check counts as a failure, not as
  permission.

## Community submissions

A submission is a capture from a second source, not a second kind of thing. The form on the
site opens a GitHub issue, a human labels it `approved`, and `intake` writes it into
`apps/data/projects/` as a `draft` with `source.name: web`. Everything after that is the loop above,
unchanged, and the gate applies the same 11 rules regardless of where a capture came from.

Two gates stand between a submission and the site, and neither is sufficient alone: a person
approves it, and the gate certifies it. There is no automatic approval.

**The trust boundary.** Submission text is written by strangers and read by an agent. The
split is that the agent classifies and `intake.mjs` writes: no value from an issue ever
becomes a path, an id, a status or a command. Keep it that way when extending this.

`intake` is loud about approved submissions it could not ingest, because an approved issue
that never becomes a plan is invisible otherwise, and a queue that stops draining looks
exactly like an empty one.

## Running it by hand

```bash
bash apps/data/tools/plans-pipeline/daily.sh prepare --cap 5
```

Then enrich the ids in the manifest, and:

```bash
bash apps/data/tools/plans-pipeline/daily.sh verify && bash apps/data/tools/plans-pipeline/daily.sh ship --dry-run
```

`--dry-run` does everything except push, PR and merge. Drop it and add `--yes` to ship for
real.
