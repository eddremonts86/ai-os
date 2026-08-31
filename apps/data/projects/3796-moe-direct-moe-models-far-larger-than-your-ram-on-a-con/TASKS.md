---
id: "3796"
slug: moe-direct-moe-models-far-larger-than-your-ram-on-a-con
title: "Moe-Direct – MoE Models far larger than your RAM, on a consumer desktop"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492409"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [MoE expert caching, SSD/RAM/VRAM tiering, on-demand expert loading, consumer inference engine, Windows test rig]
---
# Moe-Direct – MoE Models far larger than your RAM, on a consumer desktop

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the reference rig, decode results and Windows-only status
- [x] Write SPEC.md (this document)
- [x] Make the Windows build reproducible: setup steps, model setup, measurement commands documented
- [x] Record the mmap baseline for the same binaries on the reference rig

## Phase 1: Core

- [ ] Reproduce Kimi K2.6 (1.03 tok/s) and Qwen3.5-122B (5.59-5.69 tok/s) decodes on the reference rig
- [ ] Instrument expert-cache behavior: hit rate, SSD-to-RAM transfer volume per decode
- [ ] Recruit external testers and collect their hardware results and failures
- [ ] Prioritize the "many problems" the poster says remain, starting with ones that block first-time use

## Phase 2: Deploy

- [ ] Stand up Linux and macOS test environments (the named missing platforms)
- [ ] Publish a per-model, per-hardware results table instead of single-rig claims
- [ ] Decide licensing and maintenance story for the project

---

_Generated automatically by Lúa on 2026-08-29_
