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

## Tech Stack

Chosen for a zero-backend, export-heavy editor; the capture states capabilities, not libraries.

- **SVG rendering:** the canvas and the vector export share one scene model.
- **Per-character color editing:** style overrides scoped to individual glyphs.
- **Web font loading:** editable typefaces with local fallbacks.
- **Client-side export pipeline:** PNG, WebP and ICO encoders alongside the SVG serializer.
- **Template gallery:** preset compositions bundled as static assets.
- **Browser-only deployment:** static hosting, no server state.

## Architecture

- **Editor canvas:** text objects with per-character style overrides; icons and shapes as sibling objects.
- **Font pipeline:** web font loading with fallbacks, keeping typography editable without a server.
- **Export layer:** one scene model, four encoders (SVG serializer plus rasterizers for PNG, WebP, ICO).
- **Template layer:** presets that seed the editor state and stay editable after insertion.

## Milestones

1. **M0 — Editor shell.** Static app with text entry, font selection and per-character color on a sample wordmark.
2. **M1 — Composition features.** Icons, shapes and the template gallery wired into the editor.
3. **M2 — Full export set.** SVG, PNG, WebP and ICO with correct fidelity; vector output round-trips.
4. **M3 — Public launch.** Deploy the static editor and open a feedback loop for font and template depth.

## Risks

- **Font licensing:** bundled web fonts must be redistributable, or the catalog shrinks fast.
- **Export fidelity:** rasterized PNG/WebP versus vector SVG behave differently for the same mark.
- **Commodity category:** parity with free generators is the floor, not a moat.
- **No revenue model stated:** the project's economics are undefined.
