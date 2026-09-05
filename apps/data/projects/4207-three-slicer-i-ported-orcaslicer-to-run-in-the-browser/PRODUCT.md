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

## Value Proposition

A browser-based 3D printing slicer that converts STL, OBJ, 3MF, AMF, PLY, and STEP models into G-code (filament) or `.sl1` (resin) directly in the tab, using a WebAssembly build of the OrcaSlicer kernel. Nothing to install, nothing uploaded to a server, the slicing runs on the user's own machine. The same engine is published to npm as `three-slicer` under AGPL-3.0-or-later, with a headless slicing kernel for Node or browser embedding and integration demos (instant-quote form, printer showcase, CAD page).

The kernel is a port of OrcaSlicer (which is itself a PrusaSlicer / Slic3r descendant); Arachne wall generation, tree supports, multi-material segmentation, and the prime tower come from that source rather than a reimplementation. The resin support-point generator, support tree, and pad come from PrusaSlicer 2.9.6 the same way. The full 976-option OrcaSlicer settings are exposed with a simple / advanced / expert filter.

**One-liner:** An in-browser slicer with the OrcaSlicer kernel ported to WebAssembly, AGPL-licensed on npm as `three-slicer`, with no upload, no install, and the full OrcaSlicer settings exposed.

## Target Users

| Stakeholder | Why they care |
|---|---|
| 3D printer owners | Want to slice a model for filament or resin printing without installing desktop software. |
| 3D printing service providers | Want an embeddable slicer kernel for an instant-quote form, a printer showcase, or a CAD page. |
| Users who refuse model upload | Want their model to never leave the machine they opened it on. |
| PrusaSlicer / OrcaSlicer users | Want a browser-native option that runs the same kernel with the same settings. |
| Resin-printer (mSLA) users | Want a browser-native slicer with support points, support tree, and pad from PrusaSlicer 2.9.6. |

## Jobs To Be Done

1. **Functional job** — Slice a model for filament printing with the full OrcaSlicer settings (Arachne, tree supports, multi-material, prime tower, infill, painting, skirt / brim / raft, ironing, arc fitting) and get G-code as output.
2. **Functional job** — Slice a model for resin (mSLA) printing with support points, support tree, and pad from PrusaSlicer 2.9.6, and get an `.sl1` archive as output.
3. **Functional job** — Embed the slicer in an instant-quote form, a printer showcase, or a CAD page via the npm package `three-slicer`.
4. **Functional job** — Keep the model on the user's machine; never upload to a server-side queue.
5. **Emotional job** — Stop the feeling that the user's model is leaving the machine every time the user wants to slice it.
6. **Social job** — Be the service provider whose instant-quote form runs the same kernel as the user's desktop slicer, with no upload and no install.

## Success Metrics

- **Byte-identical G-code parity** — share of G-code outputs that match the desktop OrcaSlicer byte-for-byte on the same model and settings. The source's porting writeup names this as the verification gate.
- **Per-format input coverage** — share of supported input formats (STL, OBJ, 3MF, AMF, PLY, STEP, `.sl1`) the slicer reads correctly. An input format the slicer cannot read is a coverage gap.
- **Per-format output coverage** — share of supported output formats (G-code, `.sl1`, `.3mf`) the slicer writes correctly. An output format the slicer cannot write is a coverage gap.
- **Settings coverage** — share of the 976 OrcaSlicer options the browser slicer exposes with the simple / advanced / expert filter. A hidden option is a settings-coverage gap.
- **No-upload verification** — share of slices where the model file never leaves the user's machine. A slice that uploads is a no-upload guarantee breach.
- **COOP/COEP isolation success** — share of WebAssembly kernel loads that succeed behind the cross-origin isolation boundary. A failure is a setup gap.
- **npm integration surface** — share of `three-slicer` consumers that successfully embed the kernel in Node or browser. A consumer that fails is an integration gap.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The npm package is `three-slicer` under AGPL-3.0-or-later; the source does not name a commercial license. The browser slicer at slicer.kimgh06.com is free to use; the plan does not invent a monetization the source does not name. Any future monetization has to be measured against the byte-identical G-code parity and the no-upload verification, because those are the metrics the source ties to the kernel's value proposition.

## Competitive Landscape

- **Desktop slicers (OrcaSlicer, PrusaSlicer, Slic3r)** — the source's named inspiration; the same kernel the browser slicer ports.
- **Cloud-upload slicers (the names the source does not provide)** — upload the model to a server-side queue; the source's pitch is the no-upload guarantee.
- **Browser-based slicers (the names the source does not provide)** — exist; the source's pitch is the OrcaSlicer kernel port and the full 976-option settings.
- **CAD-integrated slicers (the names the source does not provide)** — slice inside the CAD tool; the source's pitch is the npm package for embedding in third-party sites.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the byte-identical G-code parity gate is the right verification. The source names the gate; the open question is whether the gate is a per-commit CI check or a manual spot-check.
- [ ] Validate the COOP/COEP cross-origin isolation is documented for embedders. The source names the setup; the open question is whether embedders (an instant-quote form, a printer showcase) can satisfy the isolation requirement without breaking their existing pages.
- [ ] Define the policy on a STEP file that the lazy loader cannot parse. The source names the lazy loader; the open question is whether the slicer surfaces a parse-error fallback or fails visibly.
- [ ] Decide the policy on a 3D model that the browser cannot load into memory. The slicing runs on the user's machine; the open question is whether the slicer surfaces an out-of-memory fallback or fails visibly.
- [ ] Confirm the AGPL-3.0-or-later license is the right boundary for the npm package. The source is explicit; the open question is whether a commercial license for hosted SaaS embedding is the right next step.
- [ ] Establish a documented escalation path when the upstream OrcaSlicer or PrusaSlicer ships a fix the kernel does not pick up. The kernel is a port; the open question is how the port tracks the upstream.
- [ ] Define the policy on a settings option that the browser slicer does not expose. The source claims the full 976-option set; the open question is whether a hidden option is a settings-coverage gap the slicer surfaces or a silent omission.
