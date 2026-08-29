---
id: "3635"
slug: the-million-dollar-homepage-but-it-gets-printed-on-an-i
title: "The Million Dollar Homepage, but it gets printed on an iPhone skin"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481324"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Next.js 14 (App Router), TypeScript, Stripe Checkout, Sharp, PostgreSQL, S3-compatible storage, Coolify]
---
# The Million Dollar Homepage, but it gets printed on an iPhone skin

## Problem

The capture for this plan is a single URL — www.skinoftheyear.lol — and a title that states the whole product: "The Million Dollar Homepage, but it gets printed on an iPhone skin." The page itself is more specific and provides the contract the plan honours: the project is a public collaborative image built on a 25 by 45 grid of tiles (1,116 tiles total), tile size approximately 2.8 mm by 2.8 mm, each tile sold for US$1, with an optional camera-area block priced at US$200, processed and placed on a shared canvas that stays open until October 1, 2026 and then becomes one printed iPhone 17 Pro Max skin for the project creator's phone.

The page makes several operational claims that are now part of the spec. The contributor uploads a JPG or JPEG with a solid background, up to 10 MB, and the image cannot be changed after payment. The grid is contiguous, so a contributor's chosen tile-pack stays attached to the block they selected. Payment is processed by Stripe at US$1 per tile. Contributors receive a personal-use download and a certificate showing their name, tile count and coordinates; no physical product is shipped to contributors. Refunds are limited to verified duplicate charges and technical payment failures, with change-of-mind refunds explicitly unavailable because the publication is the product.

The page also draws an explicit line about the trademark: the project is not affiliated with, endorsed by or sponsored by Apple Inc., and iPhone is stated to be a trademark of Apple Inc. That is not boilerplate; it is the framing of a project that prints onto an iPhone-shaped product without making an Apple claim. The plan respects that framing throughout.

What the source does not state is also part of the honest reading. There is no target dollar figure, no SLA on the print, no commitment about what happens if the grid does not fill, and no statement about how the final image is delivered to the project creator. The plan treats those as open questions the page raises but does not answer.

## Objective

Run a public collaborative image project on a 25 by 45 grid where each tile costs US$1, with the finished image printed as one iPhone 17 Pro Max skin for the project creator's phone once submissions close on October 1, 2026. Contributors upload a JPG or JPEG of 10 MB or less with a solid background, select a contiguous block, pay via Stripe at US$1 per tile, and receive a personal-use download of the final image plus a contributor certificate. No physical product is shipped to contributors, no change-of-mind refunds are available once a tile is paid for, and the project is not affiliated with Apple Inc.

## Target Users

- Creatives and internet-history fans who want to leave a small mark on a public collaborative image for a US$1 outlay.
- Buyers looking for a low-cost novelty contribution where the deliverable is a personal-use download and a certificate rather than a shipped object.
- People who want the optional camera-area block at the stated US$200 price, which is the only premium-priced surface the page lists.
- Internet-history enthusiasts who remember the original Million Dollar Homepage and want to participate in a 2026 riff on the format.
- Designers and illustrators who treat the grid as a tiny canvas and care about how their tile sits next to its neighbours.
- Project creators who might run similar grid-collaboration projects later and want to study a working one.
- Buyers who understand the no-refund-on-change-of-mind policy up front and are happy with the digital deliverables described.
- Audiences who value the explicit non-affiliation statement with Apple Inc. and who want the project to stay that way.

## MVP Scope

- A web storefront exposing the 25 × 45 grid with real-time tile availability and a per-tile selection flow.
- Stripe Checkout integration at US$1 per tile, with the optional US$200 camera-area block as a separate product.
- A contributor form that accepts JPG or JPEG up to 10 MB, with a solid-background check and a preview that shows the chosen tile on the canvas.
- A server-side processing pipeline that resizes and pads the uploaded image to the 2.8 mm by 2.8 mm tile specification and stores the processed version.
- A persistent store of tiles, payments, processed images and contributor metadata, with the tile locked at payment success and unchangeable afterwards.
- A contributor account surface that lists the contributor's tiles, allows downloading the final image once available, and generates the contributor certificate (name, tile count, coordinates).
- A submissions-close job on October 1, 2026 that closes the grid permanently and produces the final composite image.
- A delivery handoff for the project creator's print, in whatever shape (file, print partner, manual) the source page describes.
- The non-affiliation statement with Apple Inc. visible on every storefront and deliverable.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture states the grid is 25 × 45 with tiles approximately 2.8 × 2.8 mm and a total of 1,116 tiles; any change to the grid is out of scope of the stated surface.
- The submission window closes on October 1, 2026 and the grid locks permanently at that point; the plan does not invent a renewal or re-opening.
- US$1 per tile and US$200 for the optional camera-area block are the prices stated in the source; no other prices or tiers are introduced.
- Accepted file format is JPG or JPEG, solid background, up to 10 MB; other formats, transparent backgrounds and larger files are rejected up front.
- Refunds are limited to verified duplicate charges and technical payment failures; change-of-mind refunds are explicitly unavailable because the publication is the product.
- No physical product is shipped to contributors; the deliverable is the personal-use download plus the certificate, and the plan does not add a physical-shipment flow.
- The image cannot be changed after payment; the plan enforces immutability at the data layer rather than as a courtesy.
- The project is not affiliated with, endorsed by or sponsored by Apple Inc.; the trademark line travels with every public surface and every deliverable.
- The capture does not name a print partner, a delivery date or a backup plan if the grid does not fill; those are open and the plan flags them as such.
