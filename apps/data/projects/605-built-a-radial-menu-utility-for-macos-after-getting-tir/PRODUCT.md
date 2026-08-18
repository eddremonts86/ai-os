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

> Product brief for the macOS radial menu utility scoped in the source post.

## Value Proposition

A macOS power user can trigger a single global hotkey, see a radial pie of their most-used actions, and click a slice to launch the action — including multi-step action chains — without leaving the current app.

## Target Users

| Stakeholder | Why they care |
|---|---|
| macOS power users | Already use Spotlight / Raycast / Alfred; want a single-keyboard-shortcut entry point. |
| Designers and developers | Take screenshots frequently; want a one-step capture flow. |
| Anyone running repeated multi-step actions | Want a one-shot trigger. |

## Jobs To Be Done

1. **Functional job** — Trigger a single hotkey and see the radial pie.
2. **Functional job** — Click a slice to run a single action or a chain.
3. **Functional job** — Configure the slices and the action chains.

## Success Metrics

- **Activation:** first radial pie triggered within 7 days of install.
- **Retention:** at least 10 pie triggers per active user per week.
- **Conversion:** ≥ 4% trial-to-paid conversion within 14 days.

## Pricing & Monetization

$9.99 one-time with a 7-day trial.

## Competitive Landscape

- **Raycast / Alfred** — full launcher; the radial pie is a focused alternative for users who want one-hotkey access.
- **Spotlight** — built-in; less configurable.
- **Manual shortcuts + muscle memory** — what power users do today.

## Risks & Open Questions

- [ ] B2C single-purchase caps money; the visual / interaction polish is the genuine fun payoff.
- [ ] The multi-display hit-testing must work on every macOS display configuration.
