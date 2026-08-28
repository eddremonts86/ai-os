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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3195-eink-optimized-manga-with-kindle-comic-converter-koboko/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the device-profile registry (JSON files keyed by device model → native resolution)

## Phase 1: Core

- [ ] Implement the per-page image pipeline: load, downscale to native resolution, write back
- [ ] Add black-level correction so output blacks are not the gray/faded blacks the source calls out
- [ ] Wire the DFT-based Kaleido 3 rainbow fix behind a per-device flag
- [ ] Implement the spread-detection heuristic and a manual review UI so the user can approve, skip, or undo joins
- [ ] Implement the container packager (EPUB / KEPUB / CBZ) with fixed-layout metadata
- [ ] Add Kobo, ReMarkable, and KOreader profiles alongside the canonical Kindle profile
- [ ] Add per-conversion SQLite job log so the user can see what was done to each volume
- [ ] Write tests for the downscaling math, the DFT fix, and the spread heuristic with a fixture set

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Build the cross-platform GUI shell (Electron or Tauri) so the same binary runs on Windows, macOS, and Linux
- [ ] Wire signing for macOS and Windows builds
- [ ] Deploy to Coolify (for the docs / release site, not the desktop binary itself)
- [ ] Verify in production
- [ ] Smoke-test: convert a 600 MB Humble Bundle volume on each of the three operating systems and confirm it lands near the 100 MB mark on the target device profile

---

_Generated automatically by Lúa on 2026-08-26_
