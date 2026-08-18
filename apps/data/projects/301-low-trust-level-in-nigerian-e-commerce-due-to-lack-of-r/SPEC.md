---
id: "301"
slug: low-trust-level-in-nigerian-e-commerce-due-to-lack-of-r
title: Low trust level in Nigerian e-commerce due to lack of reliable logistics service
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/8msk10fu31-low-trust-level-in-nigerian-e-commerce-d"
category: logistics
date: "2025-11-13"
tags: [Logistics, Business, Retail, Other]
country: Nigeria
tech: [Next.js, TypeScript, Postgres, Flutterwave, Termii SMS, Mapbox Directions API, Hetzner]
---
# Low trust level in Nigerian e-commerce due to lack of reliable logistics service

## Problem

Nigerian online buyers and sellers describe a recurring breakdown: orders are paid for, then disappear into a courier network with no consistent last-mile guarantee. Trust in the platform collapses because the delivery layer is unreliable — items arrive late, arrive damaged, or do not arrive at all, and the buyer has no real recourse. The title pins the cause explicitly: the missing piece is a logistics service buyers can rely on, not a marketplace or payment layer.

## Objective

Ship a thin logistics layer purpose-built for Nigerian e-commerce that exposes order tracking, cash-on-delivery reconciliation, and rider accountability end-to-end, so a small merchant can promise a delivery promise they actually keep.

## Target Users

- Small and mid-sized Nigerian e-commerce merchants selling via Instagram, WhatsApp, or a basic storefront.
- Nigerian online buyers paying on delivery, who need a way to verify a delivery is real and contact the rider.
- Independent dispatch riders and local courier operators who need dispatch work and a transparent payout schedule.

## MVP Scope

- Order intake API: merchant posts an order with pickup address, drop-off address, declared value, and COD amount.
- Rider assignment: a dispatcher console assigns the nearest available rider; rider app (mobile web) accepts or declines.
- Live tracking: map view for merchant and buyer, refreshed every 30 seconds via SMS-friendly status pings.
- COD reconciliation: rider marks cash collected, merchant sees a pending ledger, payout happens on T+1.
- Dispute button for buyers (item not received, damaged, wrong item) that freezes the payout until resolved.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/logistics/8msk10fu31-low-trust-level-in-nigerian-e-co` follows the constraints in `301-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Nigeria.

For Nigeria, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Must work on low-bandwidth 3G and on Android browsers used by dispatch riders.
- All customer-facing SMS routed through a Nigerian provider (Termii or Africa's Talking) to keep sender IDs recognisable.
- No biometric or KYC requirement on the rider side beyond phone number + BVN check.
