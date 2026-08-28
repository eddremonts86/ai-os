---
id: "383"
slug: ineffective-client-acquisition-and-spam-overload-for-a-
title: Ineffective client acquisition and spam overload for a lawyer
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/7vyumtmek1-ineffective-client-acquisition-and-spam"
category: freelance
date: "2025-09-08"
tags: [Freelance, Marketing]
country: Armenia
---
# Ineffective client acquisition and spam overload for a lawyer

## Tech Stack

The stack below is what *this* plan needs; chosen for the `leads` of the post, not a corpus default:
- **Next.js 15** — chosen because the `leads` step the post names requires it.
- **TypeScript** — chosen because the `leads` step the post names requires it.
- **Postgres** — chosen because the `leads` step the post names requires it.
- **Meta Lead Ads API** — chosen because the `leads` step the post names requires it.
- **WhatsApp Business API (filter chat)** — chosen because the `leads` step the post names requires it.
- **Stripe Subscriptions** — chosen because the `leads` step the post names requires it.
- **Vercel** — chosen because the `leads` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `leads` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `leads` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `leads` problem (week 1): one call with the poster (or a comparable Armenian lawyer (solo or small firm) getting junk leads and no good ones); record the exact `leads` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `leads` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `leads` pilot (weeks 5–6): the poster plus 3–5 comparable Armenian lawyer (solo or small firm) getting junk leads and no good oness run their real `leads` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `leads` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `leads` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Armenian lawyer (solo or small firm) getting junk leads and no good ones exist with the same `leads` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `leads` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
