---
id: "777"
slug: online-clothes-shopping-is-a-lottery-theres-no-accessib
title: "Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/k5z415d0z1-online-clothes-shopping-is-a-lottery-the"
category: retail
date: "2026-01-22"
tags: [Retail, AI, Other]
country: India
tech: [Python, FastAPI, MediaPipe Pose, OpenCV, PostgreSQL, Three.js, Next.js, Tailwind CSS, Coolify, Docker]
---
# Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An embeddable body-fit preview that a small Indian clothing store can drop into a product page and let a shopper see how the specific garment is likely to drape on their own body, without the shopper's camera ever leaving their phone and without the merchant standing up a GPU render farm. The capture runs in the browser, the proportions are extracted locally, and only an anonymised shape plus a garment ID cross the network to the merchant's self-hosted backend.

The widget is designed to fit the way small Indian stores actually sell: Shopify or WooCommerce storefronts, a product page that loads on a mid-range Android phone over 4G, and an operator who can run one Coolify node rather than negotiate an enterprise AR contract. The mesh warp that turns the proportions into a fit preview is intentionally a heuristic rather than a neural renderer, because the post does not name a visual quality bar and the realistic target is "the shopper feels more confident about this size", not photorealism.

**One-liner:** TryFit shows a small-store shopper how a specific garment will drape on their own body from a short in-browser capture, so the merchant stops losing sales to fit uncertainty.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small Indian clothing retailer | Wants fewer abandoned carts without paying for an enterprise AR try-on SDK they cannot afford or integrate. |
| Shopper on a mid-range Android phone | Needs a preview that loads on 4G, asks for camera permission once, and never sends their face anywhere. |
| Independent clothing brand | Carries limited inventory per size and wants fit confidence to substitute for a wider catalogue. |
| Storefront integrator / freelance dev | Wants an API and a two-script-tag embed, not a hosted marketplace that competes with the merchant they are building for. |
| Merchant's privacy / compliance contact | Needs a documented story that the camera frames never leave the shopper's device. |

## Jobs To Be Done

1. **Functional job** — See how a specific garment will drape on the shopper's body before they commit to a size.
2. **Functional job** — Drop the preview into a small-store product page without rewriting the storefront.
3. **Functional job** — Run the whole thing on one Coolify node the merchant already pays for.
4. **Emotional job** — Stop guessing whether the size chart on this product page actually applies to the shopper's body.
5. **Emotional job** — Stop worrying about returning a garment that looked right on the model and wrong in the mirror.
6. **Social job** — Signal to the shopper that this small store is taking fit seriously, in a way a banner cannot.

## Success Metrics

- **Capture completion rate** — share of product-page visits where the shopper finishes the camera capture and sees a preview, since the rest of the value collapses without that step.
- **Add-to-cart lift on previewed sessions** — add-to-cart rate on sessions that reached a preview versus sessions that did not.
- **Return rate on previewed orders** — share of previewed orders returned for fit reasons, compared against the merchant's pre-widget baseline.
- **Widget load time on a mid-range Android over 4G** — measured time-to-first-render at the 75th percentile, because the post calls out the small-store context where slow widgets get removed.
- **Merchant self-host cost per 1,000 previews** — CPU and bandwidth bill the merchant sees for delivering 1,000 previewed visits on their own Coolify node.
- **Embed install time** — minutes from `npm install` (or two script tags) to a live preview on a merchant's staging product page.

## Pricing & Monetization

The post names no price, no tier and no commercial offering; it is a one-line ProblemHunt capture. What the architecture does fix is the cost shape: rendering and capture happen client-side, so the merchant's bill scales with API calls for garment registration and with the merchant dashboard's per-visit logging rather than with render-seconds on a GPU. Any future monetisation has to charge the merchant for embedded previews delivered, not the shopper per session, because the post is explicit that small stores are the buyer and the shopper is the user.

## Competitive Landscape

- **Generic size-chart and measurement-guidance tools** — common on small-store product pages, but they answer "what is my size" with a tape measure and do not address the "how will it drape" question the post names.
- **Hosted AR try-on SDKs from large marketplaces** — solve the same problem at higher visual quality, but only inside the marketplace's own app and at a price and integration cost the post's small-store framing rules out.
- **Snapchat and Instagram AR filters** — show a generic garment on a generic face, not a specific garment on the shopper's specific body, and require the shopper to leave the merchant's site.

The post names no competitor. No comparison is claimed beyond these three generic shapes.

## Risks & Open Questions

- [ ] Validate that a CPU-only heuristic warp gives shoppers enough confidence to convert, before committing to a heavier model.
- [ ] Confirm the WebAssembly MediaPipe build is small enough to ship on a 4G connection without a long first-paint delay.
- [ ] Decide whether the merchant dashboard exposes per-shopper behaviour or only aggregate counts, given the privacy promise that biometric data is not retained.
- [ ] Establish a graceful fallback for shoppers on devices that cannot give camera permission or that flag the WebGL context as low-power.
- [ ] Measure whether the bandwidth cost of the in-browser pose model forces a different delivery shape (CDN-cached worker, smaller landmark set) in real Indian 4G conditions.
- [ ] Decide whether garment registration is self-serve for the merchant or operated as a service, since the post calls small stores out but does not say who prepares the garment mesh.
