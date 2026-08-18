---
id: "605"
slug: built-a-radial-menu-utility-for-macos-after-getting-tir
title: Built a radial menu utility for macOS after getting tired of jumping between different tools
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vovskv/built_a_radial_menu_utility_for_macos_after/"
category: saas
date: "2026-08-15"
tags: [saas, macos, utility, swift]
tech: [SwiftUI, Swift, NSEvent, NSScreen, StoreKit 2]
---
# Built a radial menu utility for macOS after getting tired of the existing options

## Tech Stack

- **macOS app:** SwiftUI + Swift 5.10, macOS 14+ deployment target.
- **Trigger:** a global hotkey listener using `NSEvent.addGlobalMonitorForEvents`.
- **Multi-display hit-testing:** `NSScreen.screens` + cursor position via `NSEvent.mouseLocation`.
- **Action chains:** a Swift package that serialises an array of `Action` values to JSON for export.
- **Payments:** Mac App Store in-app purchase (StoreKit 2).

## Architecture

Single SwiftUI app. The radial pie is a separate window that appears on top of every other window; the action-chain system is a JSON-serialisable array of typed actions.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the existing app re-documented. End of week 1.
2. **M1 — Action chains + export / import.** End of week 3.
3. **M2 — Multi-display hit-testing hardening.** End of week 5.
4. **M3 — Mac App Store submission + trial flow.** End of week 7.

## Risks

- **Latency** — the pie must appear in under 100ms from trigger; a slow pie is a non-starter.
- **Multi-display edge cases** — mixed-DPI, retina, virtual displays; the hit-testing must be tested against every config.
