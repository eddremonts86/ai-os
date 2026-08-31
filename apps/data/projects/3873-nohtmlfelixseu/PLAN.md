---
id: "3873"
slug: nohtmlfelixseu
title: Nohtml.felixs.eu
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499459"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [CSS-only rendering, SVG animation, Content-type tricks, Chromium rendering quirks, Single-file demo, Static hosting]
---
# Nohtml.felixs.eu

## Tech Stack

Chosen for the constraint itself — no HTML structure, no JavaScript; the capture names no libraries.

- **CSS-only rendering:** the visual layer without markup structure.
- **Styling-driven animation:** the dino game loop expressed without scripts.
- **Content-type tricks:** serving the asset so the browser renders it as a page.
- **Chromium-specific shim:** the small HTML exception the post admits.
- **Static hosting:** a single file served as-is.

## Architecture

- **Served asset:** delivered under a content type the browser renders without an HTML document.
- **Styling and animation layer:** reproduces the dino runner's visuals and motion.
- **Input handling:** works within the no-script constraint.
- **Chromium shim:** the minimal HTML the engine forces on Chromium-based browsers.

## Milestones

1. **M0 — Reproduction.** The existing demo is reproduced from source and runs in a browser.
2. **M1 — Documentation.** Each trick is explained in the published writeup.
3. **M2 — Exception handling.** The Chromium shim is shrunk or clearly explained.
4. **M3 — Publish.** The annotated source ships and reproductions are invited.

## Risks

- **Browser churn:** undocumented rendering quirks break with updates.
- **Limited audience:** a demo, not a business — the plan's ceiling is attention, not revenue.
