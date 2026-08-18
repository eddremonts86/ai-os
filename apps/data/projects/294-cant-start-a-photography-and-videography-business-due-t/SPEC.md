---
id: "294"
slug: cant-start-a-photography-and-videography-business-due-t
title: "Can't start a photography and videography business due to lack of clients and sy"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/3zqee2a4x1-cant-start-a-photography-and-videography-bus"
category: business
date: "2025-10-29"
tags: [Business, Media, Marketing]
country: Kenya
tech: [Next.js 14, TypeScript, Postgres, M-Pesa Daraja API, Cloudinary (media), WhatsApp Business API]
---
# Can't start a photography and videography business due to lack of clients and sy

## Problem

Kenyan photographers and videographers — often young creatives with a camera and editing skills but no system for finding clients, quoting, booking, delivering final media, or collecting payment — struggle to start or sustain a business. The title frames two failures stacking: no consistent client pipeline and no back-office system. A great shoot ends in a Dropbox link sent over WhatsApp and an M-Pesa request that may or may not be honoured.

## Objective

Ship an end-to-end studio-in-a-box for Kenyan creatives that handles the quote → booking → delivery → payment loop, with M-Pesa as the primary payment rail and a portfolio surface that helps the next client find the photographer. Outcome: a Kenyan photographer books 5+ paid jobs per month within 90 days of onboarding, with payment collected automatically on delivery.

## Target Users

Kenyan photographers and videographers (wedding, event, product, real estate, content creator). Solo operators and small studios (1–4 creatives). Adults 22–40, smartphone-first, M-Pesa-native, mostly based in Nairobi, Mombasa, Kisumu, Eldoret. Secondary: Kenyan event planners and corporate marketing teams who want a vetted roster of creatives.

## MVP Scope

Public portfolio page per photographer with watermark-protected previews, packages (4-hour, 8-hour, full-day), and 'book now' deposit via M-Pesa. Booking calendar with availability, deposit hold, and balance-on-delivery. Photo/video delivery via Cloudinary with password-protected gallery link and 30-day retention. WhatsApp notifications at every milestone (booking, deposit, shoot day, delivery). Optional M-Pesa STK push for the balance. Discover/search: city + category (wedding, event, product).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/business/3zqee2a4x1-cant-start-a-photography-and-vide` follows the constraints in `294-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Kenya.

For Kenya, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

M-Pesa Daraja API is the primary payment rail; card payments as secondary. Kenyan Shilling (KES) pricing throughout. Watermark on portfolio previews to prevent unauthorised reuse. Cloudinary signed URLs for the final gallery with a 7-day access window for the client. Mobile-first design — most photographers manage from their phones.
