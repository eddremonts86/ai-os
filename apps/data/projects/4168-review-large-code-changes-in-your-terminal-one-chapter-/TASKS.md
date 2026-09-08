---
id: "4168"
slug: review-large-code-changes-in-your-terminal-one-chapter-
title: "Review large code changes in your terminal, one chapter at a time"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511126"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Review large code changes in your terminal, one chapter at a time

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copy `edd-app-template` → `apps/4168-review-large-code-changes-in-your-terminal-one-chapter-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the core chapter-by-chapter TUI over git diffs.
- [ ] Implement the agent skill that pre-generates a guided tour.
- [ ] Capture per-chapter comments inside the TUI.
- [ ] Send comments back to the agent in a structured round-trip.
- [ ] Ship `revue diff` as the no-narration mode.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
