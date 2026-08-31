---
id: "3827"
slug: live-ai-video-streams-that-write-themselves-one-shot-at
title: Live AI video streams that write themselves one shot at a time
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493966"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Generative video model inference, shot-by-shot generation loop, HLS streaming pipeline, prompt queue, GPU backend, web player]
---
# Live AI video streams that write themselves one shot at a time

## Phase 0: Scaffold

- [x] Read the Show HN capture and confirm it is URL-only, with the product claim in the title
- [x] Write SPEC.md (this document)
- [x] Set up a generation worker that produces one video shot
- [x] Serve a minimal web page that plays a single generated shot

## Phase 1: Core

- [ ] Build the shot-by-shot loop: generate the next shot while the current one plays
- [ ] Package output as HLS so the stream plays continuously and viewers can join mid-stream
- [ ] Add a prompt queue that decides what the next shot is
- [ ] Add monitoring for generation-vs-playback rate and cost

## Phase 2: Deploy

- [ ] Publish the channel at its public URL and keep it live
- [ ] Measure continuity and generation-to-air lag over long sessions
- [ ] Decide content guardrails and the cost story for continuous generation

---

_Generated automatically by Lúa on 2026-08-30_
