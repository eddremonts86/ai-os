---
id: "3189"
slug: automatically-hide-flamebaitshallowpolitical-comments-o
title: Automatically hide flamebait/shallow/political comments on HN
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452362"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Automatically hide flamebait/shallow/political comments on HN

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3189-automatically-hide-flamebaitshallowpolitical-comments-o/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the TanStack Start skeleton with a Drizzle + SQLite connection and one health-check route

## Phase 1: Core

- [ ] Write the modified HN-guidelines text as a single versioned prompt artifact the classifier loads at startup
- [ ] Implement the ingest worker that polls new HN comments and queues them for scoring
- [ ] Wire the classifier call (LLM API) and persist `{comment_id, score, flagged_at}` rows to SQLite
- [ ] Implement the per-user account: signup, login, and a stored collapse threshold
- [ ] Build the Chrome extension popup so a logged-in user can pick a threshold
- [ ] Implement the in-thread collapse: on news.ycombinator.com, the extension hides or collapses comments whose score is above the user's threshold
- [ ] Build the live flagged page that subscribes to new flags and renders them as they arrive
- [ ] Write tests for the ingest worker (mocked HN endpoint) and the threshold logic (real flagged fixtures)
- [ ] Write the "how it works" page that documents the pipeline, the modified guidelines text, and the threshold model

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Submit the Chrome extension to the Chrome Web Store
- [ ] Smoke-test: install the extension, set a threshold, load a real HN thread, and confirm flagged comments collapse as expected

---

_Generated automatically by Lúa on 2026-08-26_
