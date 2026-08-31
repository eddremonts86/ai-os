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

## Value Proposition

Make your screen feel like paper. Deckle lays a subtle paper-grain texture over the whole display, breaking up the uniform glow that makes long sessions feel like staring at glass, while every pixel of your work stays clickable because the overlay is fully click-through. It is a menu bar app, free and open source, with a library of papers and an editor for making your own.

**One-liner:** A macOS menu bar app that overlays paper texture onto your screen and keeps everything clickable.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Long-session readers and writers | A softer, paper-like surface for hours of text work. |
| Eye-comfort seekers who distrust marketing | An honest matte texture that explicitly avoids medical claims. |
| Open-source macOS enthusiasts | An MIT-licensed menu bar utility with a small, readable Swift codebase. |
| Multi-Mac households | A universal binary covering Apple Silicon and Intel Macs on macOS 13+. |

The post is URL-only; the segments above are inferred from the repository's positioning.

## Jobs To Be Done

1. **Functional job** — Apply a paper texture over the full screen from the menu bar, with adjustable intensity.
2. **Functional job** — Keep working normally: the overlay must not intercept any click.
3. **Functional job** — Choose among built-in papers or create and preview a custom blend before saving.
4. **Emotional job** — Turn the screen from glass-like harshness into something that feels calm and handmade.

## Success Metrics

- **Activation:** share of first-run users who keep an overlay enabled after the first session.
- **Library use:** downloads per built-in paper and custom papers saved in Paper Mill.
- **Interaction safety:** zero reported cases of the overlay blocking input (the click-through promise).
- **Distribution:** GitHub stars, release downloads and macOS version spread across the universal build.

## Pricing & Monetization

None stated. Free and open source under the MIT license; the README asks for a GitHub star as its only payment.

## Competitive Landscape

The post does not name competitors. The category is macOS eye-comfort and screen-tinting utilities (blue-light filters, dimmers, reading modes); Deckle's stated difference is that it is a matte texture overlay rather than a color filter, and that it makes no health claims — the paper grain is positioned as aesthetics plus comfort, not medicine.

## Risks & Open Questions

- [ ] Aesthetic taste risk: paper grain is subjective; some users will find it noise rather than comfort.
- [ ] macOS windowing constraints may make a click-through, always-on-top overlay fragile across OS updates.
- [ ] The effect competes with free OS-level options (Night Shift, True Tone) that need no install.
- [ ] Single-maintainer open-source project with no monetization; long-term support is unstated.
- [ ] Custom paper blends could look wrong on different panels (color, DPI) unless previewed on the real display, which the editor must handle.
