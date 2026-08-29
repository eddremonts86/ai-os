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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

The world's frontier-computing footprint — AI labs, AR / VR shops, robotics teams, the universities and infrastructure supporting them — is real, mappable, and currently only available as prose in long Substacks, slide decks, and Twitter threads. God's Eye View treats that footprint as the substrate of an interactive 3D globe, framed as the spy-satellite simulator the reader always wanted, and populated with curated data rather than fake markers. The product name and the GitHub repo do double duty: the atlas is the product, and the launch is the visibility layer for the maker's "Map the World" research thread. The implicit bet is that a global map of where frontier tech is being built is more memorable and more citable than another long essay.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Reader of "Map the World" (and adjacent Substacks) | Wants the research as an interactive globe, not a static image embedded in a post. |
| Frontier-tech journalist / analyst | Wants a curated starting point for "who is building what, where" instead of building a personal spreadsheet. |
| Student / researcher in AI / AR / VR / robotics | Wants to find labs and teams working in adjacent areas without three levels of LinkedIn search. |
| Open-source contributor | The product is open source (GitHub: `bilawalsidhu/gods-eye-view`); adding points and fixing data is a contribution surface. |
| Maker (Bilawal Sidhu) | Validates the atlas frame as the front-end of the "Map the World" research thread, distinct from a one-off Substack image. |

## Jobs To Be Done

1. **Functional job** — Find, in one place, where a specific frontier-tech area is being built, by city and by institution, rather than reconstruct it from prose each time.
2. **Emotional job** — Stop the "I keep losing track of which lab is in which city" frustration that comes from following frontier-tech news across many threads.
3. **Social job** — Be able to send a single link to a colleague and say "this is the map" instead of a screenshot of a Twitter thread.

## Success Metrics

- **Activation:** a reader reaches an interactive globe (pan, zoom, click a marker) within their first minute on the site (proxy: the visualisation is reachable, not gated behind a sign-in).
- **Engagement:** median reading session includes multiple markers opened, not just one (proxy: the map is being explored as an atlas, not glanced at as a hero image).
- **Contribution surface:** open-source contributions to the GitHub repo per quarter (proxy: the curated data is growing because outside readers want to add points).
- **Newsletter funnel:** measurable click-through from "Map the World" Substack into the atlas (proxy: the atlas is being used as the front-end of the research, not a separate product).

## Pricing & Monetization

The ProductHunt listing shows the project as **Free** and tags it Open Source / GitHub. No price, plan, or commercial offering is stated in the source, so no `wtp` field is set. Plausible monetisation surfaces for an open-source atlas in this position:

- **Sponsorship / GitHub Sponsors** — the maker takes sponsorship from labs, universities, or tool vendors for visibility or feature placement; this is consistent with the "data is real, curator is real" claim.
- **Newsletter-paid tier** — revenue continues to come from the "Map the World" Substack; the atlas is the free product that supports the paid tier.
- **Dataset / API access** — a future paid API that exposes the curated points-of-interest dataset to other researchers; the open-source product remains the visualisation surface.

## Competitive Landscape

- **Substack atlases & "map of AI" posts** — the maker's "Map the World" is the canonical reference here. The product is the live version of that frame; Substack posts are still the entry point.
- **VC / startup-data maps (Crunchbase maps, PitchBook maps, Carta network graphs)** — focus on funded startups and exits, not the broader frontier-tech footprint (labs, universities, infrastructure).
- **Open-source mapping projects (OpenStreetMap, Mapbox-based open datasets)** — provide the *tiles* but not the *atlas*. God's Eye View is a curated dataset on top of a generic globe, not a generic mapping platform.
- **Government / NASA-style satellite simulators (NASA Eyes, ESA's interactive globes)** — visually similar but focus on physical-satellite orbits and Earth-observation data, not on a curated POI dataset for a specific industry.
- **Lottie / 3D-globe demos (Three.js + Threebox, Cesium examples)** — what most of the "spy satellite" mockups in product blogs and product-hunt teasers look like. God's Eye View's claim is that the data underneath is real, not synthetic.

## Risks & Open Questions

- [ ] Curation is the moat. If the dataset rots (companies move, labs close, contributors add noise), the atlas becomes a pretty picture. The data layer needs at minimum per-point provenance (who added it, when, what source) and a quarterly review pass.
- [ ] Browser performance at scale is non-trivial. A globe with thousands of curated markers, lines connecting labs to spinoffs, and animated overlays can collapse frame-rate on a mid-range laptop. The team should set a marker-count ceiling before launch rather than discovering the cliff in production.
- [ ] The product is open source, the maker is a public commentator on the industry, and the dataset includes named institutions. Any feature that lets a sponsor or a vendor *buy* a prominent marker position is a credibility risk; the line between "sponsorship" and "advertising" must be drawn and published.
- [ ] "Spy satellite simulator" framing is fun but does not age well in regulatory regimes that treat certain satellite imagery as restricted. The data layer must remain POI-only (names, locations, focus areas), not imagery.
- [ ] The product is tightly coupled to "Map the World" the Substack. If the maker de-prioritises the Substack, the atlas loses its main distribution channel. The team should ensure the GitHub project is documented well enough that contributors can sustain it independently of the Substack.
