---
id: "3160"
slug: vyukov-mpsc-queue-in-c20-with-a-six-claim-formal-memory
title: Vyukov MPSC queue in C++20 with a six-claim formal memory-model proof
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447000"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Vyukov MPSC queue in C++20 with a six-claim formal memory-model proof

## Phase 0: Scaffold

- [ ] Header-only directory layout
- [ ] Implement the queue with the six invariants documented inline
- [ ] Markdown write-up of the six claims
- [ ] One benchmark vs a hand-written baseline
- [ ] README plus the proof walkthrough
- [ ] No design system
- [ ] CI matrix on GCC and Clang

## Phase 1: Core

Implement queue, draft six-claim proof, write README, ship benchmark on a multi-core machine.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify (or chosen host)
- [ ] Verify in production
