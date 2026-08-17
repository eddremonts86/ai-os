---
id: "382"
slug: need-for-a-unified-tilda-extension-combining-nolim-and-
title: Need for a unified Tilda extension combining Nolim and Annexx features
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/dev/82uz45nni1-need-for-a-unified-tilda-extension-combi"
category: dev
date: "2025-09-09"
tags: [Dev, No-Code]
country: Russia
---
# Need for a unified Tilda extension combining Nolim and Annexx features

## Tech Stack

The stack below is what *this* plan needs; chosen for the `extension` of the post, not a corpus default:
- **Tilda Zero Block + External JS bundle** — chosen because the `extension` step the post names requires it.
- **Next.js 15 (admin panel)** — chosen because the `extension` step the post names requires it.
- **TypeScript** — chosen because the `extension` step the post names requires it.
- **Postgres** — chosen because the `extension` step the post names requires it.
- **Stripe Subscriptions** — chosen because the `extension` step the post names requires it.
- **Vercel** — chosen because the `extension` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `extension` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `extension` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `extension` problem (week 1): one call with the poster (or a comparable Russian Tilda power-user paying for both Nolim and Annexx and wanting one bill, one panel); record the exact `extension` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `extension` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `extension` pilot (weeks 5–6): the poster plus 3–5 comparable Russian Tilda power-user paying for both Nolim and Annexx and wanting one bill, one panels run their real `extension` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `extension` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `extension` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Russian Tilda power-user paying for both Nolim and Annexx and wanting one bill, one panel exist with the same `extension` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `extension` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
