---
id: "3195"
slug: eink-optimized-manga-with-kindle-comic-converter-koboko
title: eInk Optimized Manga with Kindle Comic Converter (+Kobo/KOreader)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451982"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# eInk Optimized Manga with Kindle Comic Converter (+Kobo/KOreader)

## Value Proposition

Kindle Comic Converter optimizes black & white (or color) comics and manga for E-ink ereaders like Kindle, Kobo, ReMarkable, and more. Pages display in fullscreen without margins, with proper fixed layout support. KCC runs on Windows, macOS, and Linux.KCC's main goal is maximum image quality at significantly smaller file size. For example, KCC1) can compress a 600 MB manga volume from Humble Bundle to 100 MB. This is mostly accomplished by downscaling to the native resolution of your specific device. This can also improve battery life, page turn speed, and general performance on underpowered ereaders with small memory and storage capacities.2) fixes black levels to avoid gray/faded blacks found in many Kindle Store manga3) fixes the rainbow effect on Kaleido 3 color eink without blur using the Discrete Fourier Transform (community PR)It can also semi-automatically join pre-split 2 page spreads and has several KOreader optimizations as well.

**One-liner:** A cross-platform e-ink comic converter that downsamples to the device's native resolution (turning a 600 MB Humble Bundle volume into 100 MB), fixes the gray-black and Kaleido-3-rainbow problems that generic converters miss, joins two-page spreads, and supports KOreader.

## Target Users

- Primary: manga and comic readers on Kindle, Kobo, ReMarkable and similar e-ink readers who want smaller, sharper files and care about e-ink-specific quirks (faded blacks, color rainbow effect) that generic converters do not handle.
- Secondary: KOreader users who want device-specific optimizations baked in.

## Jobs To Be Done

1. Functional — take a comic or manga and produce an output tuned to the user's specific e-ink device, fullscreen and at native resolution.
2. Emotional — keep the reader on a slow, low-storage device without forcing them to pick between "fits the screen, looks washed out" and "sharp, but eats 600 MB of storage".
3. Social — share a converted volume without worrying the file is unopenable on someone else's reader, because the output uses a fixed-layout container the readers handle.

## Success Metrics

- File-size reduction on the same source: the source's example is 600 MB → 100 MB; the tool should at least hit that kind of ratio on a Humble Bundle volume.
- Output correctness: the file opens fullscreen without margins on the target device and the black levels and color-eink artifacts are actually fixed (visible on the device, not in a thumbnail).
- Adoption in the KOreader community, where the source notes there are also KOreader-specific optimizations.

## Pricing & Monetization

Not stated in the source. The post is a project announcement on Hacker News; no price, plan, or commercial intent is named.

## Competitive Landscape

Not stated in the source. The source names e-ink readers (Kindle, Kobo, ReMarkable) and KOreader but does not name any other comic-to-ereader converter.

## Risks & Open Questions

- Device-profile drift: new Kindle, Kobo and ReMarkable models arrive each year; the device-resolution profile database has to keep up, or the "native resolution" claim silently breaks.
- DFT-based Kaleido 3 fix relies on a community PR; if the PR goes unmaintained, the color-eink fix becomes a stale artifact rather than a current one.
- Spread-joining heuristics are "semi-automatic" per the source; wrong joins (e.g. joining pages that were not intended as a spread) are a real risk and need an easy undo.
- Cross-platform packaging (Win / Mac / Linux) is non-trivial; native-resolution processing of a 600 MB volume on low-end hardware can also be slow.
