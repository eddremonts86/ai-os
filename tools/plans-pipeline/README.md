# plans-pipeline

The daily loop that keeps [plans.eduardoinerarte.dk](https://plans.eduardoinerarte.dk)
fed without anyone touching it.

```
scrape → rank → format → [agent enriches a slice] → index + gate + tests → commit → dev → main → deploy
```

Driven by the Hermes cron job `plans-pipeline` (`~/.hermes/cron/jobs.json`, every **4 h**).
The job is the *driver*; the mechanics live in [`daily.sh`](daily.sh). Its prompt is
version-controlled in [`cron-prompt.md`](cron-prompt.md) — edit that, then apply it with:

```bash
hermes cron edit 59b1562e8007 --prompt "$(cat tools/plans-pipeline/cron-prompt.md)"
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
| `prepare` | `ai-os plans format --write`, then picks the slice → `outputs/plans-pipeline/slice.json`. Exit **3** means nothing to enrich. |
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

At 4 h × 25 that is up to 150 plans a day, so raise or lower `--cap` in the cron prompt to
trade run cost against how fast the backlog drains.

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
- **A bounded path list.** Only `projects/` and the scraper's `state.json` are staged, and
  the run aborts if anything else ends up staged.
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

## Running it by hand

```bash
bash tools/plans-pipeline/daily.sh prepare --cap 5
```

Then enrich the ids in the manifest, and:

```bash
bash tools/plans-pipeline/daily.sh verify && bash tools/plans-pipeline/daily.sh ship --dry-run
```

`--dry-run` does everything except push, PR and merge. Drop it and add `--yes` to ship for
real.
