---
id: "758"
slug: two-years-searching-for-reliable-current-knowledge-ai-g
title: "Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of links. Need a personalized guide to trusted information."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/35l4crn5d1-two-years-searching-for-reliable-current"
  captured: "2026-03-12"
category: education
date: "2026-03-12"
tags: [Education, Productivity, Other]
country: Russia
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL with pgvector, RSS + arXiv + Semantic Scholar connectors]
---
# Two years searching for reliable, current knowledge. AI gives generic answers, search engines thousands of links. Need a personalized guide to trusted information.

## Tech Stack

- **Front-end:** Next.js (App Router) with a clean intake form and a path-view surface; mobile-first because the post's profile (a learner, not an enterprise buyer) implies phone use.
- **API + path generator:** Python with FastAPI; the path generator combines the source registry with the user's level and prior paths and emits a sequenced list.
- **Source registry:** PostgreSQL with pgvector for source embeddings (used for path synthesis); a separate editorial-source-of-truth database (still Postgres) that records credential category, recency, and provenance for every source.
- **Recency monitor:** RSS + arXiv + Semantic Scholar connectors polled on per-field cadences (slow fields weekly, fast fields daily); a diff job flags sources whose recency or provenance has changed since path generation.
- **Multilingual:** Russian and English source coverage from intake to citation; the user's locale drives source-language preference without blocking the other.
- **Billing:** Stripe with a free tier (one active path, full registry) and a paid tier (€9–15/month, unlimited paths, recency alerts, offline export).
- **Auth:** email-link signup; no social login required in v1, in line with the privacy-conscious audience.

## Architecture

```
Browser ─▶ Next.js (intake + path view + reading tracker)
                │
                ├──▶ /api/path/*  ──▶ path generator (Python)
                │                          │
                │                          ├─▶ source registry (pgvector)
                │                          ├─▶ level calibration
                │                          └─▶ LLM compose (with citations)
                │
                ├──▶ /api/sources/* ──▶ registry read API
                │
                └──▶ cron (weekly per field)
                        │
                        ├─▶ RSS / arXiv / Semantic Scholar connectors
                        │
                        └─▶ registry diff job
                                │
                                └─▶ re-rank flagged paths
```

The path generator is a thin layer on top of the registry: it picks the top-N sources for a goal+level and the LLM composes the prose between them. The registry is the asset; the path generator is the interface.

## Milestones

1. **M0 — Registry MVP.** Source registry schema, editorial import flow for 3 fields (programming, design, marketing), pgvector embeddings, registry read API. End of week 4.
2. **M1 — Path generator.** Goal + level intake, top-N retrieval, LLM composition with strict inline citations, 10-step path output. End of week 7.
3. **M2 — Recency monitor.** RSS + arXiv + Semantic Scholar connectors for 3 fields, weekly diff job, flagged-path notification in the dashboard. End of week 10.
4. **M3 — Multilingual coverage.** Russian-language sources added to the registry, language-aware ranking, locale-driven intake. End of week 13.
5. **M4 — Free + paid tier.** Stripe billing, free tier (one path, full registry), paid tier (unlimited paths, recency alerts, offline export). End of week 15.
6. **M5 — Reading tracker + path rebalance.** Mark-step-done, automatic rebalancing of remaining steps, weekly digest. End of week 18.
7. **M6 — Open beta.** 500 active learners, weekly retention read-outs, per-field recency audit published. End of week 24.

## Risks

- **Registry breadth vs. depth.** The product's value depends on quality across many fields. An editorial team that grows linearly with field count will not scale; a self-bootstrapping registry may converge on the same handful of well-known sources for every field. The seed strategy (which 3 fields to launch with, how to expand) is the highest-leverage product decision in v1.
- **Level calibration accuracy.** A single intake question is cheap but error-prone. The product needs an adaptive placement quiz for users who pick "intermediate" without a baseline, or the path will be too easy / too hard and the user churns.
- **Source provenance trust.** The post is explicit about the trust gap between expert opinion and advertising. Every registry entry must record credential category, recency, and provenance; the path UI must surface these, not bury them. A "why this source" inline citation is the audit-trail promise.
- **Recency false positives.** A daily poll of arXiv will surface noise on slow fields like philosophy, where the canonical sources have not changed in decades. The per-field cadence must be tuned, and the recency-alert threshold must be high enough that a "stale source" notification is meaningful.
- **Multilingual asymmetry.** Russian-language source coverage at the same quality bar as English is hard. A registry that is excellent in English but thin in Russian will read as half-built to the post's likely audience. The M3 milestone must publish the per-language coverage numbers, not just total count.
