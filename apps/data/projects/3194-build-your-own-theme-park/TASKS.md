---
id: "3194"
slug: build-your-own-theme-park
title: Build your own theme park
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452037"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Build your own theme park

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3194-build-your-own-theme-park/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the TanStack Start skeleton with a Drizzle + SQLite connection

## Phase 1: Core

- [ ] Define the typed park data model (worlds, paths, rides, rollercoasters with tracks)
- [ ] Implement the rule-set loader: the generator agent reads rule files from disk at the start of each run
- [ ] Implement the single-shot generator that turns a prompt into a park JSON the data model can validate
- [ ] Implement the rule checks in code: valid coaster track with at least one drop, ride accessibility via paths, paths connect areas, per-world scenery matches the theme
- [ ] Implement the grader agent that scores a park against the source's enumerated rubric items and returns structured failures
- [ ] Implement the rule-update loop: updater agent rewrites rule files from grader failures; generator retries with the new rules; loop terminates when the rubric passes or hits a max-iteration cap
- [ ] Build the React + TanStack Start preview that renders a generated park and lets the user export it
- [ ] Author the seed theme packs (pirate, jungle, space) with their scenery vocabulary
- [ ] Write tests for the data model validation, the rule checks, and the rule-update loop with mocked grader output

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Smoke-test: send a prompt, watch the eval loop run, and confirm the final park passes the rubric and exports cleanly

---

_Generated automatically by Lúa on 2026-08-26_
