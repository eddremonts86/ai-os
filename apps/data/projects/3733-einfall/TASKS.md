---
id: "3733"
slug: einfall
title: Einfall
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/einfall-a-place-for-fugitive-thoughts"
category: product-launch
date: "2026-08-24"
tags: [ProductHunt, Product Launch]
wtp:
  raw: $29.99 one-time for unlimited routing (15 free routing actions)
  currency: USD
  period: one-shot
  min: 29.99
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Einfall

## Phase 0: Scaffold

- [x] Read the ProductHunt listing to confirm the capture surfaces, the routing targets, the 15-free / $29.99 pricing, and the no-account / no-server claim
- [x] Write SPEC.md (this document)
- [x] Confirm the native Swift / SwiftUI stack decision against the legacy captured tech field
- [x] Scaffold the Mac app with the menu-bar capture surface and the local stream store

## Phase 1: Core

- [ ] Build the Mac capture surface: menu bar, single field, fast keyboard path
- [ ] Build iPhone and iPad capture: share sheet, Spotlight, widget, and Siri / Shortcuts into the same stream
- [ ] Implement the flat stream store with on-device sync across Apple devices
- [ ] Implement routing to Reminders, Calendar, and files with the Obsidian daily-note format
- [ ] Implement routing to a user-configured Shortcut
- [ ] Wire the 15-routing-action counter and the one-time $29.99 StoreKit unlock
- [ ] Surface Apple permission denials honestly instead of silently swallowing them

## Phase 2: Deploy

- [ ] Ship the local MCP server on the Mac exposing the stream to the user's own agent
- [ ] Submit the Mac, iPhone, and iPad apps to the App Store
- [ ] Run an external privacy review confirming zero bytes of captured thoughts leave the devices

---

_Generated automatically by Lúa on 2026-08-29_
