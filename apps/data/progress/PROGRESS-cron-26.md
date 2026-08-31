# PROGRESS.md — cron run #26 (2026-08-29)

Per-run record for the slice prepared 2026-08-29. Source: `apps/data/outputs/plans-pipeline/slice.json` (cap 100: 28 fresh captures 3775-3802 + 72 backlog 974-1045).

## Phase 1 — Scrape

`daily.sh scrape` → exit 0. "11 analyzed (PH=200, Reddit=0)" on top of the earlier batch today; 28 captures total newer than the last `topProjectsEvaluatedAt`.

## Phase 2 — Intake

`daily.sh intake` → exit 0. "nothing to ingest (0 approved, all already ingested)". No skipped submissions.

## Phase 3 — Ranking

28 unranked captures triaged: 5 skipped as unbuildable (3775, 3776, 3792, 3793 — Ask HN meta/career/error posts; 3782 — one-line Show HN body with no product name and no URL). 23 buildable.

TOP_PROJECTS.md updated: 4 new Money entrants (#92-95), 5 new Learn entrants (#107-111), 6 new Fun entrants (#150-155). Headings bumped: Top 95→99 Money, Top 113→118 Learn, Top 156→162 Fun. Source line 3155→3183 projects. Changelog entry appended (cron run #26). `topProjectsEvaluatedAt` set to 2026-08-29T19:57:00.619243Z via python. No Money #1 change (TaqFlow 8.5), no Learn #1 change (Kandelo 9.5), no Fun #1 change (3194/3621 hold 8.0, now shared with 3777 Ubimage). Parser invariants verified: headings match item counts exactly (99/118/162).

## Phase 4 — Authoring

Three parallel authoring agents + one repair agent, each with a disjoint id range (logs: `PROGRESS-cron-26-A/B/C/D.md`).

- **39 enriched** (all verified individually with `ai-os plans check --id` and clean in the aggregate publishable gate):
  - Fresh (23): 3777-3802 minus the 5 skipped — Ubimage, Flint, StartupWiki, Iatethis, MCU Timeline, SHOOK, Idea Miner, LayoverGuard, Skaoot travel, ScrapeForge, Skillbased, read.bored, OtterMind, Kiantu, SSH Ache, Stop That Shit, Moe-Direct, Rysh, Lumify, PhpEZ, Cloudless, RepoWorld, Vid Kraken.
  - Backlog (16): 982, 984, 988, 990, 993, 994, 999 (agent B); 1011, 1014, 1018, 1022, 1026, 1027, 1030, 1036, 1042 (agent C — 9 total, listed from its log).
- **61 left as `draft`** — every one with a one-line reason in the per-agent logs; overwhelmingly Ask HN meta questions, outage reports, rants, career threads and recommendation asks with no buildable product.
- **15 pre-existing half-authored plans repaired** (agent D): 3715-3721, 3730-3737 had status `enriched` but PLAN.md/TASKS.md sections still `_Not written yet` (debt from an earlier run). All now complete and passing.

Publishable gate after authoring: **876/876 web-ready (100%)** — up from 837.

## Phase 5 — Verify: FAILED (pre-existing bug, unchanged since run #23)

```
[test] ❌ zips directory has exactly one entry per plan ("873 zips / 876 plans")
[test] invariants: 15 pass, 1 fail
[test] FAILED
[plans-pipeline] FATAL: explorer build/tests failed
```

Everything else green: indexer (876 plans + rankings 99/118/162), `--publishable` gate 100%, formatter suite, explorer build (`✓ built in 1.19s`).

Root cause (unchanged since PROGRESS-cron-23): plan ids 806, 809, 810 each have TWO slug directories in the corpus with distinct authored content, both `enriched`. `writePlanZips` in `apps/plans-explorer/app/scripts/build-index.mjs` writes `${p.id}.zip`, so the pairs collide: 876 plans → 873 zips. The one-line fix (dedupe `plans` by `id` before `writePlanZips`, or zip per dir) lives in `apps/plans-explorer/`, which is **outside ship's COMMIT_PATHS**, so an unattended run cannot land it through the pipeline. Deleting either copy of a duplicate would lose distinct authored content — a human decision, not a cron one.

## Phase 6 — Ship: NOT RUN

Per plan-authoring skill: Phase 5 failed → do not run Phase 6, do not force it through. Nothing was committed or pushed by this run. All work is on disk in the working tree (corpus, TOP_PROJECTS.md, scraper state, progress logs) and will be picked up by the next run once the duplicate-id fix lands on the branch.

Backlog after this run: `backlogRemaining: 2155` (from the slice manifest).
