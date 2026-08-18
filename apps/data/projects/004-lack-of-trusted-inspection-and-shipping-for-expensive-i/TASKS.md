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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (deal-focused, single-CTA per page)
- [ ] Provision Go API skeleton + Postgres + S3-compatible bucket
- [ ] Stripe Connect or YooKassa application filed
- [ ] Insurance underwriter scoping call

## Phase 1: Core

- [ ] Seller signup + identity verification
- [ ] Booking flow: city, item category, declared value → flat quote
- [ ] Inspector directory + ops console for assignment
- [ ] Inspector PWA: pickup checklist, photo grid, signed condition report
- [ ] Bonded storage assignment with 14-day default hold
- [ ] Escrow hold (Stripe or YooKassa) on booking, release on delivery confirmation
- [ ] Buyer portal: condition report view + delivery confirmation
- [ ] Dispute flow: open a case, evidence upload, ops arbitration
- [ ] End-to-end test: 3 deals, 2 cities, 1 dispute, full release

## Phase 2: Deploy

- [ ] Production deployment on a VPS (Hetzner or equivalent) with Postgres backups
- [ ] Recruit 10 vetted inspectors across 5 Russian cities
- [ ] Public launch in Moscow–St. Petersburg–Yekaterinburg triangle
- [ ] Legal review of condition report admissibility
- [ ] First-tier insurance pool seeded for self-insurance
- [ ] Post-mortem at week 22
