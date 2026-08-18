---
id: "387"
slug: no-auto-reply-for-orders-in-the-photographers-chat
title: "No auto-reply for orders in the photographers' chat"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/freelance/r3sxzzfh11-no-auto-reply-for-orders-in-the-photogra"
category: freelance
date: "2025-09-08"
tags: [Freelance]
country: Russia
---
# No auto-reply for orders in the photographers' chat

## Tech Stack

The stack below is what *this* plan needs; chosen for the `auto-reply` of the post, not a corpus default:
- **Telegram Bot API** — chosen because the `auto-reply` step the post names requires it.
- **Anthropic Claude API (reply drafting)** — chosen because the `auto-reply` step the post names requires it.
- **Postgres** — chosen because the `auto-reply` step the post names requires it.
- **Cloudflare R2 (portfolio)** — chosen because the `auto-reply` step the post names requires it.
- **Stripe** — chosen because the `auto-reply` step the post names requires it.
- **Vercel** — chosen because the `auto-reply` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `auto-reply` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `auto-reply` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `auto-reply` problem (week 1): one call with the poster (or a comparable Russian photographer (likely wedding or portrait) who runs a Telegram/WhatsApp order chat and misses inquiries when shooting); record the exact `auto-reply` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `auto-reply` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `auto-reply` pilot (weeks 5–6): the poster plus 3–5 comparable Russian photographer (likely wedding or portrait) who runs a Telegram/WhatsApp order chat and misses inquiries when shootings run their real `auto-reply` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `auto-reply` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `auto-reply` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Russian photographer (likely wedding or portrait) who runs a Telegram/WhatsApp order chat and misses inquiries when shooting exist with the same `auto-reply` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `auto-reply` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
