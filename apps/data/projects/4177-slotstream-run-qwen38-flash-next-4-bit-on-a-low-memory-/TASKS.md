---
id: "4177"
slug: slotstream-run-qwen38-flash-next-4-bit-on-a-low-memory-
title: "Slotstream, run Qwen3.8-Flash-Next 4-bit on a low-memory Mac"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510441"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Slotstream, run Qwen3.8-Flash-Next 4-bit on a low-memory Mac

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copy `edd-app-template` → `apps/4177-slotstream-run-qwen38-flash-next-4-bit-on-a-low-memory-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the MLX + Swift runtime that streams the 4-bit weights from SSD.
- [ ] Implement expert-offloading so the resident footprint fits in 16GB.
- [ ] Build auto-mode that selects the right memory/speed trade-off.
- [ ] Ship an install/update flow that does not require the user to compile.
- [ ] Publish a benchmark dashboard so users can compare against their own machines.
- [ ] Begin the MTP port for speculative decoding.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
