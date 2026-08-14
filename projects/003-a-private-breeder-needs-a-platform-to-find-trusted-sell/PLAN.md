---
id: "003"
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
tech: [Next.js, Postgres, Stripe Connect, Twilio, Mapbox]
---
# A private breeder needs a platform to find trusted sellers who work for a commission. One helper at 10% commission already boosted sales. Need more people like that.

## Tech Stack

- **Frontend:** Next.js 14 with a small WebSocket layer for chat.
- **Database:** Postgres on Supabase with row-level security per breeder/seller pair.
- **Payments:** Stripe Connect Express accounts for sellers; platform collects a 15% application fee on each transfer.
- **Notifications:** Twilio for SMS in regions without Telegram; native Telegram Bot for the Georgian market primary channel.
- **Geolocation:** Mapbox for region pickers and proximity ranking.

## Architecture

A two-sided Next.js app where breeders and sellers authenticate into mirrored dashboards. Vetting is a separate ops console used by a human reviewer (no public auto-approval). Payouts flow through Stripe Connect so the platform never custodies funds.

```
Breeder app ─┐                          ┌─▶ Vetting console (human)
             ├─▶ Next.js (App Router) ───┤
Seller app ──┘                          └─▶ Stripe Connect (transfers + fees)
                    │                          │
                    └─▶ Postgres / Supabase ◀─┘ (RLS, audit trail)
                                          │
                                          └─▶ Telegram Bot (deal notifications)
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + breeder-side mock. End of week 2.
2. **M1 — Two-sided onboarding.** Breeder + seller profiles, region pickers. End of week 5.
3. **M2 — Listings + apply flow.** Listings live, sellers apply, breeder reviews. End of week 8.
4. **M3 — Vetting + payouts.** Human-reviewed vetting, Stripe Connect onboarding, first closed deal paid out. End of week 12.
5. **M4 — Telegram integration.** Bot-driven deal notifications for the Georgian market. End of week 16.

## Risks

- **Stripe Connect onboarding friction** in the Caucasus — sellers may lack the documents Connect asks for. Mitigation: keep a manual payout fallback for the first 50 sellers.
- **Vetting bottleneck** — if a single human reviewer cannot keep up, listings will backlog. Mitigation: pre-vetting rubric + a 48h SLA dashboard.
- **Reputation risk** — a single bad seller on a high-traffic listing can damage breeder trust permanently. Mitigation: per-listing seller ratings + a 90-day cooldown after a chargeback.
