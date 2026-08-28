---
id: "3190"
slug: rudder-red-green-tdd-workflow-for-verifiably-comprehens
title: Rudder – Red-Green TDD Workflow for Verifiably Comprehensive Specs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452359"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Rudder – Red-Green TDD Workflow for Verifiably Comprehensive Specs

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3190-rudder-red-green-tdd-workflow-for-verifiably-comprehens/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the plugin manifest for Codex and Claude Code with a minimal "hello" command

## Phase 1: Core

- [ ] Implement the local session-history adapter for Codex
- [ ] Implement the local session-history adapter for Claude Code
- [ ] Define the "intent" data model: which lines in the spec and which user turns in the session history count as intent
- [ ] Implement the test rewriter that strips tests down to assertions grounded only in the intent model
- [ ] Wire Vitest + c8 to compute coverage from the rewritten tests and persist the percentage in SQLite
- [ ] Implement the gap-analysis step that maps uncovered lines to "no intent" or "ambiguous intent"
- [ ] Implement the targeted-questions TUI: surface the highest-leverage gap, capture an answer, update intent
- [ ] Implement the red-green loop: turn an answered intent into a failing test, hand it to the running agent, wait for it to go green
- [ ] Add a per-project SQLite store for current coverage %, answered questions, and a test-rewrite log
- [ ] Write tests for the intent model, the test rewriter, and the gap-analysis step

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (the hosted piece is the README + docs site; the plugin itself is local)
- [ ] Verify in production
- [ ] Ship a demo project that exercises the full rewrite → coverage → question → red-green loop on a real codebase
- [ ] Publish install instructions for Codex and Claude Code

---

_Generated automatically by Lúa on 2026-08-26_
