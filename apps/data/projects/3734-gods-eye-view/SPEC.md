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

## Problem

The maker behind God's Eye View (Bilawal Sidhu, formerly a Google mapper of the world; creator of the "Map the World" Substack) describes the product as "your atlas to AI, AR/VR, robotics, and the technologies blurring our physical and digital worlds" and tags the launch as Open Source / GitHub / Maps on ProductHunt. The pun in the title — "spy satellite simulator in your browser but the data is real" — points to the actual problem the product addresses: the existing mental model for "where is AI / AR / VR / robotics being built" is scattered across conference talks, scattered Substack essays, scattered Twitter threads, and a handful of well-known atlases (mostly for VC money, mostly for talent, mostly for commercial real estate). A reader who wants to follow the geography of where the next platform is actually being built — labs, startups, universities, infrastructure — does not have a single surface that treats the world as a map first and a directory second. The ProductHunt listing invites the reader to "click to read Map the World by Bilawal Sidhu" rather than to a product dashboard, which signals that the value is the *atlas frame*, not a software product on its own.

## Objective

Ship an open-source browser-based "spy satellite simulator" that, in place of staging fake satellite imagery, plots real-world points of interest in the AI / AR / VR / robotics space on a globe the user can pan, zoom, and explore. The MVP is the GitHub repository linked on the ProductHunt listing (`bilawalsidhu/gods-eye-view`), presented to the reader as the visual front-end of the "Map the World" research thread; the data layer is whatever the maker and contributors choose to curate into the atlas.

## Target Users

- **Primary:** readers of "Map the World" (and adjacent Substacks / newsletters) who want an interactive, browser-based atlas of where frontier-computing work is happening, not a static map in a blog post.
- **Secondary:** researchers, journalists, students, and analysts who keep personal lists of "labs / startups / universities working on X" and would rather browse a curated globe than maintain a spreadsheet.
- **Tertiary:** open-source contributors who want to add points of interest, fix data, or extend the visualisation (the project is open source per the listing tags).

## MVP Scope

- An open-source web app (GitHub: `bilawalsidhu/gods-eye-view`) that renders an interactive 3D globe in the browser, themed as a "spy satellite simulator" but rendering real curated points of interest rather than fantasy data.
- A data layer with curated points (labs, startups, universities, infrastructure sites) in AI / AR / VR / robotics, drawn from the maker's "Map the World" research and contributor submissions.
- Per-point detail (company, location, focus area, link) shown when a marker is selected.
- A browse / pan / zoom / filter interaction suited to a "look around the world" exploration rather than a search box.
- Open-source delivery: the repository is the product, the launch is the visibility layer.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "But the data is real" is a load-bearing claim. A product that silently mixes fake markers, advertising placements, or low-quality contributor data would undermine both the open-source credibility and the maker's journalism brand.
- Browser-based 3D globe rendering has a real floor (WebGL, modern desktop browsers, decent GPU). The product must not pretend it runs everywhere; a graceful "this view needs a desktop browser" message is better than a half-loaded globe on a phone.
- The product is open source. Licensing must be compatible with the curated data being added by contributors, and any dataset with a non-commercial or attribution-share-alike license has to be respected, not silently folded in.
- "Spy satellite simulator" framing is the hook but the underlying capability has to handle real-world scale: thousands of points, multiple categories, fast pan/zoom without dropping frames.
- Pricing is not stated in the ProductHunt listing. Open source typically implies free; no `wtp` field is set, and absent beats invented.
- "Map the World" is the maker's own Substack; the product is the visualisation layer of that research, not a standalone unrelated atlas. A reader expecting a SaaS will misread the product, and the team should be explicit about this in any user-facing copy.
