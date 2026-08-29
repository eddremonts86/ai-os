---
id: "3708"
slug: slidex-open-source-presentations-with-mdx
title: SlideX – Open-source presentations with MDX
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49486406"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [MDX, local-first installer, AI-agent compatible]
---
# SlideX – Open-source presentations with MDX

## Phase 0: Scaffold

- [x] One-command installer live at `slidexdeck.com` (macOS + Windows).
- [x] Open-source repo at `github.com/zz41354899/open-slidex`.
- [x] Bilingual landing page (English, Traditional Chinese).
- [ ] Pin a published SHA for every binary the installer downloads.
- [ ] Decide renderer shape: Tauri (smaller binary, Rust core) vs Electron (faster MDX toolchain parity).

## Phase 1: Core

- [ ] MDX parser: read a `./slides` directory, parse `01.mdx`, `02.mdx`, …, resolve `components/` imports.
- [ ] Live preview: file-watcher + hot reload on every MDX change.
- [ ] Theme system: a CSS file in the project root, the renderer applies it to every slide.
- [ ] Presenter mode: full-screen, keyboard navigation (left/right arrows, escape to exit), presenter notes via a separate `*.notes.mdx` file.
- [ ] AI-agent authoring guide: a `WRITING_SLIDES.md` in the repo that documents the on-disk shape so an agent can produce a deck by writing files.
- [ ] Tests:
 - MDX parser regression: every sample deck in `examples/` parses and renders without error.
 - File-watcher regression: editing an MDX file triggers a preview refresh within one second.
 - Presenter regression: keyboard navigation works in full-screen, notes do not appear on the audience-facing display.

## Phase 2: Deploy

- [ ] Native binaries signed and notarised for macOS (notarisation is a hard requirement) and signed for Windows.
- [ ] Installer scripts pinned to a specific binary SHA, surfaced in the install line itself for transparency.
- [ ] GitHub Releases pipeline: every tag publishes signed binaries and updates the SHA pin in the install line.
- [ ] Smoke test in production: install on a clean macOS VM with no developer tools, open the app, load a sample deck, present full-screen, exit cleanly.
