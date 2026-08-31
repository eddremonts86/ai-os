---
id: "3862"
slug: text-logo-create-text-logos-and-wordmarks-in-the-browse
title: Text Logo – create text logos and wordmarks in the browser
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500673"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [SVG vector rendering, Per-character color editing, Web font loading, Client-side export pipeline, Template gallery, Browser-only editor]
---
# Text Logo – create text logos and wordmarks in the browser

## Problem

The poster presents Text Logo, an online editor for creating distinctive text logos, wordmarks and typography logos entirely in the browser. The tool offers editable fonts, per-character colors, icons, shapes and templates, and exports to SVG, PNG, WebP or ICO. The pitch is capability-first: a founder, small business owner or creator without vector-graphics software can compose a distinctive wordmark and take away production-ready files. The capture is a feature list; it states no pricing, no user counts and no roadmap.

## Objective

Turn the stated feature list into a working, browser-only wordmark editor: editable fonts, per-character color control, icons and shapes, a template gallery, and export to the four named formats (SVG, PNG, WebP, ICO), with no server dependency for the core editing flow.

## Target Users

- Indie founders and small businesses that need a production wordmark quickly, without hiring a designer.
- Non-designer creators publishing on social platforms or marketplaces who want a distinctive text-based brand mark.
- Designers who sketch wordmark variations quickly, using per-character colors and font swaps instead of rebuilding in a vector editor.

## MVP Scope

- Browser-only editor: text composition, editable fonts and per-character colors.
- Icon and shape placement, plus a template gallery.
- Export to SVG, PNG, WebP and ICO.
- No accounts and no server dependency for core editing.

## Constraints

- The capture is a feature list; pricing, traffic and roadmap are unstated, so the MVP stays inside the listed capabilities.
- Everything must run client-side, including font handling and the four export encoders.
- Export scope is exactly the four formats named in the post: SVG, PNG, WebP, ICO.
- Desktop browser is the natural target; the post makes no mobile claim.

## Design Direction

See `DESIGN.md` for this project's design tokens.
