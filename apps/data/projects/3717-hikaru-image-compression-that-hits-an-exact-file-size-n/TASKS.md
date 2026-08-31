---
id: "3717"
slug: hikaru-image-compression-that-hits-an-exact-file-size-n
title: "Hikaru – image compression that hits an exact file size, no slider"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488339"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Image, Compression]
tech: [TypeScript, Vite, browser-image-compression, OffscreenCanvas, Web Workers]
---
# Hikaru – image compression that hits an exact file size, no slider

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the target-size positioning, the 8 KB testimonial, and the entirely-in-browser claim
- [x] Write SPEC.md (this document)
- [x] Pick the quality and dimension floors at which the tool warns that the target is unreachable
- [x] Scaffold the Vite project with the worker and OffscreenCanvas layout and no server endpoints

## Phase 1: Core

- [ ] Implement the decode, OffscreenCanvas resize, and re-encode convergence loop
- [ ] Meet the at-most-5-iterations constraint on a 4 MB JPEG on a mid-range laptop
- [ ] Add PNG and WebP handling, including transparency, with explicit floor warnings
- [ ] Build the target-size input (fixed KB or percentage) and the side-by-side preview
- [ ] Add the session-only history panel
- [ ] Verify Safari does not stall on large transparent PNGs through the OffscreenCanvas pipeline

## Phase 2: Deploy

- [ ] Deploy the static build and confirm zero network calls during a compression run
- [ ] Measure convergence and accuracy against the PRODUCT.md targets (within 2% of target, at most 6 seconds per run)
- [ ] Decide the percentage-mode question with real usage data before any paid-tier work

---

_Generated automatically by Lúa on 2026-08-29_
