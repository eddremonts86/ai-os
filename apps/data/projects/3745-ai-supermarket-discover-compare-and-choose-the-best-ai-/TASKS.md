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

## Phase 0: Scaffold

- [ ] Define the Postgres schema: `tools` (id, name, slug, category, what_it_does, best_for, pricing, user_count, rating, signup_url, created_at, updated_at) with NOT NULL on the five attributes; `tags` as a join table for category facetting.
- [ ] Stand up Next.js with ISR (incremental static regeneration) for the storefront and per-category browse view, and a server-rendered detail route for each tool.
- [ ] Build the editor surface (a simple admin UI) where the curator adds a tool, fills the five attributes, sets the rating, and tags the category. Form rejects any tool with a missing attribute.
- [ ] Provision Postgres + Drizzle ORM and connect Algolia; index the `tools` table in a shape that mirrors the five-attribute schema.
- [ ] Wire PostHog with the named events (`category_view`, `tool_detail_view`, `signup_cta_click`).
- [ ] Document the editorial policy on a public /about page: who adds a tool, who reviews it, how sponsorships do not buy ratings.

## Phase 1: Core

- [ ] Build the home feed: a "featured picks" row per category, ranked by editor pick, with the same card layout across categories so the five-attribute schema reads consistently.
- [ ] Build the per-category browse view: a paginated grid of tool cards with the same five-attribute surface, filterable by pricing tier, user-count band, and rating.
- [ ] Build the per-tool detailed overview page: long-form what-it-does copy, who-it's-best-for paragraph, pricing tier summary, user-count cell, rating display, and a single sign-up CTA as the page's primary action.
- [ ] Build the search and filter surface (Algolia-backed) so the buyer can drill down from the storefront by attribute combinations.
- [ ] Add a regression test asserting every `tools` row satisfies the schema on insert (NOT NULL on all five attributes).

## Phase 2: Deploy

- [ ] Publish the "How ratings are computed" page on the directory with a public definition and a refresh cadence.
- [ ] Run a public beta with a hand-picked set of curated tools across the five named categories; measure decision-time, attribute completeness, and CTR against the success metrics.
- [ ] Build the vendor-facing CTR dashboard (PostHog) and validate it with one or two friendly vendors before the first featured-pick sponsor pitch.
- [ ] Verify the ISR cache strategy under realistic visitor counts; the listing volume is small at launch but the cache strategy determines whether the dashboard claims under stress.
- [ ] Create the GitHub repo, deploy Next.js to Coolify, and verify the production deployment end-to-end.

---

_Enriched 2026-08-29 from BetaList capture._
