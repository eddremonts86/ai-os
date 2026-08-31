---
id: "3730"
slug: lubb
title: Lubb
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/lubb-heartbeat-for-sleep"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Lubb

## Phase 0: Scaffold

- [x] Read the ProductHunt listing to confirm the Taptic-Engine lub-dub, the 10-minute nightly trial, and the no-account / no-analytics posture
- [x] Write SPEC.md (this document)
- [x] Confirm the runtime stack decision: Swift / SwiftUI over Core Haptics, with Remotion kept to launch video only
- [x] Scaffold the iOS project with the Core Haptics dependency and a single heartbeat screen

## Phase 1: Core

- [ ] Implement the lub-dub haptic pattern with pace and feel tuning
- [ ] Build the 10-minute nightly trial with auto-stop and an explicit start tap
- [ ] Implement the pillow-mode UI: face-down, minimal screen, and timer
- [ ] Add hardware detection for weak or missing Taptic Engines with honest messaging
- [ ] Wire the StoreKit path for post-trial paid sessions
- [ ] Audit the binary for analytics SDKs, network calls, and login walls — none allowed

## Phase 2: Deploy

- [ ] Submit to the App Store as a free app with the trial
- [ ] Set the internal targets for trial completion and seven-night return from the PRODUCT.md metrics
- [ ] Decide and publish the post-trial mechanic before any marketing push

---

_Generated automatically by Lúa on 2026-08-29_
