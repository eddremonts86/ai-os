---
id: "3728"
slug: cursor-craft-v2
title: Cursor Craft v2
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/cursor-craft"
category: product-launch
date: "2026-08-22"
tags: [ProductHunt, Product Launch]
tech: [macOS app, Swift or Objective-C, cursor asset pack, installer]
---
# Cursor Craft v2

## Phase 0: Scaffold

- [x] Create the project folder under `apps/`
- [x] Initialise the git repo
- [x] Copiar `edd-app-template` → `apps/3728-cursor-craft-v2/`
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md (tokens + visual direction)
- [x] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [x] Set up the development environment
- [x] Read the ProductHunt page at producthunt.com/products/cursor-craft to confirm the URL-only framing and check the v2 delta

## Phase 1: Core

- [ ] Lock what "rebuilt" means concretely: list the cursors that changed and what changed
- [ ] Design v2 cursors for every standard macOS role, with dark / light variants where the role allows
- [ ] Implement the installer (in-app or packaged) and a "restore defaults" path
- [ ] Publish the v1 → v2 upgrade terms on the project site
- [ ] Test against the current macOS release(s), including dark / light mode

## Phase 2: Deploy

- [ ] Ship via the chosen channel (App Store, direct download, or both)
- [ ] Set up the update channel for v2 (App Store updates or a signed updater)
- [ ] Publish a clear list of cursors included, the price, and the upgrade terms

---

_Generated automatically by Lúa on 2026-08-29_
