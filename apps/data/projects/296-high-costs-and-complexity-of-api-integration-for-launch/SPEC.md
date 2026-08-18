---
id: "296"
slug: high-costs-and-complexity-of-api-integration-for-launch
title: High costs and complexity of API integration for launching a travel website
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/travel/cgh3qpuuy1-high-costs-and-complexity-of-api-integration-f"
category: dev
date: "2025-10-29"
tags: [Travel, Dev, Business]
country: India
tech: [Next.js 14, TypeScript, Postgres, TBO Holidays / Travelport / Hotelbeds adapters, Razorpay, AWS S3 / Cloudflare R2, OpenAI function-calling]
---
# High costs and complexity of API integration for launching a travel website

## Problem

Indian travel-agent SMBs that want to launch their own booking website face a wall of API integration cost and complexity. The title captures two failures: high costs and high complexity. Each supplier (TBO Holidays, Travelport, Hotelbeds, Cleartrip, MakeMyTrip affiliate) has its own API contract, auth model, and quirks. A small agency either pays a tech vendor ₹2–5 lakh to integrate one supplier, or stays on WhatsApp + Excel and loses the booking volume that an online storefront would generate.

## Objective

Ship a white-label travel-booking website platform that bundles the top 4–6 Indian and global travel suppliers behind a single integration, so a small Indian travel agency can launch a branded booking site in days, not months, and pay a transparent per-booking fee instead of a custom-integration cost.

## Target Users

Indian travel-agent SMBs (solo agents, small agencies of 2–10 staff) in tier-1 and tier-2 cities. Agents who already book via phone/WhatsApp and want a storefront. Secondary: regional B2B travel agents in metros who want a self-branded booking portal.

## MVP Scope

White-label storefront template: hero, search, results, booking, payment. Single integration layer to TBO Holidays and one global hotel supplier (Hotelbeds or TravelgateX). Flight + hotel search, results caching, mark-up per supplier. Razorpay payment integration with INR pricing. Agent console: manage mark-ups, view bookings, manage cancellations. Booking confirmation via email + WhatsApp. Sub-domain per agent (agent.bookwithme.in) on a wildcard cert.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/travel/cgh3qpuuy1-high-costs-and-complexity-of-api-in` follows the constraints in `296-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Per-booking fee, not per-seat — agent can have unlimited sub-agents under their brand. INR pricing with GST. No PCI scope: card data touches only Razorpay. Flight cancellations and refunds must follow supplier SLAs, surfaced clearly to the agent. Initial inventory: TBO Holidays + 1 hotel supplier + 1 flight supplier; defer Visa/Mastercard for international cards to v2.
