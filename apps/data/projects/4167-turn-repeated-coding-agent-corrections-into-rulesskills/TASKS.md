---
id: "4167"
slug: turn-repeated-coding-agent-corrections-into-rulesskills
title: Turn repeated coding-agent corrections into rules/skills
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511274"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Turn repeated coding-agent corrections into rules/skills

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copy `edd-app-template` → `apps/4167-turn-repeated-coding-agent-corrections-into-rulesskills/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the local watcher for Claude Code, Codex and Cursor session files.
- [ ] Implement the clustering of repeated corrections.
- [ ] Wire the threshold trigger that invokes the user's existing harness.
- [ ] Surface reviewable diffs in the desktop UI.
- [ ] Add a before/after counter to measure whether accepted changes reduce repeat corrections.
- [ ] Document the local-only posture in the README so users can audit it.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
