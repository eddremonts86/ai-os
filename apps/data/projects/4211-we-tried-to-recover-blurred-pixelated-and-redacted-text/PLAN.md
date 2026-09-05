---
id: "4211"
slug: we-tried-to-recover-blurred-pixelated-and-redacted-text
title: "We tried to recover blurred, pixelated and redacted text (480 cases)"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508614"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# We tried to recover blurred, pixelated and redacted text (480 cases)

## Tech Stack

- React + TypeScript single-page app for the blur tool
- TanStack Start as the Node.js API for the blog and the study reproduction kit
- SQLite with Drizzle ORM for the CC-BY reference dataset metadata
- Coolify + Docker to self-host
- Browser Canvas or WebGL for the blur / pixelate / box redaction pipeline
- Python (stdlib + numpy) for the study reproduction
- CC-BY dataset and code published alongside the blog
- Optional: Tauri or Electron wrapper for the desktop overlay

## Architecture

The blur tool runs entirely in the browser. The user picks a region; the tool defaults to a solid-box redaction (the only treatment that leaked nothing). A "blur" or "pixelate" toggle is available but warned against unless the parametric rule (radius ≥ 0.8 × font size) is met. The blog renders the study methodology, the 480-case results table, and the parametric rule. The reproduction kit lives at a stable URL with the dataset, the Python recovery code, and the README.

## Milestones

1. Browser-local blur / pixelate / box pipeline
2. Parametric rule check tied to font size
3. Default to solid-box redaction with a clear warning on weaker treatments
4. Study blog with methodology, results table, and parametric rule
5. CC-BY dataset and reproduction kit published
6. Optional desktop overlay for live demos, calls, and screen recordings

## Risks

- Users will still pick the wrong treatment despite the warning
- Parametric rule assumes known font / size / position
- JPEG recompression path is one of many; the study is narrow
- Desktop overlay UX is harder than browser-only