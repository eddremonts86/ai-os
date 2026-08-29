---
id: "734"
slug: a-private-breeder-needs-a-platform-to-find-trusted-sell
title: "A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xcnt6j8g51-a-private-breeder-needs-a-platform-to-fi"
  captured: "2026-07-17"
category: marketing
date: "2026-07-17"
tags: [Marketing, Business, Retail, Other]
country: Georgia
wtp:
  raw: "8,000 RUB per puppy (10% of 80,000 RUB sale) + platform fee TBD"
  currency: RUB
  min: 8000
  max: 8000
  period: one-shot
  mrrMid: 8000
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that.

## Tech Stack

- **Frontend:** React + TypeScript SPA served by TanStack Start, with a breeder dashboard, a helper dashboard, and a public marketplace surface.
- **Backend API:** Node.js + TanStack Start server functions; SQLite via Drizzle ORM; single Coolify instance behind Docker for v1.
- **Auth:** email-link via Resend (passwordless), with a "switch role" path so a single user can be both breeder and helper over time.
- **KYC vendor:** a third-party identity-verification provider (ID + selfie + phone) called from the helper onboarding flow; vendor pick deferred to M1.
- **Payments:** a regional PSP that supports ruble and lari settlements for the helper commission and the platform fee (Stripe or a regional PSP depending on coverage at launch).
- **Reputation:** simple post-deal star ratings + written reviews on profile; persisted in the same SQLite database.
- **Dispute path:** a ticket queue inside the app, with the logged deal record attached so the mediator has the full history.

## Architecture

A single TanStack Start app serves the marketing page, the breeder dashboard, the helper dashboard, and the marketplace. The KYC vendor runs as an external service; the app calls it during helper onboarding and stores only the resulting verification status, never the underlying ID documents. The PSP webhook updates the deal ledger; the platform fee and the helper's 10% commission settle from the deal close event, not from any manual transfer. SQLite holds users, kennel profiles, helper profiles, listings, deal records, ratings, and dispute tickets.

```
Browser ─▶ TanStack Start (marketing + breeder + helper + marketplace)
              │
              ├─▶ /api/helper/kyc ──▶ KYC vendor (ID + selfie + phone)
              │                       │
              │                       └─▶ store verification status only
              │
              ├─▶ /api/deal/close ──▶ PSP webhook ──▶ Drizzle/SQLite
              │                          │
              │                          └─▶ split: helper 10% + platform fee
              │
              └─▶ /api/dispute ──▶ ticket queue ──▶ Drizzle/SQLite
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + KYC vendor shortlist approved. End of week 1.
2. **M1 — Onboarding + KYC.** Breeder signup, helper signup, KYC flow wired to the chosen vendor, profile pages live. End of week 3.
3. **M2 — Marketplace discovery.** "Looking for helpers" listings, helper search by category / region / commission, in-app contact. End of week 5.
4. **M3 — Deal ledger + PSP settlement.** Close-deal flow, logged commission, PSP split (helper 10% + platform fee), confirmation receipts. End of week 7.
5. **M4 — Reputation + dispute path.** Post-deal ratings, profile reviews, dispute ticket queue with the logged deal record attached. End of week 9.
6. **M5 — Pilot + onboarding of David's kennel and 5 additional breeders.** Validate that the helper-of-strangers pattern actually scales past the breeder's existing network. End of week 13.

## Risks

- **KYC substitutes for personal trust, or doesn't.** The entire product thesis is that platform-mediated identity + reputation can replace the personal-trust signal David's existing helper provides. The first 50 platform-mediated deals are the only real evidence; before then, every assumption is provisional.
- **Regional PSP coverage.** Ruble and lari settlement with a clean split between helper commission and platform fee is non-trivial outside the major global PSPs; vendor choice in M1 can either unlock or stall the deal-ledger milestone.
- **Personal-data exposure.** Storing KYC artefacts (even just verification status) makes the platform a regulated data controller in any launched region; retention / deletion policy must be real before launch, not bolted on after.
- **Helper supply is the bottleneck.** If the platform has breeder demand but no KYC'd helpers, the marketplace looks empty; v1 needs a parallel pipeline to recruit helpers (e.g., outreach to existing Avito / classifieds closers) before breeders hit a dead marketplace.
- **Dispute mediation cost.** In-person goods (live animals) are intrinsically harder to mediate than digital services; v1 should narrow the categories it accepts so dispute volume stays tractable.
- **Author's stated willingness-to-pay is per-deal, not monthly.** Revenue therefore depends on closed-deal volume, which depends on helper supply; a slow first month is a runway risk for the operator.
