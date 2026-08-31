---
id: "3862"
slug: text-logo-create-text-logos-and-wordmarks-in-the-browse
title: Text Logo – create text logos and wordmarks in the browser
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500673"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [SVG vector rendering, Per-character color editing, Web font loading, Client-side export pipeline, Template gallery, Browser-only editor]
---
# Text Logo – create text logos and wordmarks in the browser

## Phase 0: Scaffold

- [x] Read the Show HN capture and list the stated features and the four export formats
- [x] Write SPEC.md (this document)
- [x] Scaffold the editor project folder and static hosting config
- [x] Stand up the SVG canvas with a sample wordmark rendering

## Phase 1: Core

- [ ] Implement editable fonts and per-character color overrides
- [ ] Add icon and shape placement into the canvas
- [ ] Build the template gallery and seed it with starter compositions
- [ ] Wire the SVG, PNG, WebP and ICO export encoders

## Phase 2: Deploy

- [ ] Deploy the static editor to production hosting
- [ ] Instrument exports per format and median time to first export
- [ ] Settle font licensing and decide whether any pricing model applies before paywalling anything
