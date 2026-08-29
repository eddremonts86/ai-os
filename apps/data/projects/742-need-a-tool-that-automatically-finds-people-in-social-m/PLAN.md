---
id: "742"
slug: need-a-tool-that-automatically-finds-people-in-social-m
title: Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/6stv96yp21-need-a-tool-that-automatically-finds-peo"
category: social
date: "2026-04-28"
tags: [Social, Marketing, Business, Startups, AI, Productivity, Other]
country: USA
wtp:
  raw: $50/month
  currency: USD
  min: 50
  max: 50
  period: month
  mrrMid: 50
tech: [TypeScript, Node.js, BullMQ job queue, Postgres with Drizzle ORM, OpenAI or Anthropic API, Apify + Bright Data scraping, Coolify]
---
# Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

## Tech Stack

- **Frontend:** React + TypeScript SPA served from a single Coolify instance behind Docker.
- **Backend API:** Node.js + TanStack Start (or Hono) server functions; Postgres via Drizzle ORM for workspaces, queries, candidates, and quota usage.
- **Job queue:** BullMQ on Redis for scraping jobs (one job per platform per query), with per-platform rate-limit awareness.
- **Scrapers:** Apify + Bright Data workers (managed scraping infrastructure) wrapping each platform's public surface; the same `PlatformAdapter` interface isolates each platform so one ToS change does not break the others.
- **Matching engine:** OpenAI or Anthropic API for criteria-scoring; cost-tracked per query and capped at $0.10/query in the v1 budget.
- **Auth:** email-link (Resend) passwordless, single workspace per account.
- **Billing:** Stripe Subscriptions ($50/month single price), webhook updates `Workspace.subscriptionStatus`.

## Architecture

A single Node.js app serves the dashboard and the API. The user defines a query in the criteria builder; the query is enqueued as four parallel BullMQ jobs (one per platform); each platform's adapter scrapes public posts + profiles within its daily quota; raw candidates land in a `candidates_raw` table; the matching engine scores each candidate against the criteria and writes the structured hit list to a `candidates` table; the user downloads a CSV. A daily reconciliation job enforces per-platform quotas and emits a quota dashboard.

```
Browser ─▶ Criteria builder ─▶ POST /api/queries
                                    │
                                    ├─▶ BullMQ: enqueue 4 platform jobs
                                    │
                                    ▼
                          PlatformAdapter (LinkedIn / X / FB / TikTok)
                                    │
                                    ├─▶ Apify / Bright Data workers
                                    │
                                    └─▶ candidates_raw table
                                    │
                                    ▼
                          Matching engine (LLM scorer)
                                    │
                                    └─▶ candidates table (hit list)
                                    │
                                    ▼
                          Browser ─▶ CSV download
```

## Milestones

1. **M0 — Spec + design freeze.** SPEC.md, DESIGN.md, criteria-builder schema, PlatformAdapter interface approved. End of week 1.
2. **M1 — Criteria builder + queue.** React criteria builder, BullMQ wiring, Postgres schema, single-platform stub (X) end-to-end. End of week 3.
3. **M2 — LinkedIn + Facebook adapters.** Public-scraping adapters for LinkedIn and Facebook, quota dashboard, ToS review per platform. End of week 5.
4. **M3 — TikTok adapter (deferrable).** If TikTok ToS permits, ship the adapter; if not, document the deferral and remove TikTok from the criteria builder. End of week 6.
5. **M4 — Matching engine.** LLM-assisted scorer per candidate, criteria-satisfaction metadata, CSV export. End of week 7.
6. **M5 — Stripe + trial.** Stripe Subscriptions, 7-day trial with 3 searches, workspace status gating. End of week 8.
7. **M6 — Pilot.** 20 workspaces onboarded; weekly match-quality review. End of week 12.

## Risks

- **Platform ToS exposure.** LinkedIn and X both have active litigation against scrapers; the v1 launch must use managed scraping infrastructure (Apify / Bright Data) that absorbs the account-ban risk, not first-party accounts. If a platform tightens ToS mid-pilot, that adapter is paused immediately and email is sent — do not silently degrade.
- **LLM cost slippage.** If matching cost rises above $0.10/query (e.g., a model price increase), the v1 budget is broken. Mitigation: cache scored candidates for 24 h and switch to a smaller model for re-runs; document the price-point dependency in the README.
- **Quota vs. result freshness.** Daily quotas that respect rate limits can produce thin results for niche queries; the dashboard must show "estimated candidates" before the user pays the quota cost, or the $50/month expectation is silently violated.
- **TikTok deferral risk.** TikTok scraping is the most ToS-fragile of the four platforms; if M3 slips into a legal grey area, TikTok must be removed from v1 with a documented deferral, not slipped past the gate.
- **Match quality vs. throughput.** Returning 50 candidates per query in 24 h requires aggressive scraping; returning higher-quality matches requires longer dwell time. The criteria builder must let the user choose between "broad & fast" and "narrow & slow" presets.
- **GDPR / CCPA on stored posts.** Public posts are scrapeable but storing them indefinitely has data-residency implications; the schema must age out raw posts after 30 days and keep only the scored candidate summaries.
