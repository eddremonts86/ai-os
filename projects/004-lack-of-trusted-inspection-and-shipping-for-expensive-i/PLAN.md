---
id: "004"
slug: lack-of-trusted-inspection-and-shipping-for-expensive-i
title: Lack of trusted inspection and shipping for expensive items when selling between cities. Willing to pay $80–130 per deal.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/c1i0ydfpt1-lack-of-trusted-inspection-and-shipping"
  captured: "2026-07-17"
category: logistics
date: "2026-07-17"
tags: [Logistics, Transportation, Business, Retail, Other]
country: Russia
wtp:
  raw: $80–130 per deal
  currency: USD
  min: 80
  max: 130
  period: one-shot
  mrrMid: 105
tech: [Go, Postgres, S3, Stripe Connect, Resend]
---
# Lack of trusted inspection and shipping for expensive items when selling between cities. Willing to pay $80–130 per deal.

## Tech Stack

- **Backend:** Go (net/http + chi) for the deal engine; strong typing for monetary values.
- **Database:** Postgres with row-level security per deal; S3-compatible object store (Yandex Object Storage) for condition reports and photos.
- **Payments:** Stripe Connect Express if eligible; YooKassa as a Russian fallback for payouts and escrow holds.
- **Notifications:** Resend (or SMTP via Yandex) for transactional mail; SMS via SMS.ru for Russian numbers.
- **Inspector app:** lightweight mobile web app (PWA), signed URL uploads directly to S3.

## Architecture

A self-contained data-flow diagram lives at [`assets/cross-city-handoff-data-flow.html`](assets/cross-city-handoff-data-flow.html) (open in any browser; SVG rendered inline, no server required).

The deal is the unit of truth: every state transition (created, picked up, inspected, in storage, shipped, delivered, released) is append-only and timestamped. The buyer confirms delivery to release the escrow hold.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + inspector recruitment plan. End of week 2.
2. **M1 — Booking + inspector assignment.** Sellers book, ops assigns, inspector accepts. End of week 5.
3. **M2 — Inspection PWA.** Pickup checklist, photo upload, signed condition report. End of week 9.
4. **M3 — Escrow + shipping.** Stripe/YooKassa escrow, declared-value insurance integration, carrier API for shipping leg. End of week 14.
5. **M4 — 50-deal pilot.** 50 deals across 5 Russian cities, ops review. End of week 22.

## Risks

- **Insurance underwriting for Russian routes** — underwriters may decline coverage; mitigation: a tier-1 self-insurance pool for the first 100 deals, transitioning to underwritten coverage once loss data exists.
- **Sanctions-related PSP availability** — Stripe may exit Russia again; the platform must be able to switch to YooKassa without code changes (PSP adapter pattern).
- **Disputes** — condition reports must be legally admissible; counsel review required before launching commercial deals.
