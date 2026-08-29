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

## Tech Stack

- **Distribution:** a macOS app or a packaged installer delivered via the project site and / or the Mac App Store. The exact channel (App Store, direct download, or both) is a product decision.
- **Native macOS code:** Swift (or Objective-C for legacy parts) so cursor installation hooks into the OS the way the user expects.
- **Cursor assets:** PNG / PDF cursor source files sized and aligned to macOS conventions, including dark / light variants where the role allows it.
- **Installer surface:** an in-app "install cursors" flow plus a "restore defaults" option so the user can roll back without manual file-shuffling.
- **Update channel:** App Store updates if distributed there, or a signed updater (Sparkle or equivalent) if distributed direct. The choice is part of the v2 "rebuilt" promise.
- **Landing page:** a project site that publishes the cursor set, the price, and the v1 → v2 upgrade terms.

## Architecture

```
┌────────────┐    ┌────────────┐    ┌────────────┐
│ Installer  │───▶│ Cursor     │───▶│ macOS      │
│ (app or    │    │ assets     │    │ cursor     │
│  pkg)      │    │ (PNG/PDF)  │    │ system     │
└────────────┘    └────────────┘    └────────────┘
                                              │
                                              ▼
                                       ┌────────────┐
                                       │ Update     │
                                       │ channel    │
                                       │ (App Store │
                                       │  or signed)│
                                       └────────────┘
```

The user runs the installer, the cursors land where macOS expects them, and the update channel keeps v2 current without re-buying.

## Milestones

1. **M0 — Delta agreement.** Lock what "v2 rebuilt" means concretely: which cursors changed, what the installer does differently, and what the update story is.
2. **M1 — Cursor set + installer.** Every standard macOS cursor role has a v2 design; the installer drops them in place and registers them with the OS.
3. **M2 — Update channel.** The chosen update path (App Store or signed updater) delivers v2 to v1 buyers according to the published terms.
4. **M3 — Landing page.** The project site publishes the cursor list, the price, and the upgrade terms clearly, not buried.

## Risks

- **"Rebuilt" without a delta.** If v2 is just a version bump, the re-launch reads as marketing and the social contract with v1 buyers frays.
- **macOS convention drift.** Apple tightens cursor handling every few releases; the pack must be tested against the current macOS, not just the version it was originally built on.
- **Upgrade story ambiguity.** v1 buyers left guessing about whether v2 is free, discounted, or a new purchase will surface as a trust problem.
- **Cloning risk.** Cursor packs are easy to copy; the differentiator has to be ongoing curation and updates, not the asset bundle.
- **App Store review friction.** If distributed via the Mac App Store, cursor-related installs may draw extra review attention; the installer flow must be honest about what it touches.
