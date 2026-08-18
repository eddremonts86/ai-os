---
id: "372"
slug: courier-app-navigation-and-grouping-issues-in-vozy-ozon
title: Courier app navigation and grouping issues in \u00abVozy Ozon\u00bb
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/logistics/69hxkoys91-courier-app-navigation-and-grouping-issu"
category: logistics
date: "2025-09-17"
tags: [Logistics]
country: Belarus
---
# Courier app navigation and grouping issues in «Vozy Ozon»

## Tech Stack

The stack below is what *this* plan needs; chosen for the `grouping` of the post, not a corpus default:
- **Flutter (cross-platform)** — chosen because the `grouping` step the post names requires it.
- **Dart** — chosen because the `grouping` step the post names requires it.
- **Postgres** — chosen because the `grouping` step the post names requires it.
- **Mapbox Directions API** — chosen because the `grouping` step the post names requires it.
- **Ozon Vozy internal API (where accessible)** — chosen because the `grouping` step the post names requires it.
- **VPS in Minsk (data residency)** — chosen because the `grouping` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `grouping` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `grouping` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `grouping` problem (week 1): one call with the poster (or a comparable Ozon Vozy courier working in Belarus using the courier app on a personal phone); record the exact `grouping` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `grouping` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `grouping` pilot (weeks 5–6): the poster plus 3–5 comparable Ozon Vozy courier working in Belarus using the courier app on a personal phones run their real `grouping` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `grouping` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `grouping` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Ozon Vozy courier working in Belarus using the courier app on a personal phone exist with the same `grouping` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `grouping` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
