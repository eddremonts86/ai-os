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

## Problem

The author opens with a 1969 anchor: humans landed on the moon using an Apollo Guidance Computer whose compute power was roughly equivalent to today's scientific calculator. The framing is that the world is full of idle compute that is orders of magnitude more capable than what solved Apollo's guidance problem, and most of it sits unused. The author frames Ramanujan-computing as an attempt to harness that idle capacity for scientific simulation.

BOINC is the most-cited existing attempt at this problem. Its cost, the author argues, is the build-and-distribute loop: every new kind of simulation needs a new binary, that binary has to be compiled for and shipped to every device that wants to contribute compute. Adding a new simulation is heavyweight.

Ramanujan-computing collapses that loop with a single interpreter. Any device that wants to contribute compute installs the Ramanujan interpreter; a developer submits any simulation expressed in that interpreter; the idle device runs it with no per-simulation binary to ship. The same interpreter runtime hosts both kinds of workload the author has already demonstrated publicly: a physics n-body simulation and Phi3 3.8B model inference.

The interpreter is explicitly described as in its nascent stage. The author quotes current performance as 15% faster than CPython and 20× faster than Octave (the comparison the author makes to MATLAB). The project is MIT-licensed, open for contribution, and the author is soliciting feedback on both the interpreter and the project direction.

## Objective

Ship the Ramanujan-computing interpreter and the minimal submission-and-run loop it needs to demonstrate its value: an interpreter that runs scientific simulations faster than the two reference runtimes the author named (CPython, Octave), a submission path so a developer can hand a new simulation to the network, and a worker agent that runs that simulation on an idle device without shipping a new binary per workload. The first deployment must run the author's two demos end-to-end (the n-body physics sim and Phi3 3.8B inference) so the post's claims are reproducible from a public checkout.

## Target Users

- Independent researchers and students running numerical simulations who do not have HPC cluster access and want to offload work to a network they can join.
- Domain scientists prototyping a new simulation (molecular dynamics, fluid dynamics, agent-based models) who want a runtime that does not require recompiling and redistributing a custom binary every time the model changes.
- Operators of idle compute (older desktops, lab machines, always-on mini PCs) who want to donate cycles to a project without trusting opaque third-party binaries.
- Contributors interested in the interpreter itself — the author states the project is open for contribution and the interpreter is nascent, so there is room to shape it.

## MVP Scope

- Ramanujan interpreter: a working runtime capable of executing the two demos the author already published (the n-body physics sim and Phi3 3.8B inference) at the perf claims the author stated.
- A `ramanujan submit` CLI that packages a simulation program and submits it to the coordinator.
- A worker agent (the interpreter in daemon mode) that polls for jobs, runs them locally, and returns results.
- A coordinator service with a SQLite-backed job queue: receives submissions, assigns to idle workers, tracks in-flight work, collects results.
- gRPC-based device↔coordinator protocol so the worker is a thin client and the coordinator stays the system of record.
- Public job-submission API and a minimal web view showing live workers, in-flight jobs, and completed runs.
- Reproducibility scripts that rerun both author demos on a fresh checkout and report wall-clock and result-equivalence against the published numbers.
- Out of scope for MVP: a public distributed contributor pool across the open internet, paid compute, attestation or sandboxing beyond what the OS already provides, mobile/ARM-specific tuning beyond what the interpreter already needs.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49479707` follows the constraints in `3590-.../SPEC.md` and the chosen stack (Rust, SQLite, gRPC, Tokio). The surface area the author named is narrow: a developer submits a simulation; an idle device runs it. The visual language is therefore narrow too — a single status surface (workers, jobs, results), one accent for the active-job state, and density tuned for a developer watching a long simulation run.

For show-hn category, the defaults lean toward a demo-first surface: the two demo videos the author linked are first-class on the landing, and the perf numbers the author quoted (15% faster than CPython, 20× faster than Octave) appear as a single comparison panel with a link to the reproducibility scripts.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for the active-job indicator, one muted accent for queued/pending. No gradients.

**Type** — one display family for the perf comparison, one text family for the body, one mono for the CLI examples and result snippets.

**Density** — table-driven for the workers-and-jobs view; generous spacing for the demo videos and the perf comparison.

**Motion** — minimal: a play control on the two demo videos; a quiet ticker on the active-job counter; everything else is static.

## Constraints

- MIT-licensed, as stated by the author; redistribution and modification must remain permissive.
- The interpreter is the single artifact installed on every worker device. Workers must not require a per-simulation binary (the whole point vs. BOINC).
- Performance posture the author stated: at least 15% faster than CPython and 20× faster than Octave on the published demos; regressions against these baselines are a release blocker.
- The interpreter is nascent; the MVP must ship with a clear test corpus for both demos and a known-issues list, not paper over interpreter gaps.
- Worker resource use must be bounded — the worker runs on a user's machine, not on a managed cluster, and must not starve the host.
- Open for contribution (the author's stated posture) means the contributor path (issue labels, dev build, contribution guide) must be functional on day one.
