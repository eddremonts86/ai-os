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

## Phase 0: Scaffold

- [ ] Clone the repo and pin Python 3.11 as the lowest supported version
- [ ] Stand up the SQLite store under `rta_brain/`
- [ ] Wire the Ed25519 snapshot-signing path into the standard install
- [ ] Pick the dashboard build output directory (`rta_brain/static/`)

## Phase 1: Core

Implement canonical project identity, bitemporal truth primitives, governed context compilation, and Universal Capture (opt-in, bounded, redacted). Implement the deterministic Project Cognition projection and the Project Reality cockpit with the five named bounded views (readiness, coverage, conflicts, change impact, decision debt). Implement the MCP surface so Codex, Claude Code, Cursor, or any MCP-capable agent can query the projection. Build the static dashboard bundle and copy it into `rta_brain/static/`. Write the operator docs, the acceptance suite, and the release verification record.

## Phase 2: Deploy

- [ ] Create the GitHub repo (or mirror the existing one)
- [ ] Run the Windows / macOS / Linux CI matrix on Python 3.11 / 3.12 / 3.13
- [ ] Publish native binaries (Windows x64, Linux x64, macOS), a universal wheel, CycloneDX SBOMs, and a combined `SHA256SUMS.txt`
- [ ] Verify in production (acceptance suite on a disposable Git repo, no developer's existing project)