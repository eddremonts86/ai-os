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

## Tech Stack

- **OrcaSlicer (port)** as the slicing kernel for filament printers (Arachne walls, tree supports, multi-material segmentation, prime tower, infill, painting, skirt / brim / raft, ironing, arc fitting).
- **PrusaSlicer 2.9.6 (port)** as the slicing kernel for resin (mSLA) printers (support points, support tree, pad).
- **WebAssembly** as the compile target for both kernels, running in the browser tab on the user's machine.
- **COOP/COEP cross-origin isolation** as the setup the WebAssembly build requires, with two kernel builds behind the isolation boundary.
- **The byte-identical G-code gate** as the per-commit CI check that verifies the browser output matches the desktop output byte-for-byte.
- **An optional React viewer and settings panel** for the npm package, with the headless kernel usable in Node or browser without the viewer.
- **The `three-slicer` npm package** under AGPL-3.0-or-later.
- **The integration demos** (instant-quote form, printer showcase, CAD page) at `/demos`.
- **The browser slicer** at slicer.kimgh06.com.

## Architecture

The architecture has three surfaces: the WebAssembly kernel, the optional React viewer, and the integration layer. The kernel is the unit of trust the slicer ships; the viewer is the unit of choice the user sees; the integration layer is the unit of embed the npm package exposes.

The WebAssembly kernel has two builds behind the COOP/COEP cross-origin isolation boundary. The first build is the full OrcaSlicer kernel for filament printers; the second is the PrusaSlicer 2.9.6 kernel for resin printers. The byte-identical G-code gate is the per-commit verification that the browser output matches the desktop output byte-for-byte; the partial-link build groups and the TBB header stub are the build-system pieces the source's porting writeup names.

The optional React viewer wraps the kernel with the arrange / slice / preview / export surfaces. The arrange surface reads the input file (STL, OBJ, 3MF, AMF, PLY directly; STEP via the lazy loader; `.sl1` as an openable archive) and lets the user move, rotate, scale, duplicate, split to objects, place on bed, and lay out across multiple plates. The slice surface exposes the full 976-option OrcaSlicer settings with the simple / advanced / expert filter. The preview surface shows the layer slider, the single-layer view, the travel moves, and the toolpath colouring by feature, speed, layer height, extrusion width, fan speed, or temperature. The export surface writes G-code, `.sl1`, or `.3mf`.

The integration layer is the npm package `three-slicer` under AGPL-3.0-or-later. The package exposes the headless slicing kernel for Node or browser use; the React viewer and the settings panel are optional add-ons. The integration demos (instant-quote form, printer showcase, CAD page) at `/demos` show the package embedded in three different surfaces.

The no-upload guarantee is structural. The slicing runs in the browser tab on the user's machine; the model file never leaves the machine it was opened on; no account, no server-side queue, no telemetry on the model content. The integration demos inherit the guarantee; an embed that uploads the model is a no-upload breach.

## Milestones

1. **M1 — OrcaSlicer kernel port** — the WebAssembly build, the COOP/COEP cross-origin isolation, the two kernel builds behind the isolation boundary, the byte-identical G-code parity gate.
2. **M2 — PrusaSlicer 2.9.6 resin kernel port** — the support-point generator, the support tree, the pad, the `.sl1` archive output, the layer-mask preview.
3. **M3 — Input format support** — STL, OBJ, 3MF, AMF, PLY (direct); STEP (lazy loader); `.sl1` (openable).
4. **M4 — Arrange surface** — move, rotate, scale, duplicate, split to objects, place on bed, multi-plate layout.
5. **M5 — Slice surface** — the 976-option OrcaSlicer settings with the simple / advanced / expert filter.
6. **M6 — Preview surface** — the layer slider, the single-layer view, the travel moves, the toolpath colouring.
7. **M7 — Export surface** — G-code (filament), `.sl1` (resin), `.3mf` (project that keeps plate layout, settings, painting).
8. **M8 — npm package `three-slicer`** — the AGPL-3.0-or-later license, the headless kernel for Node or browser, the optional React viewer and settings panel.
9. **M9 — Integration demos** — the instant-quote form, the printer showcase, the CAD page at `/demos`.

## Risks

- **Byte-identical G-code parity drift** — the WebAssembly build diverges from the desktop OrcaSlicer. Mitigation: the byte-identical gate is the per-commit CI check; a divergence is a release blocker.
- **COOP/COEP isolation failure on embed** — an embedder cannot satisfy the cross-origin isolation requirement. Mitigation: the integration demos show the setup; the npm README documents the requirement; the embedder's failure is surfaced with the exact headers.
- **STEP lazy loader failure** — a STEP file the lazy loader cannot parse. Mitigation: the lazy loader is the source's chosen path; a parse failure surfaces visibly with the error; the user can fall back to a different input format.
- **Out-of-memory on a large model** — the browser cannot load a large model into memory. Mitigation: the slicing runs on the user's machine; an out-of-memory surfaces visibly with the browser's memory error; the user can lower the model's resolution.
- **Upstream divergence** — OrcaSlicer or PrusaSlicer ships a fix the port does not pick up. Mitigation: the port tracks the upstream's release tag; the port ships a version pin to the upstream; the byte-identical gate catches the divergence.
- **AGPL-3.0-or-later license violation** — a hosted SaaS embeds the npm package without publishing the source. Mitigation: the license is explicit; the npm README documents the boundary; the integration demos are open source.
- **Settings option hidden** — a 976-option the browser slicer does not expose. Mitigation: the settings coverage is a metric; the simple / advanced / expert filter surfaces the option the user wants; a hidden option is a settings-coverage gap.
