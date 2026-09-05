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

## Problem

Public benchmarks for local LLMs are mostly synthetic — a leaderboard that scores a model on tasks the benchmark designer chose, with criteria the benchmark designer wrote. The Gauntlet (informant.reiners.io/gauntlet) is different: three arenas, sealed criteria, a machine computes every verdict. TEXT writes the news, VISION reads the screen, CODE fixes real bugs. The CODE arena's tasks are real shipped fixes reverted, with the regression test that caught the bug kept. The model gets the broken file and the failing test output; the model's answer runs in a throwaway worktree and is never merged.

The source is the Gauntlet landing page. The arena standings (at the source's snapshot) are: TEXT held by qwen3.6:35b-a3b (16 runs, 14 held, 2 split); VISION held by minicpm-v4.5:8b (7 runs, 2 held, 2 crowned, 3 split); CODE held by qwen3.6:35b-a3b (7 runs, 6 held, 1 crowned). The YARD (reads real photos) has no runs yet. All measured runs are on one RTX 3090; verdicts are computed from sealed criteria the operator never writes.

The source names the actor (a local-LLM operator who wants a benchmark with sealed criteria and real-bug tasks), the pain (synthetic benchmarks hide the criteria the benchmark designer chose; the operator cannot tell what the model actually scored against), and the missing thing (a benchmark with sealed criteria, three arenas (TEXT, VISION, CODE), a fourth arena (YARD) for real-photo reading, and real-shipped-bug tasks for CODE). It does not name a specific model, a specific Git history, or a specific hosting target beyond the one RTX 3090.

## Objective

Build The Gauntlet: a local-LLM benchmark with sealed criteria, three arenas (TEXT writes the news, VISION reads the screen, CODE fixes real bugs), a fourth arena (YARD reads real photos), and CODE tasks that are real shipped fixes reverted with the regression test that caught the bug kept, where the model's answer runs in a throwaway worktree and is never merged, all measured on one RTX 3090.

## Target Users

- Local-LLM operators who want a benchmark with sealed criteria they cannot see in advance.
- Local-LLM operators who want the CODE arena's tasks to be real shipped fixes with the regression test that caught the bug kept.
- Researchers comparing local models on the same sealed criteria across the three arenas (and a fourth when YARD ships).
- Hardware operators running on a single RTX 3090 who want a benchmark whose verdicts are reproducible on that hardware.
- Community contributors who want to propose a new arena with sealed criteria.

## MVP Scope

- The Gauntlet at informant.reiners.io/gauntlet with three arenas (TEXT, VISION, CODE) and a fourth arena (YARD) that has no runs yet.
- Sealed criteria the operator never writes; a machine computes every verdict.
- TEXT arena: writes the news.
- VISION arena: reads the screen.
- CODE arena: fixes real bugs from real shipped fixes reverted, with the regression test that caught the bug kept; the model gets the broken file and the failing test output; the model's answer runs in a throwaway worktree and is never merged.
- YARD arena: reads real photos (no runs yet at launch).
- Per-arena standings: model name, runs, held, crowned, split.
- All measured runs on one RTX 3090.
- Per-arena episode tables: date, contender, champion, verdict, per-task metrics, episode link.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The criteria are sealed. The operator never writes a verdict; a machine computes it. A criteria the operator writes is a sealed-criteria breach.
- The CODE arena's tasks are real shipped fixes reverted, with the regression test that caught the bug kept. A CODE task that is not a real shipped fix is a coverage gap.
- The model's answer in the CODE arena runs in a throwaway worktree and is never merged. A model's answer that is merged is a worktree-isolation breach.
- The benchmark is measured on one RTX 3090. A run on different hardware is a hardware-mismatch gap; the plan does not invent a multi-hardware run.
- The four arenas are TEXT, VISION, CODE, YARD. An arena outside the four is a coverage gap.
- The per-arena standings (model, runs, held, crowned, split) are the unit of trust the operator sees. A standing the operator cannot reproduce is a sealed-criteria failure.
- The plan does not invent a hosted offering the source does not name. The source does not name a hosted offering.
- The plan does not invent a pricing tier the source does not name. The source does not name a fee.
