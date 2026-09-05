---
id: "4194"
slug: that-works-find-a-time-that-works-for-the-whole-group
title: "That works - Find a time that works for the whole group"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509567"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# That works - Find a time that works for the whole group

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4194-that-works-find-a-time-that-works-for-the-whole-group/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] React landing page with three-step hero flow and example event
- [ ] TanStack Start API for event create, share-link resolve, and reply storage
- [ ] SQLite + Drizzle schema for events, candidate slots, and per-cookie replies
- [ ] Short opaque share token generator (≥ 80 bits entropy)
- [ ] Calendar grid with tap-to-mark interaction on mobile
- [ ] Live overlay showing how many people fit each slot via SSE
- [ ] Confirmation message generator with copy-to-clipboard
- [ ] Time-zone normalisation on read, organiser zone captured at create

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Optional: lightweight rate limiting per IP for share-link creation