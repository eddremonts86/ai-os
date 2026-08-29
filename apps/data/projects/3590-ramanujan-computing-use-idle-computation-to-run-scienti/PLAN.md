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

## Tech Stack

- **Interpreter core:** Rust, written as an async runtime on Tokio. The interpreter needs both numerical speed and a clean async surface for the worker agent, so Rust + Tokio is the right baseline for the perf and concurrency claims the author made.
- **Coordinator service:** Rust on Tokio with a SQLite-backed job queue. SQLite handles the submission/assignment/result set without the ops cost of a distributed database at MVP scale.
- **Device↔coordinator protocol:** gRPC with protobuf-defined messages so the worker is a thin client and a new language binding can be added later without rewriting the coordinator.
- **Worker daemon:** Rust on Tokio, reusing the interpreter runtime. One binary to install on a contributor's machine is the contract vs. BOINC.
- **CLI / submission tool:** Rust binary sharing the same workspace; uses the same gRPC client as the worker.
- **Reproducibility / benchmarks:** Rust workspace alongside the interpreter; the n-body demo, the Phi3 3.8B inference demo, and the perf comparisons against CPython and Octave all live in this crate.
- **Tests:** property tests for the interpreter core, integration tests for the coordinator↔worker loop, end-to-end tests that run both demos and check result equivalence.

## Architecture

The system has three roles: developer, coordinator, worker. A developer uses `ramanujan submit` to send a simulation program (the source the interpreter runs) plus a small manifest to the coordinator. The coordinator stores the program, enqueues a job, and waits for an idle worker.

A worker runs as a long-lived daemon. It registers with the coordinator, sends heartbeats, and pulls jobs when it has spare CPU and memory. On assignment, the worker boots the interpreter, runs the simulation inside the worker process, and streams results back. The interpreter itself is the only artifact installed on the worker — adding a new simulation is a matter of submitting a new program, not shipping a new binary.

The coordinator owns the job queue in SQLite, holds the active worker registry, and exposes a read-only HTTP view (separate from gRPC, for humans) showing live workers, in-flight jobs, and completed runs. Result payloads are stored alongside the job record so the developer can fetch the outcome of a submission without re-running.

## Milestones

1. **M0 — Interpreter + demos land in CI.** The interpreter compiles, runs the n-body sim and Phi3 3.8B inference as test cases, and the perf comparisons against CPython and Octave run on every PR with a result published to the README.
2. **M1 — Submission and worker loop.** `ramanujan submit` and a worker daemon can submit a job, assign it to an idle worker, run it, and return a result. The two demos both complete end-to-end through the new path.
3. **M2 — Coordinator service + read-only UI.** A standalone coordinator is the system of record. Workers and submissions register through gRPC; a small web view exposes live workers, queue depth, and completed runs.
4. **M3 — Reproducibility + contributor onboarding.** A one-command script reruns both demos from a fresh checkout and prints the perf numbers; the contributor path (labels, dev build, contribution guide) is functional.
5. **M4 — Public pilot.** A small pool of contributors can join the public coordinator and run their own simulations; the two demos still pass the perf baselines on the public pool.

## Risks

- **Interpreter maturity** — the author flags the interpreter as nascent; if it cannot host the two demos reliably at MVP, every later claim rests on a shaky base. Ship with a test corpus that exercises both demos before any scaling work.
- **Perf regressions** — the 15% / 20× numbers are the headline; silent regressions against CPython or Octave erode the project's credibility. Treat the perf comparison as a release gate, not a benchmark report.
- **Worker resource use** — the worker runs on a contributor's machine; if it pegs CPU, pins a core, or chews RAM, contributors will pull it. Bound idle-time behavior and document it.
- **Trust on a public pool** — opening the coordinator to the open internet means arbitrary submissions land on arbitrary workers. The MVP should be honest that this is a research pool, not a marketplace; sandboxing and attestation are v2.
- **Single coordinator** — fine for MVP, but partial coordinator outages halt the entire network. Plan a coordinator-replication story before treating the system as production-grade.
