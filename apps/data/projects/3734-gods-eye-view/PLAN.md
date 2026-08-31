---
id: "3734"
slug: gods-eye-view
title: God’s Eye View
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/god-s-eye-view"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# God’s Eye View

## Tech Stack

Chosen for an open-source atlas where the repository is the product and the data must stay real — the captured JavaScript defaults are legacy, not the build.

- **Browser 3D globe (WebGL):** the interactive globe rendering real curated points, not fantasy imagery.
- **Curated data layer:** labs, startups, universities, and infrastructure in AI / AR / VR / robotics, with per-point provenance.
- **Point-of-interest detail:** company, location, focus area, and link shown per marker.
- **Open-source repo (GitHub: bilawalsidhu/gods-eye-view):** contributors add and fix data through the repository.
- **Graceful-degradation surface:** a desktop-browser message instead of a half-loaded globe on phones.

## Architecture

- **Globe surface:** pan, zoom, filter, and marker clicks — exploration-first, not search-first.
- **Data pipeline:** maker-curated points from "Map the World" plus contributor submissions, each with provenance (who, when, source).
- **Filtering:** by focus area and category across thousands of points without dropping frames.
- **Deployment:** a static web app; the launch is the visibility layer for the research thread.
- **Licensing boundary:** curated data licences (non-commercial, attribution, share-alike) are respected, never silently folded in.

## Milestones

1. **M0 — Globe with real data.** The first curated set of points renders and is clickable in a desktop browser.
2. **M1 — Scale handling.** Thousands of points across categories pan and zoom without frame drops; the marker-count ceiling is set.
3. **M2 — Contribution surface.** Contributors add and fix points via the repo, with provenance recorded per point.
4. **M3 — Public launch.** The atlas ships as the front-end of "Map the World", with the desktop-browser fallback live.

## Risks

- **Data rot:** companies move and labs close; quarterly review passes and provenance are the only defence.
- **Browser performance cliff:** a globe with thousands of markers can collapse the frame-rate on mid-range laptops.
- **Credibility versus sponsorship:** any paid marker placement must draw and publish the line between sponsorship and advertising.
- **Framing age:** the "spy satellite simulator" framing must stay points-only; imagery would drift into regulatory territory.
- **Substack dependency:** if "Map the World" is de-prioritised, the repo documentation must be good enough for the atlas to survive alone.
