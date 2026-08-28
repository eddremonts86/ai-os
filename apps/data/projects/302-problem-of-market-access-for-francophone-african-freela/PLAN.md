---
id: "302"
slug: problem-of-market-access-for-francophone-african-freela
title: Problem of market access for francophone African freelancers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/kh7v4kr3i1-problem-of-market-access-for-francophone"
category: freelance
date: "2025-11-13"
tags: [Freelance, Career, Other]
country: Cameroon
tech: [Next.js, TypeScript, Postgres, Stripe Connect, Resend, Fiverr-style marketplace, Hetzner]
---
# Problem of market access for francophone African freelancers

## Tech Stack

- **Marketplace app:** Next.js 14 (App Router), TypeScript, deployed on Hetzner behind a Coolify reverse proxy.
- **Database:** Postgres on Hetzner for freelancers, buyers, briefs, proposals, jobs, escrow ledger.
- **Payments + escrow:** Stripe Connect (Custom accounts) for buyer-funded escrow; payouts to mobile money via a regional aggregator where Stripe Connect is unavailable.
- **i18n:** next-intl with FR/EN locale files committed to the repo; no runtime translation in v1.
- **Notifications:** Resend for transactional email, Africa's Talking for SMS-based vetting codes.

## Architecture

A single Next.js codebase serves three roles from one deployment: the public profile and job-board pages (SSG/ISR), the freelancer dashboard (authed RSC), and the buyer dashboard (authed RSC). Briefs and proposals are written through server actions that hit Postgres. Escrow funding uses Stripe Checkout; a webhook flips the job into "in progress" and locks the freelancer's payout until the buyer approves or the dispute window closes.

```
Browser ─▶ Next.js (profile pages, dashboards, job board)
              │
              ├─▶ Stripe Checkout ── webhook ──▶ Postgres (escrow ledger)
              │                                      │
              └─▶ Proposal / brief server actions ───┤
                                                     ▼
                                            Regional payout partner
                                            (mobile money / local bank)
```

## Milestones

1. **M0 — Spec freeze + i18n skeleton.** FR/EN routing live on a stub homepage. End of week 1.
2. **M1 — Profile + vetting flow.** Freelancer signs up, uploads portfolio, passes identity check, gets the "verified" badge. End of week 3.
3. **M2 — Job board + escrow.** Buyers post briefs; freelancers apply; Stripe-funded escrow opens on accept. End of week 6.
4. **M3 — Payouts.** Escrow releases to mobile money / local bank; Resend confirms to both sides. End of week 8.
5. **M4 — 50-freelancer pilot across 3 countries.** Cameroon, Senegal, Côte d'Ivoire. End of week 12.

## Risks

- **Stripe Connect coverage gap** — Stripe does not always support Custom accounts in every francophone African country; the regional payout partner is the fallback. The product must degrade cleanly to that path without forcing the freelancer to re-onboard.
- **Identity check fraud** — vetting is the trust backbone; a low-quality check turns the platform into a generic freelancer farm. Mitigation: a real paid trial task before the "verified" badge.
- **Language asymmetry** — buyers may post in English, freelancers in French, and vice versa; a missing translation drops either side's conversion. Mitigation: a "post in both languages" CTA during brief creation, not auto-translation.
