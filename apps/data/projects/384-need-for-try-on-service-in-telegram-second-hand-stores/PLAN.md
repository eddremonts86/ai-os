---
id: "384"
slug: need-for-try-on-service-in-telegram-second-hand-stores
title: Need for try-on service in Telegram second-hand stores
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/dknrnh1581-need-for-try-on-service-in-telegram-seco"
category: retail
date: "2025-09-08"
tags: [Retail]
country: Serbia
---
# Need for try-on service in Telegram second-hand stores

## Tech Stack

The stack below is what *this* plan needs; chosen for the `try-on` of the post, not a corpus default:
- **Telegram Bot API** — chosen because the `try-on` step the post names requires it.
- **Replicate (IDM-VTON virtual try-on)** — chosen because the `try-on` step the post names requires it.
- **Cloudflare R2 (user photos)** — chosen because the `try-on` step the post names requires it.
- **Postgres** — chosen because the `try-on` step the post names requires it.
- **Stripe Connect (fee per try-on)** — chosen because the `try-on` step the post names requires it.
- **Vercel** — chosen because the `try-on` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `try-on` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `try-on` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `try-on` problem (week 1): one call with the poster (or a comparable Serbian shopper buying clothes on a Telegram second-hand channel); record the exact `try-on` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `try-on` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `try-on` pilot (weeks 5–6): the poster plus 3–5 comparable Serbian shopper buying clothes on a Telegram second-hand channels run their real `try-on` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `try-on` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `try-on` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Serbian shopper buying clothes on a Telegram second-hand channel exist with the same `try-on` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `try-on` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
