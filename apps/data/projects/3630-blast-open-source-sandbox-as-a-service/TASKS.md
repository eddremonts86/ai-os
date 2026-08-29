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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3630-blast-open-source-sandbox-as-a-service/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Scaffold the Cargo project with the binary named `blast_core` and a Tokio-based entry point
- [ ] Implement the embedded HTTP server on port 7240 with `/v1/fork`, `/v1/vms` and `/v1/runs` stubs in the JSON shapes from the README quick start
- [ ] Define the sandbox-backend trait and the per-backend configuration model
- [ ] Implement the SmolVM backend driver against the trait
- [ ] Implement the Hypeman backend driver against the trait
- [ ] Implement the Docker backend driver against the trait
- [ ] Wire the scheduler that decides which backend a fork lands on, given the configured pool
- [ ] Persist fork and run records to a local store so the orchestrator survives a restart
- [ ] Implement snapshot creation and durable-storage sync, with the destination configurable
- [ ] Restore forks from the durable-storage index on startup
- [ ] Add the monitoring endpoint that exposes VMs, sessions and runs with current resource use
- [ ] Add CI checks for binary size (7 MB) and source-line budget so drift fails the build
- [ ] Add CI licence auditing so a new GPL dependency cannot land silently
- [ ] Document the operator configuration for the pool, the backends and the durable-storage destination

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
