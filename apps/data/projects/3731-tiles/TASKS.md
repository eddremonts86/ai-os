---
id: "3731"
slug: tiles
title: Tiles
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/tiles-5"
category: product-launch
date: "2026-08-22"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tiles

## Phase 0: Scaffold

- [x] Read the ProductHunt listing to confirm the save-and-restore named-layout pitch, the menu-bar and widget entry points, and the roadmap-only scheduling
- [x] Write SPEC.md (this document)
- [x] Confirm the native stack decision (Swift / SwiftUI / AppKit via Xcode and Figma) against the legacy captured tech field
- [x] Scaffold the macOS app with a window-list probe that reports which apps cooperate with the APIs

## Phase 1: Core

- [ ] Implement layout capture: window positions and sizes saved as a named workspace
- [ ] Implement recall: restore every remembered window with a click and a keyboard shortcut
- [ ] Build the menu-bar switcher listing saved layouts
- [ ] Build the home-screen widget for one-tap recall
- [ ] Add the non-participating-app report so missed windows are named, not silent
- [ ] Measure restoration fidelity against the 95% target on real multi-app layouts

## Phase 2: Deploy

- [ ] Ship the free trial or paid unlock on the Mac App Store
- [ ] Verify on-device persistence and the absence of cloud sync as advertised
- [ ] Keep time-of-day scheduling on the roadmap until the core save-and-recall loop proves itself

---

_Generated automatically by Lúa on 2026-08-29_
