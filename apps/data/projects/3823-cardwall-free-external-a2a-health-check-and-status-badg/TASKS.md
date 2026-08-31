---
id: "3823"
slug: cardwall-free-external-a2a-health-check-and-status-badg
title: Cardwall – free external A2A health check and status badge for agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494495"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [A2A protocol health checks, periodic ping worker, SVG status badges, self-hosted card metadata, agent card wall UI, lightweight read-only probes]
---
# Cardwall – free external A2A health check and status badge for agents

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the wall-of-cards design and the data-stays-on-the-owner's-machine claim
- [x] Write SPEC.md (this document)
- [x] Implement a minimal A2A client that can issue a read-only health-check call to an agent endpoint
- [x] Stand up a page that renders one agent card

## Phase 1: Core

- [ ] Add a periodic check worker that probes registered agents on a fixed cadence
- [ ] Render a wall of cards, each showing its agent's last check result
- [ ] Generate SVG status badges per agent, refreshed on each probe
- [ ] Move card metadata to be served from each owner's machine instead of a central store
- [ ] Guard the probe endpoint against misuse (rate limits, target allowlisting)

## Phase 2: Deploy

- [ ] Open the wall publicly and invite A2A agent owners to register
- [ ] Publish the badge embed snippet and document the health-check protocol
- [ ] Decide the cost story for keeping a free service online

---

_Generated automatically by Lúa on 2026-08-30_
