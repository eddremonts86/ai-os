---
id: "235"
slug: online-clothes-shopping-is-a-lottery-theres-no-accessib
title: "Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/k5z415d0z1-online-clothes-shopping-is-a-lottery-the"
category: retail
date: "2026-01-22"
tags: [AI, Other]
country: India
tech: [Next.js 14, TypeScript, MediaPipe Pose, Three.js, PostgreSQL, Cloudflare R2, Razorpay]
---
# Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller

## Problem

In India, online apparel shoppers — especially when buying from small boutique stores on Instagram, Meesho, or independent Shopify sites — cannot reliably predict how a garment will fit their own body, which produces high return rates and lost trust on both sides. The poster calls it "a lottery": buyers guess, sellers absorb the cost.

## Objective

Ship a virtual try-on widget that small Indian apparel sellers can drop into their existing product pages, letting buyers upload a single front-facing photo and see the garment composited onto their own body in the listed size, with a fit-confidence indicator per garment.

## Target Users

Indian online apparel shoppers, primarily women buying from small Instagram-boutique and Meesho-style sellers; small Indian boutique sellers with 50-5,000 orders/month who cannot afford a custom virtual-try-on build.

## MVP Scope

Browser widget (web component + iframe embed) that takes a buyer photo, segments the body, fits a parametric garment mesh, and renders a still image. Per-garment fit-confidence trained on returns data from a small set of pilot sellers. Razorpay for the seller subscription.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/retail/k5z415d0z1-online-clothes-shopping-is-a-lotter` follows the constraints in `235-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, MediaPipe Pose). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Buyer photo privacy — images must be processed and discarded on-device or in transient compute, never stored beyond the session. No body measurements extracted server-side. Indian DPDP Act compliance for any biometric-like data.
