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

## Problem

A Mac user got tired of opening apps or folders, searching something on a website, running a script, opening a recent file, switching to another app, taking a screenshot, or running a shortcut from completely different places. They built a radial menu utility — a single big radial pie with slices for app launcher, clipboard, screenshot, shortcut, recent file. The product is already on the Mac App Store as a launchable product. The implicit product: a SwiftUI radial menu utility for macOS with multi-display hit-testing and action chains.

## Objective

Define the MVP scope for the radial menu utility as already shipped on the Mac App Store. The plan re-documents the product surface for a reader who might rebuild it. The MVP has to demonstrate the round-trip: trigger → radial pie → slice → action.

## Target Users

- **Primary:** macOS power users who already use Spotlight, Raycast, Alfred, or similar launchers and want a single-keyboard-shortcut entry point.
- **Secondary:** designers and developers who take screenshots frequently and want a one-step capture flow.
- **Tertiary:** anyone who runs the same multi-step action chain multiple times a day.

## MVP Scope

- Trigger: a configurable global keyboard shortcut (default: Ctrl+Space or a custom hotkey).
- Radial pie with configurable slices: app launcher, clipboard history, screenshot, shortcut, recent file, custom action.
- Multi-display hit-testing: the pie appears at the cursor position on whichever display the cursor is on.
- Action chains: a slice can trigger multiple actions (e.g. take screenshot + open in editor + copy path to clipboard).
- $9.99 one-time with a 7-day trial.
- Excluded in v1: Windows build, Linux build, sync between machines, cloud config.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single radial surface — the big circular pie with the slices arranged around the cursor. Minimal chrome; the product is the pie.

## Constraints

- The radial pie must appear in under 100ms from trigger; latency is the failure mode.
- Multi-display hit-testing must work on every macOS display configuration (including mixed-DPI).
- The action-chain system must be serialisable so a chain can be exported and imported.
