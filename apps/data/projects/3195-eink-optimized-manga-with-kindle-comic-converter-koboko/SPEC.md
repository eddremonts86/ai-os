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

## Problem

Kindle Comic Converter optimizes black & white (or color) comics and manga for E-ink ereaders like Kindle, Kobo, ReMarkable, and more. Pages display in fullscreen without margins, with proper fixed layout support. KCC runs on Windows, macOS, and Linux.KCC's main goal is maximum image quality at significantly smaller file size. For example, KCC1) can compress a 600 MB manga volume from Humble Bundle to 100 MB. This is mostly accomplished by downscaling to the native resolution of your specific device. This can also improve battery life, page turn speed, and general performance on underpowered ereaders with small memory and storage capacities.2) fixes black levels to avoid gray/faded blacks found in many Kindle Store manga3) fixes the rainbow effect on Kaleido 3 color eink without blur using the Discrete Fourier Transform (community PR)It can also semi-automatically join pre-split 2 page spreads and has several KOreader optimizations as well.

## Objective

Build a cross-platform tool (Windows, macOS, Linux) that takes a black & white or color comic or manga and produces an e-ink-optimized file for the user's specific Kindle, Kobo, ReMarkable, or other supported reader — fullscreen, native-resolution, smaller file, with black levels and color-eink artifacts fixed and two-page spreads joined where appropriate.

## Target Users

1. Manga and comic readers on Kindle, Kobo, ReMarkable and similar e-ink readers who want their files smaller and sharper without doing the conversion by hand, and who care about the specific quirks of e-ink (faded blacks, color rainbow effect) that generic tools do not handle.
2. KOreader users who want their device's reader-specific optimizations baked into the output as well.

## MVP Scope

- Convert a single manga or comic volume into an e-ink-friendly file targeted at the user's chosen device profile.
- Downscale to the native resolution of the specific device, which the source cites as the main reason a 600 MB Humble Bundle volume becomes 100 MB.
- Black-level correction so the output does not show the gray/faded blacks found in many Kindle Store manga.
- Color-eink Kaleido 3 rainbow fix using the Discrete Fourier Transform (the community PR mentioned in the source).
- Semi-automatic detection and joining of pre-split two-page spreads.
- KOreader-specific output options.
- Cross-platform GUI on Windows, macOS, and Linux.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Stay focused on the source's three named wins: smaller files via native-resolution downscaling, black-level correction, and Kaleido 3 rainbow removal via DFT. Other "improvements" not in the source are out of scope.
- Cross-platform from day one (Win / Mac / Linux), not a single-platform port.
- The DFT-based color fix is a community PR, so the contributor path needs to remain open.
- No lock-in to a specific store or DRM; the tool operates on files the user already has.
