---
id: "501"
slug: spatialboard-an-mit-react-infinite-canvasnode-graphsket
title: "SpatialBoard – an MIT, React infinite-canvas/node graph/sketch package"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnyx7t/spatialboard_an_mit_react_infinitecanvasnode/"
category: sideproject
date: "2026-08-14"
tech: [React, TypeScript, Vite, MIT license, npm]
---
# SpatialBoard – an MIT, React infinite-canvas/node graph/sketch package

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vnyx7t/spatialboard_an_mit_react_infinitecanvasnode/

Original post:

> So I've been working on a SaaS over the past couple of months and one of the things that I ended up developing is a multi-mode infinite canvas. It can be used for drawing, node flows, and whatever else you need. The structure is there - and it makes it easy for agents to pick it up and utilize it for vibe-coded (and not vibe-coded) apps. Need a free form editor for your app? Need a collaborative space for your SaaS? SpatialBoard might be a good fit. P.S. I've open-sourced it, it's MIT - so you can use it for whatever you need. Find it here: https://spatialboard.hishamkhalifa.com/dev-app/ Repo: https://github.com/hishamk/spatialboard submitted by /u/Artful3000 [link] [comments]

---

What this plan addresses: SpatialBoard: an MIT React infinite-canvas / node-graph / sketch package for SaaS apps.

## Objective

An MIT React package for infinite canvases, node graphs, and sketches, designed to be a SaaS feature primitive rather than a standalone product. When I am building a SaaS feature that needs an infinite canvas or node graph, I want an MIT React package I can drop in, so I do not build the canvas primitive from scratch.

## Target Users

- SaaS teams building infinite-canvas features without rolling their own
- Frontend engineers who need a node-graph primitive
- Open-source maintainers looking for a canvas foundation

## MVP Scope

- MIT-licensed React package
- Infinite canvas with pan + zoom
- Node-graph primitives (nodes, edges, ports)
- Sketch primitives (shapes, freehand)

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnyx7t/spatialboard_an_mit_react_` follows the constraints in `501-.../SPEC.md` and the chosen stack (React, TypeScript, Vite). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes SpatialBoard explicitly as an MIT React infinite-canvas / node-graph / sketch package
- Plan keeps the package framing
- Source did not name a specific SaaS use case
