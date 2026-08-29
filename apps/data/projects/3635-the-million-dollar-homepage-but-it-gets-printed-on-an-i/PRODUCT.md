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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A public collaborative image built on a 25 by 45 grid of 1,116 tiles, each costing US$1, where contributors upload a JPG, choose a contiguous block and receive a personal-use download plus a certificate once submissions close on October 1, 2026. The finished image is printed as one iPhone 17 Pro Max skin for the project creator's phone, and the project is explicitly not affiliated with Apple Inc.

The product is positioned as a riff on the original Million Dollar Homepage: a shared image built tile by tile, with the total outcome going to a single physical artefact rather than to thousands of dollars of web ad space. The unit economics are small by design — a US$1 tile is a novelty contribution, not a purchase — and the deliverable is digital (the final image and a certificate) rather than a shipped object.

**One-liner:** Skin of the Year is a 25 × 45 collaborative image where each tile costs US$1 and the finished picture is printed as one iPhone 17 Pro Max skin for the project creator's phone.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Creative novelty buyers | A US$1 contribution to a shared image is a low-cost digital memento. |
| Internet-history fans | A 2026 riff on the Million Dollar Homepage format. |
| Designers and illustrators | A tiny canvas at 2.8 × 2.8 mm where adjacency to neighbours matters. |
| Camera-area block buyers | The premium US$200 surface is the only higher-priced position. |
| Project creators studying the format | A working example of a grid-collaboration storefront and print pipeline. |
| Buyers who value the explicit non-affiliation stance | The trademark line travels with every public surface. |
| Audiences who understand the no-change-of-mind refund | The publication is the product, and the policy says so up front. |

## Jobs To Be Done

1. **Functional job** — Pick a tile, pay US$1, upload a JPG and see it join the shared canvas within seconds.
2. **Functional job** — Receive the final image and a contributor certificate once submissions close.
3. **Functional job** — Lock the tile at payment so the chooser cannot quietly swap it later.
4. **Functional job** — Run the grid from open through close on October 1, 2026 and produce a final composite without missing tiles.
5. **Emotional job** — Have a small, public mark on a 2026 collaborative image that anyone can browse.
6. **Social job** — Participate in a riff on the Million Dollar Homepage that fits the format the audience already recognises.
7. **Emotional job** — Trust that the trademark framing with Apple Inc. is honored, because the project lives or dies on that framing.

## Success Metrics

- **Grid fill rate** — share of the 1,116 tiles sold by the submissions-close date, since an empty grid changes what "the finished image" actually is.
- **Camera-area block uptake** — how many of the optional US$200 blocks are claimed relative to the ordinary US$1 tiles.
- **Upload rejection rate** — share of uploads that fail the JPG / JPEG / 10 MB / solid-background checks, because a high rejection rate means the storefront copy is unclear.
- **Stripe payment failure rate** — share of checkouts that fail at the payment step, because a broken payment flow is the whole point of failure for a storefront.
- **Refund rate** — should be near zero beyond verified duplicate charges and technical payment failures, which is the stated policy.
- **Contributor certificate generation** — share of paid tiles that produce a downloadable certificate with the right coordinates, because the certificate is one of the two deliverables.
- **Trademark line presence** — share of public surfaces that carry the Apple non-affiliation statement, which is part of the stated contract.

## Pricing & Monetization

The source page states the prices directly and only them: US$1 per tile and US$200 for the optional camera-area block, with Stripe as the payment processor. Refunds are limited to verified duplicate charges and technical payment failures, and change-of-mind refunds are not available because the publication is the product. There is no subscription, no in-app purchase, and no physical-shipment add-on. The plan respects that pricing structure exactly.

## Competitive Landscape

- **The original Million Dollar Homepage (2005)** — the namesake reference the title invokes; the format is similar and the audience overlap is the social-job target.
- **Pixel-art and collaborative-canvas projects** — the broader category of small-unit collaborative images (r/Place, projects in the million-pixel range); the difference is that this one ends at a single physical print rather than a temporary canvas.
- **Print-on-demand iPhone skins** — the print-shopping world that takes an image and ships a skin; the project's relationship is the opposite: the image is the deliverable, the skin is the single artefact at the end.
- **Crowdfunded single-artefact projects** — projects that end at one physical object funded by many small contributions; the difference is the grid format and the iPhone framing.

The source names no direct competitor, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the print partner and the handoff for the iPhone 17 Pro Max skin, since the source does not name either.
- [ ] Decide what happens if the grid does not fill by October 1, 2026, because an incomplete grid changes the deliverable shape.
- [ ] Establish the solid-background check at upload time, since this is the only image-quality gate the source names.
- [ ] Verify Stripe Checkout handles the per-tile, per-pack, and US$200 camera-area flows without leakage between them.
- [ ] Audit the contributor certificate for name uniqueness and coordinate accuracy, since both feed the certificate the source promises.
- [ ] Confirm the final composite generation locks at October 1, 2026 without race conditions on the last few sales.
- [ ] Decide the backup for a tile that fails the solid-background check but is the only one in the contributor's block, since the source does not promise a replacement path.
