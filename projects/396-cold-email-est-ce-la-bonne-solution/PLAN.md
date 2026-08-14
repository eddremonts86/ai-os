---
id: "396"
slug: cold-email-est-ce-la-bonne-solution
title: Cold email est ce la bonne solution ?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnod47/cold_email_est_ce_la_bonne_solution/"
category: saas
date: "2026-08-13"
---
# Cold email est ce la bonne solution ?

## Tech Stack

The stack below is what *this* plan needs; chosen for the `cold-email` of the post, not a corpus default:
- **Next.js 15 App Router** — chosen because the `cold-email` step the post names requires it.
- **TypeScript** — chosen because the `cold-email` step the post names requires it.
- **Postgres** — chosen because the `cold-email` step the post names requires it.
- **Resend (transactional + bulk)** — chosen because the `cold-email` step the post names requires it.
- **Anthropic Claude API (personalization pass)** — chosen because the `cold-email` step the post names requires it.
- **SIREN API / societe.com (French business lookup)** — chosen because the `cold-email` step the post names requires it.
- **Vercel + Hetzner (worker)** — chosen because the `cold-email` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `cold-email` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `cold-email` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `cold-email` problem (week 1): one call with the poster (or a comparable French SaaS founder considering a cold-email outbound machine targeting small French local businesses); record the exact `cold-email` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `cold-email` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `cold-email` pilot (weeks 5–6): the poster plus 3–5 comparable French SaaS founder considering a cold-email outbound machine targeting small French local businessess run their real `cold-email` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `cold-email` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `cold-email` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar French SaaS founder considering a cold-email outbound machine targeting small French local businesses exist with the same `cold-email` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `cold-email` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
