---
id: "3745"
slug: ai-supermarket-discover-compare-and-choose-the-best-ai-
title: "AI Supermarket – Discover, compare, and choose the best AI tools for any task"
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/ai-supermarket?utm_campaign=startup-180855&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [TypeScript (Next.js for storefront and listings), Postgres + Drizzle ORM (tool catalogue), Algolia (search + facets), Stripe (featured-pick sponsorships), PostHog (visit + sign-up funnel analytics)]
---
# AI Supermarket – Discover, compare, and choose the best AI tools for any task

## Tech Stack

The stack is picked for the problem — a curated AI-tool directory with a strict consistent listing schema, two browse shapes, and a sign-up CTR funnel — not from a default.

- **Storefront + listings:** TypeScript on Next.js. Server-rendered for SEO and for the category pages; ISR (incremental static regeneration) handles the listing volume without a re-render on every request.
- **Tool catalogue:** Postgres + Drizzle ORM with a `tools` table that enforces the five-attribute schema in the schema definition; per-category `tags` are a join table.
- **Search + facets:** Algolia over the five-attribute index; the index shape mirrors the schema so search and the listing page can share filters.
- **Featured-pick sponsorships (later):** Stripe, behind a per-category slot model with a monthly billing term. Not in the MVP.
- **Funnel analytics:** PostHog with named events for `category_view`, `tool_detail_view`, `signup_cta_click` — the directory's value to vendors is proven by the CTR.

## Architecture

```
                      ┌──────────────────────────────────────┐
   reader lands on  ─▶│  Next.js storefront (ISR)           │
   the storefront      │  - home feed (featured picks)       │
                       │  - per-category browse view          │
                       │  - per-tool detailed overview        │
                       └──────────────────────────────────────┘
                                    │
                                    ▼
                      ┌──────────────────────────────────────┐
                      │  Postgres + Drizzle (tools, tags)    │
                      │  each row enforces the five-attribute │
                      │  schema (what, who, pricing, users,  │
                      │  rating)                             │
                      └──────────────────────────────────────┘
                                    │
                                    ▼
                      ┌──────────────────────────────────────┐
                      │  Algolia (search + facets)           │
                      │  index mirrors the schema; filters   │
                      │  align with storefront filter bar    │
                      └──────────────────────────────────────┘
                                    │
                                    ▼
                      ┌──────────────────────────────────────┐
                      │  PostHog (signup_cta_click, etc.)    │
                      └──────────────────────────────────────┘
```

The five-attribute schema is enforced at the database level (each row of `tools` requires all five fields populated), so the "consistent listing schema" promise cannot drift even if a curator tries to ship a partial entry.

## Milestones

1. **M0 — Schema + first 50 tools.** The Postgres schema is built; 50 tools across the five named categories are entered by the editor and are reachable through the home feed and the per-category browse view.
2. **M1 — Search + filter surface.** Algolia index over the schema; category-page filter bar (pricing tier, user-count band, rating) returns real-time facets.
3. **M2 — Ratings definition published.** A "How ratings are computed" page on the directory with a public definition. Vendors are flagged if their rating is recomputed at refresh.
4. **M3 — Funnel instrumentation + CTR dashboard.** PostHog events wired; vendor-facing CTR dashboard. The directory's value to a vendor is provable from day one before the first featured-pick sponsor is signed.

## Risks

- **Schema drift.** A curator who skips a field breaks the directory's value. Enforce the schema at the database level (NOT NULL on every attribute column) and in the editor form.
- **Rating integrity.** The capture names "ratings" without a definition. Without a public "How ratings are computed" page, the number is a black box. Define and publish before the first citation quotes the directory.
- **Curation bias.** A curator who favours paying vendors breaks the "curated, not crowdsourced" constraint. Document the editorial policy before the first featured-pick sponsor is signed.
- **Five-category launch.** If the directory succeeds in one category, the temptation to add a sixth is immediate and would dilute the schema. The launch wedge is five exactly.
- **CTR is the vendor metric.** Vendors care about sign-up CTR from a tool page. Without funnel instrumentation and a vendor-facing dashboard, the pitch to vendors is "trust us." Instrument before the first vendor meeting.
