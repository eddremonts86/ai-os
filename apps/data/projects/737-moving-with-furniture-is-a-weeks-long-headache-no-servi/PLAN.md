---
id: "737"
slug: moving-with-furniture-is-a-weeks-long-headache-no-servi
title: "Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/9na53d57r1-moving-with-furniture-is-a-weeks-long-he"
  captured: "2026-05-27"
category: logistics
date: "2026-05-27"
tags: [Logistics, Transportation, Retail, Other]
country: USA
wtp:
  raw: "40-50% commission to a service"
  currency: USD
  period: one-shot
  min: 40
  max: 50
  mrrMid: 0
tech: [TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, React for ops console, third-party pickup logistics APIs]
---
# Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain.

## Tech Stack

- **Intake web app:** TypeScript + React, photo upload, address autocomplete, pickup-window picker; serves the household's manifest and the on-site buyout vs full-buyout selector.
- **Backend:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM; stores manifests, pickup schedules, photos, per-item sales, and household payouts.
- **Ops console:** React SPA for the warehouse team — per-item intake grading, photo upload to the resale channel, listing status, sale price recording, payout calculation.
- **Resale channel:** the operator's own storefront (existing); the operator records each item's sale and price; the system computes the household's 40–50% share.
- **Logistics:** third-party dispatch for pickup crews; integration is read-only in v1 (the system exports a daily route manifest, the dispatcher returns completion + odometer).
- **Payouts:** ACH via a single provider (Stripe Connect or similar); payout runs on the 1st and 15th of each month for items sold in the prior window.

## Architecture

```
Household
   │  intake form + photos
   ▼
┌────────────────────────────────────────────────────────────┐
│  Intake web app (TanStack Start)                           │
│   • Form, photo upload, address autocomplete               │
│   • Tier selector: full buyout (40-50% share) vs           │
│                    on-site buyout (instant, lower amount)   │
│   • Manifest preview → household e-signs before pickup     │
└────────────────────────────────────────────────────────────┘
        │
        ▼
   Drizzle/SQLite  ◀──▶  Ops console (React)
                                │  per-item intake grading
                                │  photo → resale channel
                                │  sale price recording
                                ▼
                       Resale channel storefront
                                │  sale events
                                ▼
                       Payout engine
                       (40-50% of realised sale,
                        ACH to household on 1st/15th)
```

## Milestones

1. **M0 — Spec freeze.** Intake form fields, manifest data model, share-percentage policy (40 / 45 / 50), markdown + donate policy after pickup. End of week 2.
2. **M1 — Intake + manifest.** Web form, photo upload, auto-generated manifest from photos (item + condition tier), household e-signs before pickup. End of week 4.
3. **M2 — Pickup + ops console.** Daily route export to dispatcher; ops console for intake grading and listing creation. End of week 6.
4. **M3 — Resale accounting.** Per-item sale recording, household share calculation, ACH payout on the 1st/15th. End of week 8.
5. **M4 — On-site buyout tier.** Instant offer at intake, same-day ACH or check, no resale accounting. End of week 10.
6. **M5 — Pilot.** 25 moves in the launch metro, household-satisfaction survey, retrospective on resale velocity. End of week 14.

## Risks

- **Resale velocity is the unit-economics driver.** If < 80% of items sell within 60 days, the per-move margin collapses. Decide the markdown policy up front (e.g. day-30 auto-discount, day-90 donate) so the warehouse team is not making one-off decisions.
- **Photo-vs-reality grading disputes.** If a piece the household listed as "like new" arrives with a torn cushion, the operator cannot retroactively reduce the household's share without a documented condition tier. Build the intake check into the manifest signature, not the post-pickup report.
- **Single-region launch.** A wrong metro (low move density, high Remoov competition) kills the unit economics. Validate launch metro with a 90-day pre-launch form-fill waiting list before signing a warehouse lease.
- **Payout transparency.** The author's pain with Remoov was the "pennies after expenses" surprise. The household report must show realised sale, fee split, and net share on one screen — not buried in an appendix.
