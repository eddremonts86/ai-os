---
id: "4160"
slug: rta-smriti-local-first-project-memory-for-coding-agents
title: Rta-Smriti – local-first project memory for coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511544"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Rta-Smriti – local-first project memory for coding agents

## Tech Stack

Python 3.11+ runtime with SQLite as the local store (per the repo's installation path), an Ed25519 snapshot-signing path included in the standard install, optional local backends installed via `python -m pip install -e ".[all-local]"`, a static-built frontend bundled into `rta_brain/static/` so runtime users do not need Node, and the build pipeline producing native Windows / Linux / macOS standalone binaries plus a universal wheel plus CycloneDX SBOMs plus a `SHA256SUMS.txt`. CI matrix on Windows / macOS / Linux for Python 3.11 / 3.12 / 3.13. The MCP surface is the integration point with external agents (Codex, Claude Code, Cursor). The project's own dashboard source lives in `dashboard-src/` and is built separately. No hosted backend.

## Architecture

Three layers per the repo: a private local event journal (capture is opt-in, bounded, redacted before durable queuing), a deterministic Project Cognition projection (reconciles indexed sources, bitemporal truth, observations, structured work state, decisions, local multimodal evidence into bounded readiness, coverage, conflict, change-impact, decision-debt views), and a Project Reality cockpit that surfaces the projection under explicit output budgets. The product never executes project work or routes models; it only serves memory to MCP-capable agents and renders the cockpit.

## Milestones

Ship canonical project identity and bitemporal truth primitives; ship governed context compilation and Universal Capture; ship the deterministic Project Cognition projection; ship the Project Reality cockpit with the five named bounded views; ship Ed25519 snapshot signing in the standard install; publish Windows / macOS / Linux binaries and a universal wheel with CycloneDX SBOMs and `SHA256SUMS.txt`; run the acceptance suite on a disposable Git repo across the full Python CI matrix; publish the v1.0.4-alpha release verification record.

## Risks

Risk that captured text is treated as trusted before promotion, silently leaking unverified claims into an agent's context; the design relies on the discipline of explicit promotion, and any tool that bypasses it breaks the trust boundary. Risk that local-first storage creates divergence between machines for the same developer; the source does not claim to solve cross-machine consistency. Risk that the static-built dashboard ages out of sync with the Python API surface; mitigate by rebuilding the static bundle on every release.