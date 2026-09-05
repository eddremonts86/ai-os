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

## Problem

3D printing slicers have to be installed, the user's model gets uploaded to a server, and the slicing runs on someone else's machine. Three Slicer converts STL, OBJ, 3MF, AMF, PLY and STEP models into G-code directly in the browser, using a WebAssembly build of the OrcaSlicer kernel. There is nothing to install and nothing is uploaded to a server — the slicing runs on the user's own machine, in the tab. The same engine is published to npm as `three-slicer` under AGPL-3.0-or-later, with a headless slicing kernel for Node or the browser, an optional React viewer, and integration demos that show it embedded in an instant-quote form, a printer showcase, and a CAD page.

The source is slicer.kimgh06.com. The kernel is a port of OrcaSlicer, itself a PrusaSlicer and Slic3r descendant. Arachne wall generation, tree supports, multi-material segmentation, and the prime tower are ported from that source rather than reimplemented, so the toolpaths come from the same code a desktop slicer runs. The resin support-point generator, support tree, and pad are ported from PrusaSlicer 2.9.6 the same way. Resin printers (mSLA) are a second technology in the same kernel: support points, support tree, and pad, previewed as layer masks and written out as an `.sl1` archive, which can also be opened again.

The slicer reads STL, OBJ, 3MF, AMF, and PLY directly; STEP is read through a loader that is only fetched when a STEP file is actually opened; an `.sl1` resin archive can be opened as well. The output is G-code for filament printers, or an `.sl1` archive for resin ones. The settings are the full OrcaSlicer option set, 976 options, with search and a simple / advanced / expert filter. Arachne variable-width walls, gyroid / honeycomb / crosshatch infill, tree and grid supports, support painting, material painting, skirt, brim, raft, ironing, arc fitting, multi-material printing with a real prime tower.

The source is explicit about what the port does not do: it does not upload the model, does not require an account, does not require a server-side queue, and does not require the user to install software. The model file never leaves the machine it was opened on.

The source names the actor (a 3D printer owner or service provider who needs to slice a model for filament or resin printing), the pain (desktop slicer install, model upload to a server, no in-browser option that runs the same kernel), and the missing thing (an in-browser slicer with the OrcaSlicer / PrusaSlicer kernel, AGPL-licensed, npm-distributed, and embeddable in third-party sites). It does not name a specific printer brand, a specific resin-printer integration, or a specific commercial offering.

## Objective

Build the Three Slicer in-browser 3D printing slicer with the OrcaSlicer kernel ported to WebAssembly, supporting STL, OBJ, 3MF, AMF, PLY, and STEP input; G-code for filament and `.sl1` for resin output; the full 976-option OrcaSlicer settings with simple / advanced / expert filter; and an npm-distributed AGPL-licensed kernel for Node or browser embedding.

## Target Users

- 3D printer owners who need to slice a model for filament or resin printing without installing desktop software.
- 3D printing service providers who need an embeddable slicer kernel for an instant-quote form, a printer showcase, or a CAD page.
- Users who do not want their model uploaded to a server-side queue.
- PrusaSlicer / OrcaSlicer users who want a browser-native option that runs the same kernel with the same settings.
- Resin-printer (mSLA) users who need a browser-native slicer with support points, support tree, and pad from PrusaSlicer 2.9.6.

## MVP Scope

- A browser-based slicer at slicer.kimgh06.com with the OrcaSlicer kernel ported to WebAssembly.
- A WebAssembly build that runs in the browser tab without installing software.
- The COOP/COEP cross-origin isolation setup the source names as part of the port, with two kernel builds behind the isolation boundary.
- Input formats: STL, OBJ, 3MF, AMF, PLY (read directly), STEP (read through a loader that is only fetched when a STEP file is actually opened), and `.sl1` resin archive (openable).
- Output formats: G-code for filament printers, `.sl1` archive for resin printers, `.3mf` project that keeps the plate layout, settings, and painting.
- Arrange: move, rotate, scale, duplicate, split to objects, place on bed, and lay out across multiple plates.
- Slice features for filament: Arachne variable-width walls, gyroid / honeycomb / crosshatch infill, tree and grid supports, support painting, material painting, skirt, brim, raft, ironing, arc fitting, and multi-material printing with a real prime tower.
- Slice features for resin (mSLA): support points, support tree, and pad from PrusaSlicer 2.9.6's own chain, previewed as layer masks.
- Preview: a layer slider and single-layer view, travel moves, and toolpath colouring by feature, speed, layer height, extrusion width, fan speed, or temperature.
- Settings: the full OrcaSlicer option set, 976 options, with search and a simple / advanced / expert filter.
- npm package `three-slicer` under AGPL-3.0-or-later, with a headless slicing kernel for Node or browser, plus an optional React viewer and settings panel.
- Integration demos at `/demos`: an instant-quote form, a printer showcase, and a CAD page.
- The byte-identical G-code gate the port is checked against (the source's porting writeup names this as the verification).
- The no-upload guarantee: the model file never leaves the machine it was opened on.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The kernel is a port of OrcaSlicer. Arachne, tree supports, multi-material segmentation, and the prime tower come from OrcaSlicer rather than a reimplementation; the source is explicit about this.
- The resin kernel is a port of PrusaSlicer 2.9.6. Support points, support tree, and pad come from PrusaSlicer 2.9.6's own chain rather than a reimplementation.
- The browser kernel is WebAssembly. The slicing runs in the browser tab on the user's machine; no server-side queue, no account, no model upload.
- The COOP/COEP cross-origin isolation is required for the WebAssembly build. The two kernel builds the source names sit behind the isolation boundary.
- The supported input formats are STL, OBJ, 3MF, AMF, PLY (direct), STEP (lazy loader), and `.sl1` (openable). An input format outside the list is a coverage gap.
- The supported output formats are G-code (filament), `.sl1` (resin), and `.3mf` (project). An output format outside the list is a coverage gap.
- The full OrcaSlicer settings (976 options) are exposed with a simple / advanced / expert filter. A hidden option is a settings-coverage gap.
- The npm package is `three-slicer` under AGPL-3.0-or-later. The plan does not invent a commercial license the source does not name.
- The model file never leaves the machine it was opened on. A slice that uploads the model is a no-upload guarantee breach.
