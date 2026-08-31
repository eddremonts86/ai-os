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

## Problem

The capture is a URL-only Show HN post pointing at the Deckle GitHub repository; the product claim is the title. The repo is verifiable: Deckle is a free, open-source (MIT) macOS menu bar app, written in Swift, that lays a subtle paper-grain texture over the entire screen so long reading and writing sessions feel more like paper than glass. It ships 18 built-in paper textures, lets users tune intensity, and its Paper Mill editor can blend and preview custom papers before saving; the overlay stays click-through so every pixel of work remains interactive. The README is careful to position it as a matte texture, not a medical blue-light filter.

## Objective

Package the paper-overlay idea as a polished macOS utility: a menu bar app that applies a paper texture over the screen, keeps the overlay invisible to clicks, and ships enough built-in papers plus a custom-paper editor that users can shape the effect to their display.

## Target Users

- Long-form readers and writers on macOS who find uniform screen backlight harsh and want a softer, paper-like surface.
- Mac users who want eye-comfort tweaks that are cosmetic and honest about what they do (the README refuses medical claims).
- Tinkerers who like open-source menu bar utilities they can build and modify themselves.

## MVP Scope

- Menu bar app on macOS 13+ running on Apple Silicon and Intel.
- Full-screen paper-grain overlay with adjustable intensity and click-through behavior.
- A library of built-in paper textures (the repo lists 18 across three families).
- A Paper Mill editor that blends and previews custom papers before saving.
- MIT-licensed source with a packaged release and download stats.

## Constraints

- The Show HN post itself is URL-only; all feature detail comes from the repository README, which is the verifiable source.
- macOS-only by design; no Windows or Linux port is mentioned.
- The README explicitly disclaims medical benefit: blue-channel reduction estimates are design guidance, not a health claim, and the product must not drift into claiming one.
- Texture and intensity must not reduce readability or block interaction; the click-through guarantee is the core usability promise.

## Design Direction

See `DESIGN.md` for this project's design tokens.
