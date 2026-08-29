---
id: "738"
slug: startups-lose-knowledge-as-they-grow-manual-documentati
title: "Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval. Willing to pay from $25/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/oizu9ll251-startups-lose-knowledge-as-they-grow-man"
  captured: "2026-05-25"
category: productivity
date: "2026-05-25"
tags: [Productivity, Startups, Business, AI, Other]
country: Argentina
wtp:
  raw: from $25/month (tiered by users)
  currency: USD
  min: 25
  max: 25
  period: month
  mrrMid: 25
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL with pgvector, Slack + Linear + Notion connectors]
---
# Startups lose knowledge as they grow. Manual documentation doesn't work. Need a smart tool for automatic knowledge capture and retrieval.

## Tech Stack

- **Front-end:** Next.js (App Router) with the retrieval chat and the operations dashboard behind the same auth gate.
- **API + capture worker:** Python with FastAPI for the connector layer (Slack / Linear / Notion OAuth flows, webhook receivers, backfill jobs) and the embedding pipeline.
- **Persistence:** PostgreSQL with the pgvector extension for the artifact store and embeddings; Redis for the capture-job queue and rate-limit state.
- **Connectors:** Slack (Socket Mode + Events API for real-time and historical backfill via `conversations.history`); Linear (GraphQL); Notion (REST API + database query).
- **Retrieval:** a small re-ranker (cross-encoder) on top of pgvector cosine similarity to pick the best chunk per question; LLM used only for the final answer composition, with strict citation discipline.
- **Billing:** Stripe Checkout with seat-aware tier switches and a per-seat upgrade path.
- **Auth:** passwordless via Slack OAuth (the workspace identity is already there) so signup and source-connection happen in the same flow.

## Architecture

```
Browser ─▶ Next.js (chat + dashboard)
                │
                ├──▶ /api/chat/*  ──▶ retrieval worker (Python)
                │                          │
                │                          ├─▶ pgvector top-k
                │                          ├─▶ cross-encoder re-rank
                │                          └─▶ LLM compose (with citations)
                │
                ├──▶ /api/connectors/* ──▶ Slack / Linear / Notion
                │                          │
                │                          ▼
                │                     OAuth + backfill jobs
                │
                └──▶ cron + webhook ──▶ capture worker
                                           │
                                           ├─▶ chunk + embed
                                           ├─▶ pgvector upsert
                                           └─▶ dedupe + link
```

The capture worker is the heart of the system. It must run cheaply on a constant stream of new Slack messages and Linear updates without re-embedding unchanged content. The re-ranker is the trust mechanism — without it, pgvector returns plausible-looking chunks that are wrong on close calls, and a wrong answer in week one loses the user.

## Milestones

1. **M0 — Slack-only MVP.** Slack OAuth, backfill last 90 days, pgvector store, chat-shaped retrieval with citations. End of week 4.
2. **M1 — Notion + Linear connectors.** Same capture and retrieval path; Linear closed-issue resolution comments and Notion page text flow into the same store. End of week 8.
3. **M2 — Knowledge-gap report.** Weekly digest of questions the system could not answer confidently, surfaced in the dashboard and emailed to the workspace owner. End of week 10.
4. **M3 — Tiered billing.** Starter $25, Growth $79, Scale $199, seat upgrade path, Stripe webhooks driving the seat count. End of week 12.
5. **M4 — PII redaction defaults.** Channel-level and page-level exclusion controls, audit log of capture decisions, configurable retention windows. End of week 14.
6. **M5 — New-hire onboarding flow.** A guided first-week flow that surfaces the most-asked questions, surfaces the operator's own answers, and tracks which questions the new hire could self-serve. End of week 16.
7. **M6 — Pilot cohort.** 20 startups across the three tiers, weekly NPS, weekly knowledge-gap review. End of week 22.

## Risks

- **Retrieval quality on day one.** A wrong answer in the first session destroys trust and the user never returns. The MVP must ship with conservative retrieval thresholds (prefer "I don't know" over a plausible-but-wrong answer) and a fast feedback loop so the operator can mark wrong answers and the system can re-embed.
- **Connector maintenance burden.** Slack, Linear, and Notion all ship API breaking changes with some regularity. The connector abstraction must be rich enough that a rewrite of one connector does not require a product rewrite, and that the engineering team can absorb breaking changes within a sprint.
- **$25/month unit economics.** At $25/month for 5 seats, the contribution margin has to absorb connector maintenance, embedding recompute on changed artifacts, and retrieval cost. A naive architecture (re-embed every Slack message on every change) will not close at this price. The capture worker must be designed for incremental update from day one.
- **Workspace-owner permissioning.** A startup founder is the natural buyer but they are rarely the only one who can invite a Notion page or a Slack channel to the system. Permissioning must be workspace-scoped, never global, and the operator must be able to exclude sensitive channels (compensation, performance) without losing the rest of the capture.
- **Citation trust.** If a citation is broken (the source artifact has been deleted) or stale (the source has changed since embed), the user loses trust. Citations must be checked at render time and the system must explicitly note when a cited source is no longer accessible.
