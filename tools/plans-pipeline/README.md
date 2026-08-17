# plans-pipeline

Daily pipeline that turns scraped problem posts into indexed, web-ready
plans. Owner: the AI-OS corpus. Triggered by the LLM agent (see
`cron-prompt.md`) for the full flow, and by `~/Library/LaunchAgents/
ai.os.plans-pipeline.plist` for the LLM-free half.

## Phases

The full pipeline has 6 phases, ordered:

| # | Phase | What it does | Needs LLM? |
|---|-------|--------------|------------|
| 1 | `scrape` | Fetch new captures from all enabled scraper sources | no |
| 2 | `intake` | Materialise approved community submissions into plans | no |
| 3 | `prepare` | Rank new captures + select slice to author | **yes** (Phase 3 in cron-prompt.md) |
| 4 | `author` | Write prose for each plan in the slice | **yes** (Phase 4) |
| 5 | `verify` | Index + gate + tests + build | no |
| 6 | `ship`  | Commit → PR to dev → merge to main → trigger deploy | no |

`daily.sh <phase>` runs one phase at a time. `daily.sh ship` runs the
mechanical parts of `verify` + `ship` after the LLM agent has written the
prose; the agent itself runs `prepare` and the manual authoring step.

## Two cadences

### Cron 1 — scrape + intake, 2x/day (LLM-free)

The launchd plist `~/Library/LaunchAgents/ai.os.plans-pipeline.plist`
fires `scrape-cron.sh` at **08:00** and **20:00** local time. It runs
`daily.sh scrape` and `daily.sh intake` only. No LLM, no commit, no ship.

Logs land in `~/Projects/ai-os/outputs/plans-pipeline/cron-scrape-<timestamp>.log`
and are rotated after 14 days.

To fire manually (testing or one-off):
```bash
launchctl kickstart -k gui/501/ai.os.plans-pipeline
# or directly:
bash ~/Projects/ai-os/tools/plans-pipeline/scrape-cron.sh --once
```

The wrapper exits 0 on every outcome so launchd never marks the job as
failed: a held lock, an empty scrape, an empty intake — all OK from the
cron's point of view. The next tick handles whatever was missed.

### Cron 2 — full pipeline, 1x/day (agent-driven)

`cron-prompt.md` is the contract for the LLM agent that runs the full
`scrape → intake → prepare → author → verify → ship` flow. The agent
drives the run interactively (or semi-attended), since the authoring step
needs judgement. This is not on a fixed schedule — the agent invokes
`daily.sh` phases in order when it has context to do so.

## Why two cadences

- 2x/day scraping keeps the corpus fresh and decouples data acquisition
  from slow LLM-driven ranking/authoring. A 2x/day scrape also gives the
  indexer and agent two chances per day to act on the same sources.
- Separating the LLM step from the cron means a stuck agent never blocks
  scraping, and a flaky network never blocks the agent.
- The cron is idempotent: it skips when nothing changed and never
  overwrites work in progress. `daily.sh` has a single-file lock that the
  cron respects.

## Files

- `daily.sh` — the full pipeline driver (phases 1-6)
- `scrape-cron.sh` — the cron wrapper (phases 1-2 only, idempotent)
- `intake.mjs` — phase 2 implementation
- `select-slice.mjs` — phase 3 (slice selection)
- `test-intake.mjs` — unit tests for intake
- `state.json` — last-run state of the wrapper (NOT the scraper state)
- `cron-prompt.md` — agent contract for the full flow
