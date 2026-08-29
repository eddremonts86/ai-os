---
id: "3689"
slug: adriselab-i-built-an-ai-media-buyer-for-my-own-meta-ads
title: AdRiseLab – I built an AI media buyer for my own Meta ads
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484708"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
wtp:
  raw: "$39/month (Starter), $99/month (Pro), $249/month (Scale)"
  currency: USD
  min: 39
  max: 249
  period: month
  mrrMid: 99
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, Meta Marketing API, Stripe]
---
# AdRiseLab – I built an AI media buyer for my own Meta ads

## Tech Stack

- **Marketing site + workspace front-end:** Next.js (App Router) with React Server Components for the long-form blog and the dashboard inside the same app.
- **API + AI worker:** Python with FastAPI for the AI Media Buyer copilot and the creative generation orchestration (model inference calls, prompt routing, scoring); Next.js Route Handlers cover the workspace CRUD paths.
- **Persistence:** PostgreSQL (single primary, read replicas behind PgBouncer for the workspaces that scale); Redis for session and the hourly fatigue-detection job queue.
- **Meta integration:** Meta Marketing API v18+ over OAuth2; the integration layer is its own internal module (`meta_client/`) with retry, rate-limit awareness, and edit-in-place creative refresh.
- **Generation:** Mix of in-house model orchestration and third-party image/video models behind a credit-costing gateway so the per-credit cost is observable and per-tier.
- **Billing:** Stripe with one product per tier and a metered line for credit top-ups; webhook updates the workspace's `credit_balance` and `subscription_status`.
- **Observability:** OpenTelemetry traces from the Next.js front-end into FastAPI and out to a Postgres-backed trace store; the "audit your account" funnel emits per-step spans.

## Architecture

```
Browser ─▶ Next.js (marketing + workspace)
                │
                ├──▶ /api/workspace/*  ──▶ Postgres / Redis
                │
                ├──▶ /api/meta/*  ─────▶ meta_client (Python)
                │                          │
                │                          ▼
                │                     Meta Marketing API
                │
                ├──▶ /api/copilot/* ──▶ FastAPI ──▶ LLM providers
                │                          │
                │                          ▼
                │                    Postgres (audit log,
                │                    recommendation history)
                │
                ├──▶ /api/generate/* ─▶ model gateway
                │                          │
                │                          ├─▶ image model
                │                          └─▶ video model
                │
                └──▶ cron (hourly) ─────▶ meta_client.fetch_insights
                                           │           │
                                           ▼           ▼
                                       Postgres     fatigue detector
                                                      │
                                                      ▼
                                                 recommendations
```

Every budget and bid action is exposed as a recommendation with an explicit approve/dismiss action — there is no path in the codebase where the system executes a Meta spend change without a human click. The architecture is opinionated on this and the product brief is explicit that it will stay that way until the approval loop earns loosening, not before.

## Milestones

1. **M0 — Meta connector skeleton.** OAuth2 flow, account structure read, campaign + ad set + creative CRUD, insight rollup queries. End of week 2.
2. **M1 — Creative generation MVP.** Product URL → asset extraction → 5 structurally distinct Meta-ready image creatives, edit-in-place refresh on an existing ad. End of week 5.
3. **M2 — Fatigue detector.** Hourly job, per-creative leading-indicator scoring, queue of flagged creatives with replacement variants pre-generated. End of week 8.
4. **M3 — AI Media Buyer copilot.** Chat-shaped surface that reads the connected account and returns ranked, specific recommendations; recommendation history is auditable. End of week 11.
5. **M4 — Competitor intelligence.** Meta Ad Library scraping at the published rate (20 / 60 / 100 searches per month by tier), tagging by hook type and format, run-duration as performance proxy. End of week 14.
6. **M5 — Stripe + three-tier billing.** Starter $39, Pro $99, Scale $249, credit ledger, top-ups, webhook flow, ROI calculator on the public site wired to live arithmetic. End of week 16.
7. **M6 — Approval-loop analytics.** Track recommendation → approve / dismiss latency, audit the "approval loop loosens" thesis from the article. End of week 20.

## Risks

- **Meta Marketing API drift.** Every Marketing API version breaks something. The risk is not "the API breaks once" but "the API changes in a way that requires re-architecting the edit-in-place refresh path" — which is the entire learning-phase-preservation value proposition. The integration layer needs version pinning and a fallback plan that surfaces the regression explicitly to the workspace.
- **Credit cost volatility.** The credit math depends on the per-image and per-video generation cost of underlying models. A 2x increase in upstream model cost without a price change cuts the Starter tier's margin to zero. The model gateway must emit real per-credit cost to the database weekly, not estimate it.
- **The "AI replaces the marketer" expectation.** Users may onboard with the expectation of full autopilot and feel underserved when every budget action needs approval. Onboarding must set the copilot-vs-autopilot expectation in the first session, or the product earns a churn problem that is not the product's fault.
- **The Icon collapse halo.** One publicized failure of an AI-admaker that over-claimed can shift buyer skepticism against the whole category. The article addresses this directly, but the article is one defense; a single in-app moment that violates the founder's "AI drafts, you approve" promise would be much louder.
- **Approval-loop loosening temptation.** As the AI earns accuracy on low-risk actions (pausing a clearly fatigued ad), there will be product pressure to remove the human gate. The architecture must make removing the gate a deliberate, audit-logged product decision, not a settings toggle.
