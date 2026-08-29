---
id: "3630"
slug: blast-open-source-sandbox-as-a-service
title: Blast – Open-source sandbox-as-a-service
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481956"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, Tokio, SmolVM, Hypeman, Docker, Firecracker (upstream option)]
---
# Blast – Open-source sandbox-as-a-service

## Tech Stack

- **Rust** for the binary itself, because the README states `cargo install blast_core` and a single-binary Rust build is the most direct way to hit a 7 MB footprint.
- **Tokio** as the async runtime inside the binary, since the API and the per-VM event loop need a runtime that handles thousands of concurrent tasks without a per-task thread.
- **SmolVM, Hypeman and Docker** as the three named sandbox backends in the source, each behind a common abstraction that the orchestrator schedules against.
- **Firecracker (optional, upstream)** as the underlying VM hypervisor when the orchestrator runs in a microVM-style deployment, since the README's positioning assumes that family of backend.
- **A small embedded HTTP server** on port 7240 implementing the documented `/v1/fork`, `/v1/vms` and `/v1/runs` endpoints with the JSON shapes the README's quick start uses.
- **Local filesystem or S3-style object storage** for durable snapshot sync, configurable per deployment so the orchestrator does not lock operators into one storage backend.

## Architecture

The orchestrator is one Rust binary on the host where the sandboxes run. On start it reads a configuration that names the pool of CPU, memory and disk it is allowed to use, the list of enabled sandbox backends, and the durable-storage destination for snapshots. It then exposes the local HTTP API on port 7240 and waits for requests.

A fork request hits `/v1/fork` with either a fresh image name or a source VM ID. The scheduler decides which backend and which host resource to use, then asks the chosen backend to instantiate the sandbox. The backend returns a VM ID, which the orchestrator records alongside the placement decision so subsequent runs on that VM can find it. The orchestrator does not itself implement VM isolation; it borrows the isolation guarantees of whichever backend the placement decision chose.

A run request hits `/v1/runs` against a previously forked VM. The orchestrator routes the command to the right backend, streams output back to the caller, and tracks the run in its internal monitor so an operator can see live resource pressure. Snapshots are taken on operator command and synced to the configured durable storage; the next process restart reads the durable-storage index so the operator can resume a fork without recreating it from scratch.

Resource pressure is handled by a placement policy that compares the requested fork against the configured pool and rejects or queues when the pool would be oversubscribed. The policy is intentionally simple — the orchestrator is not a Kubernetes replacement — and the operator's configuration decides the trade-off between throughput and ceiling.

## Milestones

1. **M1 — Binary skeleton** — Cargo project, Tokio runtime, embedded HTTP server on port 7240, and the three documented endpoint stubs.
2. **M2 — Backend abstraction** — a sandbox-backend trait that SmolVM, Hypeman and Docker all implement behind the same interface.
3. **M3 — Fork and run** — `/v1/fork` and `/v1/runs` working end to end against at least one backend, with the JSON shapes from the README's quick start.
4. **M4 — Scheduling** — placement decisions that respect the configured CPU and memory pool, with rejection or queueing on oversubscription.
5. **M5 — Snapshots and durable sync** — snapshot a fork, sync it to the configured durable storage, and restore from the index on restart.
6. **M6 — Monitoring** — a view of VMs, sessions and runs with current resource use, queryable from the API.
7. **M7 — Budget enforcement** — CI checks that report when the binary grows past 7 MB or the source grows past a documented line budget, and that fail the build when the MIT licence would be broken by a new dependency.

## Risks

- **Backend behaviour divergence** — SmolVM, Hypeman and Docker are not the same under the hood, and an abstraction that hides their differences without honouring them is a future outage.
- **Line-count drift** — the README's 3,586-line claim is part of the review promise; organic feature growth can erode it faster than the team notices.
- **Binary-size drift** — the 7 MB claim has the same review-promise character; large dependency upgrades can quietly blow it.
- **Snapshot durability assumptions** — "sync to durable storage" means different things on local disk, on S3 and on object storage with weak consistency; the orchestrator's promise has to be specific.
- **Pool oversubscription** — a scheduler that places forks optimistically will oversubscribe the host; the policy has to be conservative enough that the orchestrator's worst case is bounded.
- **Licence contamination** — incorporating a GPL dependency would silently break the MIT promise, so licence auditing has to be a routine step.
- **Cloud-burst scope creep** — treating the designed-for cloud-burst extension as shipped would invent features the README does not promise.
