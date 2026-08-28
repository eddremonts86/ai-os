---
id: "235"
slug: online-clothes-shopping-is-a-lottery-theres-no-accessib
title: "Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/k5z415d0z1-online-clothes-shopping-is-a-lottery-the"
category: retail
date: "2026-01-22"
tags: [AI, Other]
country: India
tech: [Next.js 14, TypeScript, MediaPipe Pose, Three.js, PostgreSQL, Cloudflare R2, Razorpay]
---
# Online clothes shopping is a lottery. There's no accessible technology to see how an item will fit your body, especially in small stores. It's a pain for the buyer and a loss for the seller

## Tech Stack

Next.js 14 (TypeScript) for the seller dashboard. MediaPipe Pose for client-side body segmentation (no server image retention). Three.js with a parametric garment mesh library for the try-on renderer. PostgreSQL for seller accounts, garment metadata, fit-confidence scores. Cloudflare R2 for any cached garment textures. Razorpay for seller billing.

## Architecture

Three pieces: an embeddable JS widget (loaded from a CDN, runs entirely in the browser), a Next.js seller dashboard, and a small Node.js inference API that returns per-garment fit-confidence scores trained offline on anonymised returns data. Buyer photos never leave the browser.

## Milestones

M1: Body segmentation + parametric garment mesh rendering. M2: Seller dashboard and garment upload. M3: Fit-confidence model trained on pilot returns data. M4: Embeddable widget for Shopify and Instagram-store product pages. M5: Pilot with 10 Indian boutique sellers.

## Risks

Render quality on mobile cameras in low light will disappoint users; an honest "low-confidence" UI must be visible. DPDP Act scope on body-derived data is still being interpreted.
