---
id: "001"
slug: a-photographer-moving-to-the-us-needs-clients-platforms
title: "A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/6t7ke01t41-a-photographer-moving-to-the-us-needs-cl"
  captured: "2026-07-17"
category: other
date: "2026-07-17"
tags: [Immigration, Freelance, Marketing, Career, Other]
country: Serbia
wtp:
  raw: $100–300/month
  currency: USD
  min: 100
  max: 300
  period: month
  mrrMid: 200
tech: [Next.js, Vercel, Stripe, Resend, Google Business Profile API]
---
# A photographer moving to the US needs clients. Platforms require reviews, agencies are expensive. Wants a website + ads that bring bookings. Willing to pay $100–300/month.

## Tech Stack

- **Frontend / site builder:** Next.js 14 on Vercel (one project per photographer under a shared tenant domain).
- **Bookings + deposits:** Stripe Checkout with a 25% non-refundable deposit, webhook-driven confirmation.
- **Email + review funnel:** Resend for transactional mail, Google Business Profile API for review-write prompts.
- **Ads:** Meta Marketing API + Google Ads API, run from a single server-side cron with per-photographer daily budget caps.
- **Database:** Postgres on Neon for tenants, photographers, bookings, ad-spend ledger.

## Architecture

A single Next.js app serves the photographer portfolio (SSG per slug) and the dashboard (authed RSC). Bookings hit a server action that creates a Stripe Checkout session and writes a `Booking` row in the same transaction. A nightly job rolls up ad-spend per photographer so cost-per-acquisition is queryable without a separate warehouse.

```
Browser ─▶ Next.js (portfolio + dashboard)
              │
              ├─▶ Stripe Checkout ── webhook ──▶ Postgres
              │
              └─▶ cron ──▶ Meta + Google Ads APIs ──▶ Postgres (ad-spend ledger)
                                       │
                                       └─▶ Resend ──▶ client email + review link
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-photographer mock approved. End of week 1.
2. **M1 — Site + booking.** Portfolio page, Stripe deposit flow, booking confirmation email. End of week 3.
3. **M2 — Review funnel.** Post-shoot email triggers Google review write; review count tracked per photographer. End of week 5.
4. **M3 — Ads + dashboard.** Meta + Google campaigns via API; dashboard with bookings, deposits, review count, cost-per-acquisition. End of week 8.
5. **M4 — 5-photographer pilot in 3 US metros.** End of week 12.

## Risks

- **Google Business Profile API access** is gated; if the application is denied, the review funnel falls back to manual email links with a copy-paste template — degrades the activation promise but not the booking flow.
- **Ad-spend predictability.** A photographer with a $200/month budget cannot absorb a single bad-day overspend; the cron enforces a hard daily cap with auto-pause at 110% of plan budget.
- **Cold-start quality.** Early photographers have no portfolio to show; the platform should either seed with sample shoots or require an upload gate before going live.
