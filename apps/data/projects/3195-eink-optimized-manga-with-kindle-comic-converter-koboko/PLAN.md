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

## Tech Stack

- **GUI:** cross-platform desktop app — Electron or Tauri in TypeScript, so the same UI ships on Windows, macOS, and Linux as the source requires.
- **Image pipeline:** Python with Pillow + numpy + OpenCV (or a Rust rewrite of the same) for the heavy per-page work — downscaling, black-level correction, and the DFT-based Kaleido 3 rainbow fix.
- **Device profiles:** a versioned JSON/YAML registry of supported e-ink readers and their native resolutions, kept up to date as new models appear.
- **Spread detection:** image-content heuristics (aspect ratio, gutter whitespace) that flag two-page spreads for joining, with an undo path.
- **Output containers:** EPUB / KEPUB (for Kindle), CBZ / KEPUB (for Kobo / KOreader), with the fixed-layout metadata readers require.
- **DB:** SQLite locally for the per-conversion job log and the user's device profile; no remote backend.

## Architecture

```
Comic / manga folder (or .cbz)
            │
            ▼
   Page loader ──▶ Device profile (target resolution)
            │
            ▼
   Per-page image pipeline
       ├─ downscale to native resolution
       ├─ black-level correction
       ├─ Kaleido 3 DFT rainbow fix (when applicable)
       └─ spread-join heuristic
            │
            ▼
   Container packager (EPUB / KEPUB / CBZ)
            │
            ▼
   Output file + per-job log (SQLite)
```

- The device profile is the single source of truth for target resolution; the source's 600 MB → 100 MB claim comes from this downscaling step, so any change to the profile changes the result.
- The DFT-based Kaleido 3 fix is opt-in per device profile; it only runs when the profile says the target is a Kaleido 3 reader.
- The GUI wraps the pipeline so the same binary ships across the three operating systems named in the source.

## Milestones

1. **M0 — Spec + design tokens + device-profile registry.** Existing SPEC.md and DESIGN.md approved; device-profile JSON is the contract.
2. **M1 — Core image pipeline.** Downscale to native resolution; output a valid EPUB for one device (the canonical Kindle profile).
3. **M2 — Black-level correction + DFT Kaleido 3 fix.** Both wired into the pipeline behind per-device flags.
4. **M3 — Spread-joining with manual undo.** The user can review flagged spreads before joining or override the heuristic.
5. **M4 — Multi-profile output.** Kobo, ReMarkable, and KOreader profiles added, each with the right container format.
6. **M5 — Cross-platform GUI.** Electron / Tauri app that runs the pipeline and surfaces the job log on Windows, macOS, and Linux.

## Risks

- Profile drift: a new Kindle or Kobo model ships and the tool silently produces an off-resolution file until someone updates the profile. Profile-version pinning needs to be visible to the user.
- DFT quality: the source calls out that the fix must work "without blur" — a naive DFT-based denoise can soften line art; the implementation needs to be tested against real Kaleido 3 panels.
- Spread-joining false positives: an over-eager joiner will mash two unrelated pages together; the source describes this as "semi-automatic" so the UI must let the user inspect and undo.
- Cross-platform packaging: signing the macOS and Windows builds and keeping all three platforms' dependency chains working is an ongoing maintenance burden.
