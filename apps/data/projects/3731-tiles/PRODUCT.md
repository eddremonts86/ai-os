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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

On a single monitor, no window manager on the market preserves the user's *intent*. Either you snap windows into a grid (and rebuild the grid every time you switch contexts), or you use macOS Spaces (and find the windows inside a Space scattered on return). Tiles sits one level above both: a user saves the layout for an entire mode of work — "Development," "Writing," "Support" — and recalls that layout with one click, one shortcut, or one widget tap, instead of rebuilding it window by window. The ProductHunt listing frames the result as "calm and intentionality" for the single-display experience; that is the value, not faster window-snapping.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Single-monitor macOS power user | Spends the day switching between development, design, and writing; loses focus to window housekeeping after every alt-tab. |
| Existing Spaces user | Likes macOS multi-desktop but finds their layouts forgotten when a Space is left and reopened. |
| Returning multi-display user | Wants back the "different monitor = different mode" feeling without buying a second display. |
| Maker (Zach Olsen) | Validates that "persistent named layouts" is a separable, paid layer above macOS Spaces, not just a window-manager feature. |
| ProductHunt visitor | Comparing Tiles to Magnet, Rectangle, and Moom, and looking for the layer above them. |

## Jobs To Be Done

1. **Functional job** — Switch between modes of work without rebuilding a desktop layout every time.
2. **Emotional job** — Stop the low-grade frustration of "where did my window go, again?" each time the user changes tasks.
3. **Social job** — Be able to show a clean, organised desk when pairing, recording a screencast, or joining a meeting, instead of an alt-tabbed chaos.

## Success Metrics

- **Activation:** a user captures at least 2 distinct layouts in their first session (proxy: the product has been understood as "named layouts," not "snap windows").
- **Daily use:** a median user activates Tiles ≥ 8 layout switches per active day (proxy: the product is part of the daily routine, not a one-off).
- **Restoration fidelity:** ≥ 95% of restored windows land within their captured position and size (proxy: the layout is reliable enough that the user trusts it as their actual desk).
- **Setup abandonment:** ≤ 10% of users create only one layout in their first week and never create a second (a "single layout = not understanding the product" signal).

## Pricing & Monetization

The ProductHunt listing shows "Payment Required" without a number, so no `wtp` field is set. Plausible monetisation surfaces for a native macOS productivity tool in this position:

- **One-time unlock** — a single App Store IAP that unlocks unlimited layouts beyond a free-tier cap (e.g. free tier = 3 layouts, paid = unlimited + time-of-day scheduling).
- **Subscription** — a low monthly / yearly fee that bundles scheduling, widget surfaces, and a future iPadOS version.
- **Per-feature add-ons** — paid separately for "time-of-day scheduling" and "advanced widget surfaces" once those land.

## Competitive Landscape

- **macOS Spaces (built-in)** — gives the user multiple desktops, but does not remember the layout *inside* a desktop; Tiles adds that preserved-layout layer.
- **Window-snapping apps (Magnet, Rectangle, Moom, Swish)** — snap individual windows to halves / quarters / thirds of the screen. They do not save an entire layout as a unit, and switching between layouts is still manual. Magnet is referenced in the listing context.
- **Layout-preserving macOS apps (Mosaic, Stay, Window Tidy)** — closer to Tiles' actual category; the differentiator in Tiles' pitch is "frictionless state management" and feeling native to macOS, rather than a grid editor.
- **Multi-display users (Displays, Luna Display)** — solve the same problem at the hardware layer by adding a second screen; Tiles targets the user who does not want to buy one.
- **Mission Control / Stage Manager (macOS built-in)** — system-level overview tools; Tiles complements them as a persistence layer.

## Risks & Open Questions

- [ ] Window-list APIs on macOS are partially cooperative. Apps that opt out (Electron apps that disable AX, full-screen apps, sandboxed apps) will not round-trip through Tiles cleanly; the MVP needs to communicate this honestly, not promise completeness it cannot deliver.
- [ ] The roadmap surface in the listing (time-of-day scheduling, future iPadOS) is real but unproven revenue. Each roadmap item is an opportunity for scope creep that delays the core "save and recall a layout" value.
- [ ] A free-tier layout cap (if implemented) is the most likely friction point with single-monitor users who already feel they are paying for less than they used to get from a second display. The cap should be a number that lets the user *understand* the product, not a number that forces an upgrade before the value is felt.
- [ ] The ProductHunt listing shows "Built With: Xcode, Figma" — that is a native macOS stack (Swift / SwiftUI / AppKit). The captured `tech` frontmatter lists a JavaScript stack by default; that is legacy and not the runtime stack the maker is actually using.
