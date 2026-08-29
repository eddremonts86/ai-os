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

## Problem

Online clothes shopping in India is framed by the post as a lottery. The capture is one line long: the title names the actors (buyers and sellers, with a pointed emphasis on small stores), the pain (no way to see how an item will actually fit a specific body), and the missing thing (an accessible technology for body-fit visualisation that small retailers can afford to integrate). The only other ground truth is `country: India`.

That country detail matters because it constrains the realistic solution shape. Small Indian retailers cannot absorb enterprise 3D scanning rigs, per-render GPU bills, or an integration that requires a dedicated iOS app — and yet they are precisely the merchants the post calls out as losing sales today. The technology gap the post describes is therefore not "no body-scanning research exists" but rather "no body-scanning pipeline is cheap, embeddable, and tolerant of low-bandwidth storefronts".

What the title implies, without inventing any specific number from the source, is a two-sided loss: a buyer who cannot tell whether a garment will fit returns it or abandons the cart, and a small seller who cannot offer the confidence-building preview a large marketplace can afford to build loses the sale outright. The capture deliberately avoids quoting a return rate, an abandoned-cart percentage or any concrete market size, so the rest of this document reasons from the title rather than from a number the source did not supply.

## Objective

Ship a body-fit visualisation service that a small Indian online clothing store can embed in a product page, that lets a shopper see how a specific garment is likely to fall on their own body from a short phone-camera capture, and that does so on a stack the merchant can self-host without a GPU fleet. The unit of success is a single product page on a single small store that converts more visits into confident purchases, not a benchmark against any incumbent the post does not name.

## Target Users

- Small Indian online clothing retailers who sell via Shopify, WooCommerce or a custom storefront and cannot afford enterprise AR try-on SDKs.
- Individual shoppers in India browsing those stores on a mid-range Android phone over a mobile data connection.
- Independent clothing brands and boutique sellers who carry limited inventory per size and want to reduce returns driven by fit uncertainty.
- Storefront integrators and freelance developers who need an API and a small embeddable widget rather than a hosted marketplace they cannot customise.

## MVP Scope

- Browser-only body capture using the phone's front camera with explicit, plain-language consent, capturing a short video clip rather than asking the user to upload photos.
- Joint and proportion extraction via MediaPipe Pose running in a WebAssembly build inside the browser, so the merchant's server never receives the raw camera frames.
- Server-side garment registration that takes a flat-lay photo or a vendor's existing product image plus a few measurements and produces a parametric garment mesh stored in PostgreSQL.
- A virtual try-on step that warps the registered garment onto the extracted body shape using a lightweight, CPU-friendly heuristic, with the result rendered client-side via Three.js.
- Embeddable widget that a merchant drops into a product page with two script tags and one placeholder div, falling back gracefully when no camera is available.
- Per-merchant API key, per-product fit-render logging, and a merchant dashboard that shows how many product-page visits completed the capture step.
- A static product page on Coolify that demonstrates the widget end to end with one small-store catalogue as the reference deployment.
- Documentation that explains the privacy story (camera frames never leave the device) and the bandwidth story (capture runs at a low resolution that an Indian 4G connection can sustain).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Camera frames must stay on the shopper's device for the capture and proportion-extraction steps; only the anonymised proportions and the chosen garment ID cross the network.
- The widget must run on a mid-range Android phone shipped in the last four years, on Chrome and the Android WebView, without requiring WebGPU.
- No facial landmarks may be retained; the pose model is configured to ignore the face and only emit the joints needed for torso, hip and shoulder proportions.
- The merchant dashboard must not store per-user biometric data — only aggregate counts and a per-merchant pseudonymous visit hash, because the service is not a biometric identification system.
- The try-on renderer must degrade to a 2D silhouette overlay when the WebGL context is lost or the device flags it as low-power, so the merchant page never shows a blank box.
- The merchant's monthly self-host cost on a single Coolify node must stay bounded enough that a small Indian boutique can pay it out of operating margin; the capture path is browser-side specifically to keep that cost low.
- The service must function without third-party analytics or external CDN calls at runtime, so the merchant's product page is not blocked by a network rule the customer has set.
