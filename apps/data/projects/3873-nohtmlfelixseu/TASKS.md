---
id: "3873"
slug: nohtmlfelixseu
title: Nohtml.felixs.eu
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499459"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [CSS-only rendering, SVG animation, Content-type tricks, Chromium rendering quirks, Single-file demo, Static hosting]
---
# Nohtml.felixs.eu

## Phase 0: Scaffold

- [x] Read the Show HN capture and record the no-HTML and no-JS claim plus the Chromium exception
- [x] Write SPEC.md (this document)
- [x] Reproduce the demo locally from the live page
- [x] Inventory the tricks used to render without HTML or JavaScript

## Phase 1: Core

- [ ] Write up each trick in the published source and docs
- [ ] Test across browsers and document the Chromium shim requirement

## Phase 2: Deploy

- [ ] Publish the annotated source alongside the demo
- [ ] Track third-party reproductions and ports
- [ ] Fix breakage when browser updates change behavior
