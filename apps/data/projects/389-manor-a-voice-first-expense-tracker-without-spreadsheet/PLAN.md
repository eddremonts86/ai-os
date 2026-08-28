---
id: "389"
slug: manor-a-voice-first-expense-tracker-without-spreadsheet
title: "Manor : a voice-first expense tracker without spreadsheet-style forms"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnrjw1/manor_a_voicefirst_expense_tracker_without/"
category: saas
date: "2026-08-13"
---
# Manor : a voice-first expense tracker without spreadsheet-style forms

## Tech Stack

The stack below is what *this* plan needs; chosen for the `voice` of the post, not a corpus default:
- **Kotlin (Android, Jetpack Compose)** — chosen because the `voice` step the post names requires it.
- **OpenAI Whisper (transcription)** — chosen because the `voice` step the post names requires it.
- **Anthropic Claude API (parsing pass)** — chosen because the `voice` step the post names requires it.
- **Postgres + pgvector (semantic category match)** — chosen because the `voice` step the post names requires it.
- **Cloudflare R2 (audio)** — chosen because the `voice` step the post names requires it.
- **Hetzner (EU residency)** — chosen because the `voice` step the post names requires it.

Every plan in batch-5 picks a different stack so the corpus tech-stack facet actually filters. The legacy default (React + TanStack Start + SQLite/Drizzle + Coolify + Docker) is the exact thing this corpus is moving away from.

## Architecture

One application, one Postgres database, one cron + queue for async work, and one external integration per `voice` core flow (telephony, payments, ad platform, vision model — picked from PLAN.md's stack). No microservices, no separate admin app, no second deploy target in v1.

All async `voice` work runs through the same queue so failures stay observable from a single log. The deploy target is the host listed in PLAN.md; until then there is no production and no staging divergence.

## Milestones

M0 — Confirm the `voice` problem (week 1): one call with the poster (or a comparable Android-first consumer app builder shipping a voice-driven expense journal); record the exact `voice` workflow being replaced and the single metric that, if it moves, proves the product works. Anything not derivable from the source post is an open hypothesis until this call.

M1 — Working `voice` MVP (weeks 2–4): the single flow from SPEC.md MVP Scope, shipped to a staging URL the role can click. Demo-grade design, real data, one integration working end-to-end.

M2 — `voice` pilot (weeks 5–6): the poster plus 3–5 comparable Android-first consumer app builder shipping a voice-driven expense journals run their real `voice` workflow through it; the success metric from PRODUCT.md is measured weekly. No growth work during this window.

M3 — `voice` pricing decision (week 7): only after the pilot. If retention or stated willingness-to-pay holds, set the price the source implies; if it does not, the plan stays in pilot until it does.

## Risks

Technical: a single `voice` integration (one of: telephony, ad API, vision model, payments) can block the demo. Mitigation: keep the integration behind one interface so a provider swap is one repo, not a rewrite.

Adoption: the poster is one person; the product only exists if similar Android-first consumer app builder shipping a voice-driven expense journal exist with the same `voice` pain. Mitigation: the M0 problem-confirmation call and the M2 pilot are non-negotiable; if the pilot fails, the project stops, not pivots.

Commercial: when the source does not name a willingness-to-pay, pricing without that `voice` signal is guessing. Mitigation: defer monetization until retention data exists; price only after the pilot, never before.
