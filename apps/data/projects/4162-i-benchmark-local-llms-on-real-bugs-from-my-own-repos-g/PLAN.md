---
id: "4162"
slug: i-benchmark-local-llms-on-real-bugs-from-my-own-repos-g
title: "I benchmark local LLMs on real bugs from my own repo's Git history"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511401"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I benchmark local LLMs on real bugs from my own repo's Git history

## Tech Stack

- **A benchmark web surface** at informant.reiners.io/gauntlet with the four arenas (TEXT, VISION, CODE, YARD).
- **Sealed-criteria verdicts** computed by a machine, never written by the operator.
- **A TEXT arena** that asks the model to write the news.
- **A VISION arena** that asks the model to read the screen.
- **A CODE arena** that asks the model to fix real shipped bugs from real Git history, with the regression test that caught the bug kept.
- **A YARD arena** that asks the model to read real photos (no runs at launch).
- **A throwaway-worktree runner** for the CODE arena that runs the model's answer in an isolated worktree and never merges.
- **A per-arena standings page** (model, runs, held, crowned, split).
- **A per-arena episode table** (date, contender, champion, verdict, per-task metrics, episode link).
- **A single-RTX-3090 reproducibility claim** that all measured runs are on the same hardware.

## Architecture

The benchmark has three surfaces per arena: the task surface (the model's input), the verdict surface (the machine-computed verdict), and the standings surface (the per-arena standings).

The task surface is what the model sees. For TEXT, the task is "write the news". For VISION, the task is "read the screen". For CODE, the task is the broken file from a real shipped fix reverted, with the failing test output the regression test caught. For YARD, the task is a real photo (no runs at launch).

The verdict surface is what the operator sees. The verdict is computed by a machine from sealed criteria the operator never writes. The verdict is binary or scored per the arena's criterion. A criterion the operator writes is a sealed-criteria breach.

The standings surface is the unit of trust the operator sees. Each arena has a standings table (model, runs, held, crowned, split). Each episode has a per-arena episode table (date, contender, champion, verdict, per-task metrics, episode link). The standings are reproducible on a single RTX 3090 with the same model and the same criterion.

The throwaway-worktree runner is the structural reason the CODE arena cannot leak a model's answer into the project's real history. The runner creates a worktree, runs the model's answer, and removes the worktree; the project's main branch is never touched.

## Milestones

1. **M1 — Sealed-criteria verdict engine** — the machine-computed verdict, the sealed criteria the operator never writes, the per-arena criterion table.
2. **M2 — TEXT arena** — the "write the news" task surface, the verdict, the per-arena standings.
3. **M3 — VISION arena** — the "read the screen" task surface, the verdict, the per-arena standings.
4. **M4 — CODE arena** — the real-shipped-fix task surface, the regression test that caught the bug, the throwaway-worktree runner, the verdict.
5. **M5 — YARD arena (no runs)** — the "read real photos" task surface, the verdict surface ready for the first run.
6. **M6 — Per-arena standings and episode tables** — the model / runs / held / crowned / split columns, the date / contender / champion / verdict / per-task metrics / episode link rows.
7. **M7 — Single-RTX-3090 reproducibility claim** — the hardware spec on every episode, the verification that the verdict is reproducible on the same hardware.
8. **M8 — Landing page at informant.reiners.io/gauntlet** — the four-arena surface, the standings, the episode tables.

## Risks

- **Sealed-criteria breach** — the operator writes a criterion that should be sealed. Mitigation: the sealed-criteria verification is a first-class metric; the criterion table is sealed at build time; a breach is a release blocker.
- **Real-shipped-fix coverage gap** — a CODE task that is not a real shipped fix or that does not have the regression test kept. Mitigation: the real-shipped-fix coverage is a metric; the CODE task surface surfaces a "task failed the real-shipped-fix check" warning; a synthetic task is refused.
- **Throwaway-worktree leak** — the model's answer modifies state outside the worktree. Mitigation: the throwaway-worktree isolation is unit-tested; the runner refuses a worktree that touches the main branch; a leak is a release blocker.
- **Per-arena standing drift** — a standing that does not match the underlying episode table. Mitigation: the standing accuracy is a metric; the standings are rebuilt from the episode tables; a drift surfaces visibly.
- **YARD arena with no runs** — the operator sees YARD as a no-runs arena. Mitigation: the YARD arena is documented as no-runs at launch; the operator can wait for the first run or contribute a sealed criterion.
- **Multi-hardware reproducibility drift** — the operator runs on a different GPU and the verdict drifts. Mitigation: the single-RTX-3090 reproducibility claim is documented; the operator can rerun on the same hardware; a different-hardware run surfaces visibly with a "hardware mismatch" warning.
- **Standing dispute** — the operator disputes a per-arena standing. Mitigation: the standing-dispute escalation is documented; the dispute is adjudicated by the sealed-criterion table; a dispute surfaces visibly.
