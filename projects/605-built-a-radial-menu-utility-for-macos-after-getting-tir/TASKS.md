---
tags: ["saas", "macos", "utility", "swift"]
tech: ["SwiftUI", "Swift", "NSEvent", "NSScreen", "StoreKit 2"]
id: "605"
slug: built-a-radial-menu-utility-for-macos-after-getting-tir
title: Built a radial menu utility for macOS after getting tired of jumping between different tools
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vovskv/built_a_radial_menu_utility_for_macos_after/"
category: saas
date: "2026-08-15"
---
# Built a radial menu utility for macOS after getting tired of the existing options

## Phase 0: Scaffold

- [ ] Create a fresh Xcode project `apps/605-built-a-radial-menu-utility-for-macos-after-getting-tir/` (SwiftUI app lifecycle, macOS 14+)
- [ ] Initialize git and add `.gitignore` excluding `*.xcuserdata`, `DerivedData`, `.build`
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens
- [ ] Wire the global hotkey listener (`NSEvent.addGlobalMonitorForEvents`)
- [ ] Implement multi-display hit-testing (`NSScreen.screens` + cursor position)
- [ ] Provision the StoreKit 2 in-app purchase product ID

## Phase 1: Core

- [ ] Radial pie with configurable slices: app launcher, clipboard history, screenshot, shortcut, recent file, custom action
- [ ] Multi-display hit-testing on every macOS display configuration
- [ ] Action chains: a Swift package that serialises an array of typed actions to JSON
- [ ] Action chain export / import
- [ ] $9.99 one-time with 7-day trial via StoreKit 2

## Phase 2: Deploy

- [ ] Mac App Store submission
- [ ] First 200 sales via Product Hunt launch
- [ ] 90-day latency audit on mixed-DPI displays
- [ ] Post-mortem at week 7
