---
id: "3649"
slug: consequence-gate-agent-governance-based-on-what-being-w
title: Consequence Gate – agent governance based on what being wrong costs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483616"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, Pydantic, SQLite, PostgreSQL, Anthropic API, OpenAI API, Docker]
---
# Consequence Gate – agent governance based on what being wrong costs

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3649-consequence-gate-agent-governance-based-on-what-being-w/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Define the typed consequence schema with reversibility, blast radius, target and side effects
- [ ] Implement the cost function that maps a consequence to a stated level
- [ ] Build the gate wrapper that returns allow, log, escalate-to-reviewer, escalate-to-second-model or block
- [ ] Ship the reviewer service with a pending queue and an approve-or-reject UI
- [ ] Add the second-model escalation as a pluggable provider with a budgeted token cost
- [ ] Persist every gated action in the audit store with consequence, policy decision and resolution
- [ ] Make the gate fail closed on unknown consequence, missing reviewer and unreachable second model
- [ ] Add a test suite that proves the gate escalates or blocks on every failure path, not allows
- [ ] Document the embedding surface so the library drops in as a decorator or wrapper, not a re-architecture
- [ ] Add a replay view that lets a reviewer step through a past gated action with its consequence and policy

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
