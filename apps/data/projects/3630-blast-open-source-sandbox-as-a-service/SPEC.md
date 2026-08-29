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

## Problem

The capture for this plan is a single GitHub URL — the title is "Blast – Open-source sandbox-as-a-service" and the repository is stanford-mast/blast. Reading the repository description in the README clarifies the shape: BLAST is described there as "a single binary for local sandbox orchestration given a pool of CPU, memory, disk", which abstracts over local sandboxes such as SmolVM, Hypeman and Docker to provide a simple API to fork and run sandboxed commands, sync data, monitor VMs, sessions and runs, schedule and place forks and runs, take snapshots, sync snapshots to durable storage, migrate sandboxes, and manage resource pressure.

The README quotes a set of specifics that this plan can restate because they are in the source: the binary is described as a "Single 7 MB binary" with "No Terraform. No Packer. No extra dependencies"; the project is MIT-licensed and, at the time of the README, "just 3,586 lines", built to keep enterprise security reviews simple; installation is `cargo install blast_core`; the local API runs on `localhost:7240` and exposes endpoints including `/v1/fork`, `/v1/vms` and `/v1/runs`. The README also names three existing sandbox backends that BLAST is designed to abstract over — SmolVM, Hypeman and Docker — and frames BLAST as an orchestration layer above them rather than a competing VM implementation.

The "Missing piece" framing in similar self-hosted infrastructure projects is that the BYOC and local-sandbox ecosystem has several primitives — Firecracker-based microVMs, Docker, sandbox libraries — but no common control plane that decides where a fork should land, when a snapshot should be replicated, or how a pool of CPU and memory is split between competing workloads. The BLAST README positions the project against that gap: a single binary that takes a pool of resources and serves forking and running requests across it, while still allowing a future cloud burst. The plan treats those claims as the source and does not add facts the README does not state.

## Objective

Ship an open-source, single-binary sandbox orchestrator that takes a pool of CPU, memory and disk on the host where it runs, and serves fork and run requests against local sandbox backends such as SmolVM, Hypeman and Docker behind one local HTTP API on port 7240. The objective is the orchestration layer described in the README: scheduling where forks land, snapshotting and syncing snapshots to durable storage, monitoring VMs, sessions and runs, and managing resource pressure so a busy pool stays within its budget. The MIT licence and the small line count are part of the stated objective because the README names them as the basis for easy enterprise security review.

## Target Users

- Platform engineers running mixed local-sandbox backends on a shared host who want one control plane rather than three operators.
- AI-agent and code-execution product teams that fork and run untrusted code and need an orchestration layer that decides where each fork lands.
- Security researchers and reviewers who will read the binary's source end to end, where the README's stated line count of 3,586 is part of the value proposition.
- Operators already running SmolVM, Hypeman or Docker on the same host, who want a unified scheduling and snapshot layer above any one of them.
- Enterprise platform teams who need MIT licensing for review, which the README names explicitly.
- Contributors to the open-source sandboxing and orchestration community, which the README identifies as the project's active base.
- Future integrators of a cloud-burst control plane, which the README describes as a designed-for extension point rather than a shipped feature.

## MVP Scope

- A single Rust binary, `blast_core`, installable via `cargo install blast_core`, sized for the README's stated 7 MB footprint.
- A local HTTP API on `localhost:7240` exposing `/v1/fork`, `/v1/vms` and `/v1/runs`, with the JSON shapes the README's quick start uses.
- A pluggable sandbox backend abstraction, with SmolVM, Hypeman and Docker named in the source as the initial three.
- Forking and running of sandboxed commands against the configured backend, with the resource placement decision made by the local scheduler.
- Snapshotting and snapshot-to-durable-storage sync for forks that need to be resumed, with the destination storage configurable.
- Monitoring of VMs, sessions and runs at a level that lets an operator see where resource pressure is accumulating.
- Resource-pressure handling that prevents a pool from being oversubscribed when more forks than the pool can hold are requested.
- MIT licensing preserved verbatim, since the README names it as a feature for enterprise security review.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The interface surface is fixed by what the README documents: the local API on port 7240 and the three endpoint families (`fork`, `vms`, `runs`) — anything beyond that is out of scope of the captured shape.
- A single binary with no extra dependencies forces everything — scheduling, snapshotting, backend drivers — to live inside `blast_core`, which is the architecture's strength and its coupling cost.
- The sandbox backends named in the README (SmolVM, Hypeman, Docker) have different isolation guarantees and different image formats; the abstraction has to honour those differences rather than pretend they are the same.
- The "enterprise security review" promise depends on the codebase staying near the README's stated 3,586 lines; growth in line count has to be deliberate or the review promise is broken by accretion.
- Cloud burst is described in the README as a designed-for extension point, not a shipped feature, and treating it as MVP would invent capabilities the source does not promise.
- Local sandbox orchestration is bound by the host's actual CPU, memory and disk, which means the scheduler has to be honest about its ceiling rather than optimistic about its capacity.
- The MIT licence is a stated feature, so anything that would force a licence change (incorporating GPL code, vendored proprietary snapshots) breaks the contract the README makes.
