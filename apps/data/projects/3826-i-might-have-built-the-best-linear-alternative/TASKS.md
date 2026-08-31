---
id: "3826"
slug: i-might-have-built-the-best-linear-alternative
title: I might have built the best Linear alternative
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494058"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Self-hosted tracker server, SQL database, agent-facing board API, model key passthrough, AGPL-3.0 open-source license, board workspace UI]
---
# I might have built the best Linear alternative

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the AGPL-3.0, self-hosting and no-seats claims
- [x] Write SPEC.md (this document)
- [x] Scaffold the tracker server with a SQL database and an issue model
- [x] Render a minimal board UI for human users

## Phase 1: Core

- [ ] Implement the agent-facing API for reading and writing board items
- [ ] Wire model key passthrough so agents run on the operator's credentials
- [ ] Make single-server self-hosting smooth on the user's own database
- [ ] Ensure no seat counter or seat limit exists anywhere in the product
- [ ] Write docs that make the shared human-agent workflow obvious

## Phase 2: Deploy

- [ ] Publish the source under AGPL-3.0 with install instructions
- [ ] Invite self-hosters and agent teams to try it and report friction
- [ ] Measure what matters: self-host installs and agent-driven board usage

---

_Generated automatically by Lúa on 2026-08-30_
