---
id: "3876"
slug: "murmell-collaborative-cloud-canvas-for-coding-agents"
title: "Murmell – Collaborative cloud canvas for coding agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499167"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Cloud VM session orchestration, Exclusive file leases with TTL, Realtime collaborative canvas, Terminal multiplexing, Container loopback token proxy, Session snapshot and restore]
---
# Murmell – Collaborative cloud canvas for coding agents

## Phase 0: Scaffold

- [x] Read the Show HN post: hackathon origin, collision problem, canvas per cloud machine, claiming, snapshot/restore, token proxy, 50% pricing
- [x] Write SPEC.md (this document)
- [x] Write PRODUCT.md: value proposition, stakeholder table, JTBD, metrics, pricing and risks
- [x] Write PLAN.md: tech stack, architecture, M0-M3 milestones and risks

## Phase 1: Core

- [ ] Harden the file-claim lease system: TTL expiry, denial routing and claim hand-off under concurrent agent traffic
- [ ] Exercise the write watcher: make cross-claim collisions appear on the canvas at write time
- [ ] Verify snapshot and restore end to end: shutdown a busy canvas VM, return, confirm branches, dev server and terminal history survive
- [ ] Test the loopback token proxy against leaked-token scenarios

## Phase 2: Deploy

- [ ] Run the infrastructure at cost with real paying customers and measure margin per canvas
- [ ] Revisit the 50% launch pricing once feedback is in
- [ ] Publish what the platform costs to run versus what it earns

---

_Generated automatically by Lúa on 2026-08-30_
