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

## Tech Stack

Chosen for a native macOS layer above Spaces — the listing's "Built With: Xcode, Figma" pins the real stack, and the captured JavaScript defaults are legacy.

- **Swift / SwiftUI / AppKit:** the native macOS runtime for capture, recall, and the switcher.
- **Accessibility / window-list APIs:** the source of window positions and sizes, and the way they are restored.
- **On-device layout store:** named workspaces persist locally; no cloud sync is advertised.
- **Menu bar and widget surfaces:** the switcher entry points named in the listing.
- **Scheduling layer (roadmap):** time-of-day layout activation is listed as roadmap and kept out of the MVP.

## Architecture

- **Capture service:** enumerates the windows of supported apps, records their positions and sizes, and saves the result as a named layout.
- **Recall engine:** restores every remembered window to its captured position and size on demand.
- **Switcher UI:** lists the saved layouts for recall with a single click or keyboard shortcut.
- **Entry points:** a menu-bar item and a home-screen widget for one-tap recall.
- **Honest failure surface:** detects apps that opted out of the window-list APIs and reports which ones did not participate.

## Milestones

1. **M0 — Capture and recall.** A layout saves as a named workspace and restores with a shortcut.
2. **M1 — Entry points.** The menu-bar switcher and the widget both recall layouts in one action.
3. **M2 — Fidelity.** At least 95% of restored windows land at captured position and size; non-cooperating apps are reported honestly.
4. **M3 — Paid launch.** The free trial or paid unlock ships; time-of-day scheduling stays on the roadmap.

## Risks

- **Cooperative APIs:** Electron and sandboxed apps that disable accessibility will not round-trip; the MVP must say so instead of promising completeness.
- **Spaces overlap:** positioning against Mission Control as a complement has to stay clear in all messaging.
- **Roadmap creep:** scheduling and iPadOS are named in the listing and are the most likely scope traps.
- **Free-tier cap friction:** a layout cap that forces an upgrade before the value is felt will backfire with single-monitor users.
- **Layout trust:** one bad restore teaches users not to rely on the product as their actual desk.
