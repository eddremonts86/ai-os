---
id: "006"
slug: moving-with-furniture-is-a-weeks-long-headache-no-servi
title: "Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/9na53d57r1-moving-with-furniture-is-a-weeks-long-he"
  captured: "2026-07-17"
category: logistics
date: "2026-07-17"
tags: [Logistics, Transportation, Retail, Other]
country: USA
wtp:
  raw: "up to 50% commission"
  currency: PCT
  max: 50
  period: one-shot
tech: [Next.js, Postgres, Stripe Connect, Twilio, Cloudflare R2]
---

# Moving with furniture is a weeks-long headache. No service picks up everything and pays fairly. Willing to give up to 50% commission just to get rid of this pain.

## Tech Stack

- **Intake + dashboard:** Next.js 14 on Vercel.
- **Database:** Postgres on Neon; Cloudflare R2 for the household photo archive.
- **Marketplace:** single integrated marketplace (own admin console), no third-party listing integration in v1.
- **Payments:** Stripe Connect for crew payouts and household deposits.
- **Notifications:** Twilio SMS for crew dispatch and household updates.

## Architecture

The platform is a marketplace that the household never sees. Households interact with a single intake + status page; crews interact with a pickup app; ops staff see a sales dashboard. The marketplace is a private Next.js admin app that aggregates, prices, and publishes listings to the public storefront.

```
Household ── intake + status page ───┐
                                    │
Crew ── pickup app (PWA) ───────────┼─▶ Next.js API ─▶ Postgres
                                    │              │
Ops ── sales dashboard ─────────────┘              ├─▶ Cloudflare R2 (photos)
                                                   └─▶ Stripe Connect (payouts)
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + crew recruitment plan in 1 metro. End of week 2.
2. **M1 — Intake + crew app.** ZIP form, flat quote, crew dispatch, photo upload. End of week 6.
3. **M2 — Marketplace + checkout.** Private listings, public storefront, Stripe checkout for buyers. End of week 10.
4. **M3 — Payouts + 1099-K.** Stripe Connect household payouts, lifetime tracking for tax. End of week 14.
5. **M4 — 50-household pilot.** 50 moves in 1 US metro, unit-economics review. End of week 22.

## Risks

- **Crew theft** — background checks, W-2 employment, and a per-pickup insurance bond are mandatory; a single theft story on social media ends the company.
- **72-hour sell-through** — the marketplace must be tuned for speed over price; price reductions every 12h are the default.
- **Donation logistics** — the platform must maintain a daily donation route or storage cost will dominate the unit economics.