---
id: "391"
slug: how-strange-is-this
title: How strange is this?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnr1ls/how_strange_is_this/"
category: saas
date: "2026-08-13"
---
# How strange is this?

## Tech Stack

The stack below is what *this* plan needs; chosen for the `niche` of the post, not a corpus default:
- **Next.js 15 App Router** — chosen because the `niche` step the post names requires it.
- **TypeScript** — chosen because the `niche` step the post names requires it.
- **Postgres** — chosen because the `niche` step the post names requires it.
- **Stripe Subscriptions + Stripe Tax** — chosen because the `niche` step the post names requires it.
- **Resend** — chosen because the `niche` step the post names requires it.
- **Railway (existing deploy target)** — chosen because the `niche` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `niche` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `niche` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `niche` problem (week 1): one call with the poster (or a comparable solo dev in a specific niche, accidentally shipping a paid landing page before the product is built); record the exact `niche` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `niche` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `niche` pilot (weeks 5–6): the poster plus 3–5 comparable solo dev in a specific niche, accidentally shipping a paid landing page before the product is builts run their real `niche` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `niche` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `niche` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar solo dev in a specific niche, accidentally shipping a paid landing page before the product is built exist with the same `niche` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `niche` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
