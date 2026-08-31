---
id: "3735"
slug: any-command
title: Any Command
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/any-command-remote-control-for-pc"
category: product-launch
date: "2026-08-23"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Any Command

## Phase 0: Scaffold

- [x] Read the ProductHunt listing to confirm the one-window stream, the Bluetooth no-install mode, the widget / file-transfer / clipboard / CPU-RAM surfaces, and the no-account contract
- [x] Write SPEC.md (this document)
- [x] Verify the network-mode agent is genuinely optional and no install wall blocks a Bluetooth first run
- [x] Scaffold the Windows capture component and the Android app with a local-network transport stub

## Phase 1: Core

- [ ] Implement one-window capture and streaming over the local network
- [ ] Route taps, scrolls, and keyboard input back to the chosen window only
- [ ] Implement Bluetooth HID mode (keyboard and mouse) with nothing installed on the PC
- [ ] Add the trackpad with gestures, the software keyboard, the gamepad mapping, and the shortcut panel
- [ ] Add clipboard sync, file transfer, the home-screen widget, and the live CPU / RAM readout
- [ ] Report non-remotable windows (games, sandboxed apps, DRM media) honestly instead of failing silently
- [ ] Surface per-session RTT so a degraded link is visible

## Phase 2: Deploy

- [ ] Ship the free tier with no account and no telemetry tied to identity
- [ ] Publish the Premium price or tier before the listing drives meaningful traffic
- [ ] Ship auto-update and a rollback surface for the single-developer delivery path

---

_Generated automatically by Lúa on 2026-08-29_
