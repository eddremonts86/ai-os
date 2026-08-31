---
id: "3831"
slug: convert-png-and-jpg-to-clean-svg-in-seconds
title: Convert PNG and JPG to clean SVG in seconds
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493250"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Image vectorization engine, SVG output pipeline, color optimization pass, client-side preview renderer, Paddle credit packs, multi-format upload handling]
---
# Convert PNG and JPG to clean SVG in seconds

## Tech Stack

Chosen for a web conversion tool whose economics are preview-first and pay-per-download.

- **Image vectorization engine:** raster-to-vector tracing at the core.
- **SVG output pipeline:** traced geometry serialized to clean SVG.
- **Color optimization pass:** palette reduction for cleaner editing (the site names it).
- **Client-side preview renderer:** users see the vectorized result before paying.
- **Paddle credit packs:** one-time payment processing for downloads.
- **Multi-format upload handling:** JPG, PNG, WEBP, GIF and BMP in; SVG out.

## Architecture

- **Uploader:** accepts the supported raster formats.
- **Vectorizer:** traces the raster into vector paths.
- **Optimizer:** reduces colors and cleans paths for editability.
- **Preview service:** renders the SVG back for the user to check.
- **Billing:** Paddle credits consumed on new downloads only.

## Milestones

1. **M0 — Core conversion.** PNG and JPG in, SVG out, with a preview.
2. **M1 — Clean output.** Color optimization and editable structure for Figma and Illustrator.
3. **M2 — Billing.** Paddle credit packs with a preview-free, pay-per-download flow.
4. **M3 — Format breadth.** WEBP, GIF and BMP inputs and transparency preservation.

## Risks

- **Quality variance:** photographic inputs vectorize poorly, generating bad word of mouth.
- **Prepaid credits:** refund pressure if output disappoints.
- **Commodity category:** many free converters exist; differentiation rests on "clean" output.
- **Scaling compute:** vectorizing large images needs CPU or GPU capacity with thin margins.
- **Single-channel dependence:** Paddle is the only payment path stated.
