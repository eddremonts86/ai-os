---
id: "3590"
slug: ramanujan-computing-use-idle-computation-to-run-scienti
title: "Ramanujan-computing: use idle computation to run scientific computing"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479707"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, SQLite, gRPC, Tokio]
---
# Ramanujan-computing: use idle computation to run scientific computing

## Value Proposition

Ramanujan-computing turns the idle compute sitting in desktops, lab machines, and always-on boxes into a network that runs any scientific simulation through a single shared interpreter. Where BOINC forces a developer to compile and ship a per-simulation binary to every contributor, Ramanujan-computing ships one interpreter, accepts any simulation expressed in it, and runs the workload on the contributor's machine without a second binary.

The author has already demonstrated two very different workloads running on the runtime: a physics n-body simulation and Phi3 3.8B model inference. The current interpreter is 15% faster than CPython and 20× faster than Octave on the author's benchmarks, MIT-licensed, and open for contribution.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Independent researchers / students | Need HPC-class compute without HPC access; want to submit a sim and let it run. |
| Domain scientists prototyping new simulations | A new model should not require recompiling and redistributing a binary to every device. |
| Owners of idle desktops / lab machines | Have unused cycles; want a way to contribute without trusting opaque per-project binaries. |
| Open-source contributors to runtimes / interpreters | The author states the interpreter is nascent and the project is open — there is real room to shape it. |

## Jobs To Be Done

1. **Functional job** — Submit any scientific simulation once, get it executed across a pool of idle devices without building a per-simulation binary.
2. **Emotional job** — Stop treating idle compute as wasted; turn it into a network that funds research, similar in spirit to SETI@home but without per-project binaries.
3. **Social job** — Demonstrate to peers that the same runtime can host very different workloads (the n-body sim vs. Phi3 3.8B inference) and beat the obvious reference runtimes on both.

## Success Metrics

- **Perf parity with stated claims** — interpreter must remain at least 15% faster than CPython and at least 20× faster than Octave on the two published demos (the author's stated baselines).
- **Single-binary-on-worker** — adding a new simulation category requires zero changes to the worker device; the only artifact shipped to a worker remains the interpreter.
- **Demo coverage** — both the n-body simulation and Phi3 3.8B inference run end-to-end from a fresh checkout, with reproducibility scripts that re-verify the perf numbers.
- **Contributor activity** — first merged PRs from contributors who are not the author; the project is open for contribution, so activity is the load-bearing signal.
- **Worker fleet growth** — distinct worker devices that have completed at least one job in the first quarter of public availability.

## Pricing & Monetization

The post is silent on pricing. It states only that the project is MIT-licensed and open for contribution; absent beats invented. There is no mention of paid tiers, hosted compute, or marketplace fees in the source capture.

## Competitive Landscape

- **BOINC** — the project's most-cited alternative; solves the same problem but requires a new binary per simulation, which Ramanujan-computing's interpreter eliminates. The author contrasts with BOINC explicitly.
- **SETI@home and similar volunteer-computing projects** — historical precedent for "donate idle cycles" but each ships its own binary and serves one scientific workload.
- **Commercial serverless / batch compute (AWS Batch, GCP Batch, Lambda)** — solve the same "submit a job and run it" job for users willing to pay for managed compute; not a fit when the goal is to use idle compute that already exists on the contributor's machine.

## Risks & Open Questions

- [ ] The interpreter is nascent — confirm the perf claims (15% over CPython, 20× over Octave) hold on hardware and inputs the author did not test before treating them as release-quality.
- [ ] Phi3 3.8B inference inside a single interpreter is a non-trivial claim; validate that memory and runtime shape hold beyond the recorded demo before promising that workload to new users.
- [ ] Decide on worker trust model — open workers mean anyone can join, which is the point, but the MVP needs to define what is and is not acceptable input.
- [ ] Decide on coordinator placement — a single coordinator is fine for the demo, but a real network needs a story for high availability and partial outages.
- [ ] Clarify the contributor story: what labels, dev builds, and reviewer expectations the project commits to so "open for contribution" is not aspirational.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49479707) · **Category:** show-hn · **Tags:** Show HN, Product, Problem
