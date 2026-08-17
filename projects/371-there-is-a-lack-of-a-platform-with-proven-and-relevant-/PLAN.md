---
id: "371"
slug: there-is-a-lack-of-a-platform-with-proven-and-relevant-
title: There is a lack of a platform with proven and relevant marketing cases
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/freelance/3nb3237gu1-there-is-a-lack-of-a-platform-with-prove"
category: freelance
date: "2025-09-18"
tags: [Freelance, Marketing]
country: Russia
---
# There is a lack of a platform with proven and relevant marketing cases

## Tech Stack

The stack below is what *this* plan needs; chosen for the `cases` of the post, not a corpus default:
- **Next.js 15** — chosen because the `cases` step the post names requires it.
- **TypeScript** — chosen because the `cases` step the post names requires it.
- **Postgres + pgvector (semantic case search)** — chosen because the `cases` step the post names requires it.
- **Exa API (web case harvesting)** — chosen because the `cases` step the post names requires it.
- **Stripe Connect (paid submissions)** — chosen because the `cases` step the post names requires it.
- **Vercel** — chosen because the `cases` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `cases` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `cases` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `cases` problem (week 1): one call with the poster (or a comparable Russian marketing manager or agency owner sourcing case studies to plan campaigns); record the exact `cases` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `cases` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `cases` pilot (weeks 5–6): the poster plus 3–5 comparable Russian marketing manager or agency owner sourcing case studies to plan campaignss run their real `cases` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `cases` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `cases` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Russian marketing manager or agency owner sourcing case studies to plan campaigns exist with the same `cases` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `cases` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
