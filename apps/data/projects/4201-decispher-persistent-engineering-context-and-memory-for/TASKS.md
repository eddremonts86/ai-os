---
id: "4201"
slug: decispher-persistent-engineering-context-and-memory-for
title: Decispher – persistent engineering context and memory for coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509142"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Decispher – persistent engineering context and memory for coding agents

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copy `edd-app-template` → `apps/4201-decispher-persistent-engineering-context-and-memory-for/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Context Engine connectors for GitHub, Jira and Slack.
- [ ] Ship the Memory Plane with per-user/team/project memory sets.
- [ ] Build the Worker Agent sandbox with an allowlisted proxy and post-run destroy step.
- [ ] Implement Branch Story so each AI session writes a structured PR handoff.
- [ ] Add the VS Code/OpenVSX extension for viewing context and writing handoffs.
- [ ] Publish the LongMemEval harness so reviewers can reproduce the 89% / 81% / 38x claims.
- [ ] Wire `npx decispher init` and `npx decispher link` flows.
- [ ] Document the security and purge policy in the README.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
