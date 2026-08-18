---
id: "380"
slug: automating-the-referral-program-for-teachers-on-tilda
title: Automating the referral program for teachers on Tilda
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/stn9lyfeo1-automating-the-referral-program-for-teac"
category: marketing
date: "2025-09-10"
tags: [Marketing]
country: Russia
---
# Automating the referral program for teachers on Tilda

## Tech Stack

The stack below is what *this* plan needs; chosen for the `referral` of the post, not a corpus default:
- **Next.js 15** — chosen because the `referral` step the post names requires it.
- **TypeScript** — chosen because the `referral` step the post names requires it.
- **Postgres** — chosen because the `referral` step the post names requires it.
- **Stripe Connect (commission payouts)** — chosen because the `referral` step the post names requires it.
- **Tilda Forms webhook** — chosen because the `referral` step the post names requires it.
- **Resend (referral emails)** — chosen because the `referral` step the post names requires it.
- **Vercel** — chosen because the `referral` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `referral` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `referral` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `referral` problem (week 1): one call with the poster (or a comparable Russian teacher or course creator using Tilda to host a course and a manual referral program); record the exact `referral` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `referral` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `referral` pilot (weeks 5–6): the poster plus 3–5 comparable Russian teacher or course creator using Tilda to host a course and a manual referral programs run their real `referral` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `referral` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `referral` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Russian teacher or course creator using Tilda to host a course and a manual referral program exist with the same `referral` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `referral` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
