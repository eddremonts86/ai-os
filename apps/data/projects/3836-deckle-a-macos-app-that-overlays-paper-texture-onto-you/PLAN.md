---
id: "3836"
slug: deckle-a-macos-app-that-overlays-paper-texture-onto-you
title: Deckle – A macOS app that overlays paper texture onto your screen
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492914"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Swift, SwiftUI menu bar app, Always-on-top screen overlay, Click-through window handling, Texture blending pipeline, macOS 13+ universal binary]
---
# Deckle – A macOS app that overlays paper texture onto your screen

## Tech Stack

- **Swift:** the repository's language; a small native codebase suits a menu bar utility.
- **SwiftUI menu bar app:** popover UI for status, intensity and the paper library.
- **Always-on-top screen overlay:** a borderless window above all others that shows the texture.
- **Click-through window handling:** input passes through the overlay to the app beneath.
- **Texture blending pipeline:** papers rendered with intensity and blend modes onto the display.
- **macOS 13+ universal binary:** Apple Silicon and Intel in one release, per the repository badges.

## Architecture

- **Menu bar entry:** a tiny status item; the popover exposes live status, intensity and quick controls.
- **Overlay window:** a single borderless, always-on-top layer with mouse events ignored (click-through).
- **Paper library:** bundled textures grouped in families, shown in a scrollable picker.
- **Paper Mill editor:** blends and previews a paper on the real display, shows estimated blue-channel reduction and contrast retention as guidance, then saves.
- **Settings:** intensity, per-paper defaults and launch-at-login state persisted locally.

## Milestones

1. **M0 — Overlay core.** Menu bar app renders a click-through full-screen texture on macOS 13+.
2. **M1 — Paper library.** The built-in texture families ship with intensity controls and picker UI.
3. **M2 — Paper Mill.** Custom paper blending with live preview and the guidance metrics, then save.
4. **M3 — Distribution.** MIT release packaged as a universal binary with a demo GIF and download page.

## Risks

- **Overlay fragility across macOS updates:** window level and input passthrough behavior can change.
- **Subjective appeal:** the grain that helps one user annoys another; intensity defaults matter.
- **No revenue model:** the project depends on goodwill and stars.
- **Per-display variance:** textures tuned on one panel may look wrong on another.
