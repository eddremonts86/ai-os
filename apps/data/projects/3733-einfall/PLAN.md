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

## Tech Stack

Chosen for a capture-first native product with no server anywhere in the loop — the maker built it while learning Swift, and the captured JavaScript stack is legacy.

- **Swift / SwiftUI:** native Mac, iPhone, and iPad apps.
- **Local-first stream store:** thoughts live on-device across the user's Apple devices; no server, no account.
- **Apple integration surfaces:** menu bar, share sheet, Spotlight, widgets, Shortcuts, and Siri.
- **Routing targets:** Reminders, Calendar, files (including the Obsidian daily-note format), and user-configured Shortcuts.
- **Local MCP server (macOS):** exposes the stream to the user's own AI agent on the Mac.
- **StoreKit IAP:** the one-time $29.99 unlimited-routing unlock after 15 free routing actions.

## Architecture

- **Capture surfaces:** one field with a fast keyboard path on Mac; share sheet, Spotlight, widget, and Siri / Shortcuts on iPhone and iPad.
- **Flat stream:** no folders, no nesting, no unread counts — one trusted inbox.
- **Routing engine:** sends a thought to Reminders, Calendar, a file, a Shortcut, or the local agent, with Apple permission requests surfaced honestly.
- **Free-tier counter:** 15 routing actions, then the one-time IAP; capture itself is never gated.
- **MCP bridge (Mac-only):** the local agent reads the stream and the user decides what it acts on.

## Milestones

1. **M0 — Mac capture.** The menu-bar surface parks a thought in the on-device stream.
2. **M1 — iOS and iPad parity.** Share sheet, widget, Spotlight, and Siri / Shortcuts feed the same stream.
3. **M2 — Routing.** Reminders, Calendar, file, and Shortcut routing ship with the 15-action counter and the $29.99 IAP.
4. **M3 — MCP release.** The local Mac MCP server exposes the stream to the user's own agent.

## Risks

- **Privacy claim fragility:** any future backend sync or analytics SDK breaks "no account, no server, no data collected".
- **iOS-to-agent dead end:** routing from an iPhone to the agent requires the Mac; the product must not imply otherwise.
- **Counter resentment:** the 15-action cap must be defined so users understand the count and find it generous.
- **One-time revenue:** $29.99 once means sustained income needs a steady pipeline of new users.
- **Early-Swift codebase:** a v1 Swift codebase by a learner benefits from external review before scale.
