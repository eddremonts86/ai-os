---
id: "4161"
slug: d5s-an-ai-coworking-space-for-people-and-agents
title: "D5s, an AI coworking space for people and agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511513"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# D5s, an AI coworking space for people and agents

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copy `edd-app-template` → `apps/4161-d5s-an-ai-coworking-space-for-people-and-agents/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the workspace/coworker data model and a workspace-creation flow.
- [ ] Wire role-scoped access tokens for the first integration (Slack).
- [ ] Add a coworker runner that observes a workspace queue and executes allowed actions.
- [ ] Ship Gmail adapter with the same scope guarantees as Slack.
- [ ] Implement the reference invoice-processing workflow end-to-end.
- [ ] Build a free early-access signup page with credit balance tracking.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
