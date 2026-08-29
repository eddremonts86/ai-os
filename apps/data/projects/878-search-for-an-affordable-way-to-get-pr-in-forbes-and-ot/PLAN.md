---
id: "878"
slug: search-for-an-affordable-way-to-get-pr-in-forbes-and-ot
title: Search for an affordable way to get PR in Forbes and other top media outlets
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/xi1ox0v161-search-for-an-affordable-way-to-get-pr-i"
category: marketing
date: "2025-10-26"
tags: [Marketing, Media, Other]
country: Russia
wtp:
  raw: $600-650
  currency: USD
  min: 600
  max: 650
  period: one-shot
tech: [Next.js, TypeScript, Stripe Checkout (pay-for-result escrow), Postgres with Drizzle ORM, journalist-contributor marketplace, dispute resolution, Coolify]
---
# Search for an affordable way to get PR in Forbes and other top media outlets

## Tech Stack

- **Frontend:** Next.js (App Router) + TypeScript + Tailwind CSS, served from a single Coolify instance behind Docker.
- **Backend:** Next.js server actions + Route Handlers; Postgres via Drizzle ORM for users, requests, bids, escrowed payments, and dispute state.
- **Payments:** Stripe Connect with destination charges; the founder's payment is held in escrow on the platform account and only transferred to the journalist (minus the 15% platform fee) on verified publication.
- **Cross-border fallback:** Wise Business API for payouts to journalists in regions where Stripe Connect is restricted (e.g., Russia, parts of LATAM); USDC on a low-fee chain evaluated as an alternative if Wise is also blocked.
- **Journalist vetting:** Persona or Veriff for identity verification; byline cross-check is a manual reviewer step (LinkedIn / outlet contributor-page link) before the journalist can bid.
- **Publication verification:** a Node.js crawler worker that hits the agreed URL, parses the article, validates domain + byline + keyword presence, and re-checks at 1, 7, and 30 days to enforce the 30-day guarantee.
- **Dispute resolution:** a small internal dashboard for human reviewers; resolution recorded with a public reason (without exposing journalist identity).

## Architecture

The Next.js app serves both the founder-facing flow (post a request, review bids, fund escrow, approve publication) and the journalist-facing flow (browse requests, submit bids, deliver the article, receive payout). A daily crawler job runs the publication verification; on success it triggers a Stripe transfer to the journalist; on failure it unlocks the dispute flow. A weekly payouts batch settles pending transfers.

```
Founder ─▶ POST /api/requests (target outlet, topic, deadline, budget)
                                  │
                                  ▼
                  Journalist sees request ─▶ submits bid + placement plan
                                  │
                                  ▼
                  Founder accepts bid ─▶ funds escrow (Stripe Connect)
                                  │
                                  ▼
                  Journalist delivers article ─▶ URL submitted
                                  │
                                  ▼
                  Crawler verifies (domain, byline, keywords)
                                  │
                                  ├─▶ pass ─▶ Stripe transfer (85% to journalist, 15% platform fee)
                                  │
                                  └─▶ fail ─▶ dispute flow ─▶ human reviewer
                                                       │
                                                       ├─▶ refund founder
                                                       └─▶ partial refund / uphold
```

## Milestones

1. **M0 — Spec + design freeze.** SPEC.md, DESIGN.md, target-outlet catalog, verification rules per outlet approved. End of week 1.
2. **M1 — Marketplace + bids.** Founder request flow, journalist bid flow, Postgres schema, basic auth. End of week 3.
3. **M2 — Stripe Connect escrow.** Stripe Connect onboarding for journalists (or Wise fallback), destination-charge escrow, founder Checkout. End of week 5.
4. **M3 — Publication verification.** Crawler worker, verification rules per outlet, 1/7/30-day re-checks, automated payout on pass. End of week 7.
5. **M4 — Dispute + reviewer dashboard.** Human-reviewed dispute flow, 5-business-day SLA, refund logic, public reason logging. End of week 9.
6. **M5 — Pilot.** 10 founders + 25 journalists onboarded; weekly verification + dispute review for 8 weeks. End of week 17.

## Risks

- **Outlet policy drift.** Forbes, TechCrunch, Bloomberg, and others tighten their contributor policies periodically; if a target outlet pauses new contributor content mid-pilot, the catalog shrinks and supply-side journalists churn. Mitigation: monitor outlet contributor pages quarterly and have a 2-outlet buffer above the 10–15 launch set.
- **Cross-border payment friction.** Stripe Connect's Russia support is constrained; if Wise is also blocked, the marketplace becomes US-only and excludes the headline demand (Ivan is in Russia). v1 must have at least one working payout path for non-US journalists or the unit economics exclude a meaningful share of supply.
- **Verification rule gaming.** A journalist could publish a passing article and pull it after 30 days, pocketing the payout; the 30-day re-check must be enforced with a clawback path (reserve the last 10% of payout for 30 days) and the dispute flow must be fast enough to make gaming unprofitable.
- **Editorial integrity.** The marketplace must not become a vector for pay-to-play content that damages the reputation of contributors and outlets; the v1 launch must enforce contributed / interview-led content only (no advertorial masquerading as news), with a reviewer trained to flag borderline cases.
- **15% take rate vs. $600–$650 budget.** At the stated willingness-to-pay, the journalist earns $510–$552 per placement; this is competitive with current contributor rates but leaves no room for a price increase. If competitor marketplaces push rates up, the marketplace either raises the floor budget or accepts thinner supply.
- **Dispute resolution scaling.** Human-reviewed disputes at 5 business days do not scale past ~50 active placements/month without a reviewer team; v1 must define the scaling path (junior reviewer + rubric) before the pilot concludes.
