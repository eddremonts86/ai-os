---
id: "366"
slug: need-for-a-built-in-audio-player-in-tilda-product-catal
title: Need for a built-in audio player in tilda product catalog
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/no-code/9gfljgt4l1-need-for-a-built-in-audio-player-in-tild"
category: no-code
date: "2025-09-20"
tags: [No-Code, Marketing, Retail, Dev]
country: Russia
---
# Need for a built-in audio player in tilda product catalog

## Tech Stack

The stack below is what *this* plan needs; chosen for the `audio` of the post, not a corpus default:
- **Tilda Zero Block** — chosen because the `audio` step the post names requires it.
- **Custom HTML block (vanilla JS)** — chosen because the `audio` step the post names requires it.
- **Cloudflare R2 (audio storage)** — chosen because the `audio` step the post names requires it.
- **Plausible (event tracking)** — chosen because the `audio` step the post names requires it.
- **Tilda Forms webhook** — chosen because the `audio` step the post names requires it.
- **Cloudflare Pages** — chosen because the `audio` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `audio` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `audio` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `audio` problem (week 1): one call with the poster (or a comparable Russian Tilda freelancer or studio owner building product catalog pages); record the exact `audio` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `audio` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `audio` pilot (weeks 5–6): the poster plus 3–5 comparable Russian Tilda freelancer or studio owner building product catalog pagess run their real `audio` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `audio` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `audio` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Russian Tilda freelancer or studio owner building product catalog pages exist with the same `audio` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `audio` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
