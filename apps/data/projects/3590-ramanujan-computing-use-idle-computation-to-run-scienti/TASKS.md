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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Create the Rust workspace with three crates: `interpreter`, `coordinator`, `worker`
- [ ] Add Tokio runtime, gRPC codegen (tonic), and SQLite bindings (sqlx) to the workspace
- [ ] Define the protobuf schema for `Submit`, `Assign`, `Heartbeat`, `Result`
- [ ] Stand up a SQLite schema for jobs, workers, results
- [ ] Decide the worker idle-detection heuristic (CPU + memory headroom) and document it
- [ ] Write the contributor guide and a "good first issue" label set so "open for contribution" is concrete

## Phase 1: Core

- [ ] Implement the interpreter core: parser, type system, bytecode compiler, async runtime host
- [ ] Port the n-body physics simulation into the interpreter; match the author's published numbers (link to the demo video)
- [ ] Port the Phi3 3.8B inference workload into the interpreter; match the author's published demo (link to the demo video)
- [ ] Build the perf-comparison harness: interpreter vs. CPython vs. Octave on both demos; run on every PR
- [ ] Build `ramanujan submit`: packs the source + manifest, calls the coordinator over gRPC
- [ ] Build the worker daemon: registers, heartbeats, pulls jobs, runs them in the interpreter, returns results
- [ ] Build the coordinator service: enqueues jobs, matches to idle workers, persists results
- [ ] Property tests for the interpreter core (numerical kernels, control flow, async)
- [ ] Integration tests for the coordinator↔worker loop using a fake worker pool
- [ ] End-to-end tests that run both demos through submit → assign → run → return and check result equivalence
- [ ] A small read-only web view exposing live workers, queue depth, and completed runs
- [ ] Reproducibility script: one command reruns both demos from a fresh checkout and prints the perf numbers

## Phase 2: Deploy

- [ ] Publish the GitHub repo with the three-crate workspace, the demo scripts, and the contributor guide
- [ ] Document install: `cargo install ramanujan-worker` is the single artifact a contributor runs
- [ ] Stand up a public coordinator for the pilot pool
- [ ] Onboard the first external contributors (people running their own simulations, not the author's demos)
- [ ] Perf baselines gate on every release: 15% faster than CPython and 20× faster than Octave must both still hold
- [ ] Publish a v0.1 milestone post linking the two demo videos and the reproducibility script so the Show HN claims are checkable
