---
id: "4207"
slug: three-slicer-i-ported-orcaslicer-to-run-in-the-browser
title: "Three Slicer, I ported OrcaSlicer to run in the browser"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508763"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Three Slicer, I ported OrcaSlicer to run in the browser

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4207-three-slicer-i-ported-orcaslicer-to-run-in-the-browser/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Port the OrcaSlicer kernel to WebAssembly with the COOP/COEP cross-origin isolation setup; build the two kernel builds behind the isolation boundary; wire the byte-identical G-code parity gate as the per-commit CI check.
- [ ] Port the PrusaSlicer 2.9.6 resin kernel to WebAssembly; wire the support-point generator, the support tree, the pad, the `.sl1` archive output, and the layer-mask preview.
- [ ] Implement the input format support: STL, OBJ, 3MF, AMF, PLY (direct); STEP (lazy loader); `.sl1` (openable).
- [ ] Build the arrange surface: move, rotate, scale, duplicate, split to objects, place on bed, multi-plate layout.
- [ ] Build the slice surface: the 976-option OrcaSlicer settings with the simple / advanced / expert filter; surface settings-coverage gaps as first-class warnings.
- [ ] Build the preview surface: the layer slider, the single-layer view, the travel moves, the toolpath colouring by feature, speed, layer height, extrusion width, fan speed, or temperature.
- [ ] Build the export surface: G-code (filament), `.sl1` (resin), `.3mf` (project that keeps plate layout, settings, painting).
- [ ] Publish the npm package `three-slicer` under AGPL-3.0-or-later with the headless slicing kernel for Node or browser and the optional React viewer and settings panel.
- [ ] Build the integration demos at `/demos`: the instant-quote form, the printer showcase, the CAD page, each embedding the npm package.
- [ ] Document the no-upload guarantee in the README and on the slicer.kimgh06.com landing page.
- [ ] Run an end-to-end test: a user opens slicer.kimgh06.com, drops an STL file, arranges it on the bed, picks the Arachne wall and tree-support settings, slices, previews the layer, exports the G-code, confirms the model file never left the machine; an embedder consumes the npm package in an instant-quote form and confirms the byte-identical G-code parity with the desktop OrcaSlicer.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy the browser slicer at slicer.kimgh06.com with the WebAssembly kernel behind the cross-origin isolation
- [ ] Publish `three-slicer` to npm under AGPL-3.0-or-later with the integration demos in the README
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
