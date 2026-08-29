---
id: "735"
slug: lack-of-trusted-inspection-and-shipping-for-expensive-i
title: Lack of trusted inspection and shipping for expensive items when selling between cities. Willing to pay $80–130 per deal.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/c1i0ydfpt1-lack-of-trusted-inspection-and-shipping"
  captured: "2026-06-06"
category: logistics
date: "2026-06-06"
tags: [Logistics, Transportation, Business, Retail, Other]
country: Russia
wtp:
  raw: $80–130 per deal
  currency: USD
  min: 80
  max: 130
  period: deal
  mrrMid: 105
tech: [Flutter mobile app for inspectors, Ruby on Rails API, PostgreSQL, S3 media storage with signed URLs, Escrow payment provider integration, Carrier tracking APIs]
---
# Lack of trusted inspection and shipping for expensive items when selling between cities. Willing to pay $80–130 per deal.

## Phase 0: Scaffold

- [x] Capture the problem from ProblemHunt, including the author's seven-step service sketch
- [ ] Write DESIGN.md (inspector checklist screens, report view for buyer and seller)
- [ ] Choose an escrow provider that will hold funds for private high-value deals
- [ ] Select the launch city pair and confirm a carrier with 3–7 day service between them
- [ ] Draft the inspector agreement and the liability boundary at carrier handover

## Phase 1: Core

- [ ] Deal model and state machine: booked → inspected → packed → handed over → delivered → released
- [ ] Booking flow: listing details, item value, seller address, requested inspection window
- [ ] Inspector app checklist: item exists, matches listing, serial number, accessories, completeness
- [ ] Media capture offline-first: photos, video, and a short working test clip where the item can be powered up
- [ ] Upload queue that survives no signal at the seller's address
- [ ] Packaging step: record packing performed or supervised, with photos of the sealed package
- [ ] Carrier handover: record tracking number and verify it against the carrier tracking API
- [ ] Single report, readable by buyer and seller via signed URLs, immutable once published
- [ ] Escrow: hold on booking, release on the carrier delivery event, hold on dispute
- [ ] Per-deal fee of $80–130 for $1,000–$1,500 items, with a higher band for more expensive goods
- [ ] Dispute path: buyer contests condition, report and media attached, insurance claim support
- [ ] End-to-end test on a real deal: the ESAB welding machine case, inspection to released payment

## Phase 2: Deploy

- [ ] Recruit and vet inspectors in the launch city
- [ ] Run the first ten paid deals with founder-supervised inspections
- [ ] Measure booking-to-delivery days against the 3–7 day carrier baseline
- [ ] Review unit economics per deal before opening a second city
