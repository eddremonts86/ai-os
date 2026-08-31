---
id: "3883"
slug: "podiom-durable-sessions-scheduling-and-goals-for-local-"
title: "Podiom – durable sessions, scheduling and goals for local Claude/Codex"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49498323"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Local agent orchestration layer, Durable session storage, Scheduler, MCP tool integration, CLI agent integration, Goal tracking]
---
# Podiom – durable sessions, scheduling and goals for local Claude/Codex

## Phase 0: Scaffold

- [x] Read the capture: URL-only Show HN pointing at github.com/Podiom/Podiom; retrieved the repo description (thin orchestration layer, durable sessions, profiles, scheduling, MCP/tool/skill integration)
- [x] Write SPEC.md (this document)
- [x] Write PRODUCT.md: value proposition, stakeholder table, JTBD, metrics, pricing and risks
- [x] Write PLAN.md: tech stack, architecture, M0-M3 milestones and risks

## Phase 1: Core

- [ ] Implement durable session capture and restore for local Claude and Codex runs
- [ ] Build the scheduler and verify a run fires without manual supervision
- [ ] Add goal tracking that persists across sessions
- [ ] Wire MCP servers, tools and skills through the orchestration layer

## Phase 2: Deploy

- [ ] Add profiles per project or per agent
- [ ] Publish setup docs for local Claude and Codex users
- [ ] Collect feedback from real local-agent users on what the layer gets wrong

---

_Generated automatically by Lúa on 2026-08-30_
