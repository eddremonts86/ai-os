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

## Value Proposition

A local-LLM benchmark with sealed criteria, three arenas (TEXT writes the news, VISION reads the screen, CODE fixes real bugs), a fourth arena (YARD reads real photos), and CODE tasks that are real shipped fixes reverted with the regression test that caught the bug kept. The model's answer in CODE runs in a throwaway worktree and is never merged. Verdicts are computed from sealed criteria the operator never writes; all measured runs are on one RTX 3090.

The per-arena standings (model, runs, held, crowned, split) are the unit of trust the operator sees. The benchmark's source-of-truth claim is the sealed-criteria + real-shipped-bug pairing: the operator cannot see the criteria in advance, and the CODE tasks are not synthetic.

**One-liner:** A local-LLM benchmark with sealed criteria, three arenas (TEXT, VISION, CODE) plus a fourth (YARD), and CODE tasks that are real shipped fixes with the regression test that caught the bug kept.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Local-LLM operators | Want a benchmark with sealed criteria they cannot see in advance. |
| CODE-arena users | Want tasks that are real shipped fixes with the regression test that caught the bug kept. |
| Researchers comparing local models | Want the same sealed criteria across the three arenas (and a fourth when YARD ships). |
| Hardware operators on one RTX 3090 | Want a benchmark whose verdicts are reproducible on that hardware. |
| Community contributors | Want to propose a new arena with sealed criteria. |

## Jobs To Be Done

1. **Functional job** — Run a model on the TEXT arena and get a verdict computed from sealed criteria.
2. **Functional job** — Run a model on the VISION arena and get a verdict computed from sealed criteria.
3. **Functional job** — Run a model on the CODE arena with a real-shipped-fix task, with the model's answer running in a throwaway worktree and never merged.
4. **Functional job** — Read the per-arena standings (model, runs, held, crowned, split) and the per-arena episode tables.
5. **Emotional job** — Stop the feeling that the local-LLM benchmark hides the criteria the benchmark designer chose.
6. **Social job** — Be the local-LLM operator whose benchmark is reproducible on a single RTX 3090 with sealed criteria the operator cannot see in advance.

## Success Metrics

- **Sealed-criteria verification** — share of verdicts the operator can confirm were computed without the operator writing the criterion. A criterion the operator writes is a sealed-criteria breach.
- **Real-shipped-fix coverage** — share of CODE-arena tasks that are real shipped fixes with the regression test that caught the bug kept. A synthetic task in the CODE arena is a coverage gap.
- **Throwaway-worktree isolation** — share of CODE-arena answers that ran in a throwaway worktree and were never merged. An answer that is merged is a worktree-isolation breach.
- **Per-arena verdict reproducibility** — share of runs where the verdict is reproducible on the same RTX 3090 with the same model and the same criterion. An irreproducible verdict is a sealed-criteria failure.
- **Standing accuracy** — share of per-arena standings (model, runs, held, crowned, split) that match the underlying episode tables. A standing that drifts is a metrics-fidelity failure.
- **Per-arena coverage** — share of the four arenas (TEXT, VISION, CODE, YARD) the operator can run a model on. An arena the operator cannot reach is a coverage gap.
- **Episode-table fidelity** — share of episode tables (date, contender, champion, verdict, per-task metrics) that match the operator's rerun. An episode table that drifts is a metrics-fidelity failure.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The benchmark is free to read at informant.reiners.io/gauntlet. The plan does not invent a hosted offering, a subscription, or a per-model fee. Any future monetization has to be measured against the sealed-criteria verification and the real-shipped-fix coverage, because those are the metrics the source ties to the benchmark's value proposition.

## Competitive Landscape

- **Public synthetic benchmarks (the names the source does not provide)** — score a model on tasks the benchmark designer chose; the source's pitch is the sealed-criteria + real-shipped-fix pairing.
- **Vendor leaderboards (the names the source does not provide)** — surface a model score with criteria the operator cannot see; the source's pitch is the machine-computed verdict from sealed criteria.
- **Git-history bug benchmarks (the names the source does not provide)** — exist for some repositories; the source's pitch is the throwaway-worktree isolation that prevents the model's answer from being merged.
- **Hosted multi-hardware benchmarks (the names the source does not provide)** — run on different hardware; the source's pitch is the single RTX 3090 reproducibility claim.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the sealed-criteria guarantee survives a future arena addition. The source names sealed criteria the operator never writes; the open question is whether a new arena's criteria are sealed by the same mechanism or by a different one.
- [ ] Validate the real-shipped-fix coverage is enough for a meaningful CODE arena. The source is explicit that CODE tasks are real shipped fixes reverted; the open question is how many real-shipped-fix tasks the arena needs to be statistically meaningful.
- [ ] Define the policy on a CODE task the regression test does not cover. The source says the regression test that caught the bug is kept; the open question is whether the arena surfaces a "regression test does not cover this fix" warning or fails visibly.
- [ ] Confirm the throwaway-worktree isolation is robust across Git versions and shell environments. The source is explicit that the worktree is throwaway; the open question is how the arena handles a Git version that breaks the worktree isolation.
- [ ] Decide the policy on the YARD arena. The source has YARD with no runs yet; the open question is whether YARD ships as a no-runs arena or stays out of scope until the first run.
- [ ] Establish a documented escalation path when a model's answer runs in the throwaway worktree and modifies state outside the worktree. The source is explicit that the worktree is throwaway; the open question is whether the arena enforces a sandbox that prevents out-of-worktree modifications.
- [ ] Define the policy on a per-arena standing the operator disputes. The source names standings (model, runs, held, crowned, split); the open question is whether the operator can dispute a standing and how the dispute is adjudicated.
