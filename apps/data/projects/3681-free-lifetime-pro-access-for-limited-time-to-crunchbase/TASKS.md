---
id: "3681"
slug: free-lifetime-pro-access-for-limited-time-to-crunchbase
title: Free lifetime pro access for limited time to crunchbase alternative
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485867"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Next.js, Postgres with pgvector, Python ingestion workers, Meilisearch, Cloudflare R2, Stripe]
---
# Free lifetime pro access for limited time to crunchbase alternative

## Phase 0: Scaffold

- [x] Capture the Show HN post and the giveaway announcement page
- [ ] Freeze the sector taxonomy and the profile field set
- [ ] Postgres schema where a published fact cannot exist without a source row
- [ ] Next.js app shell with static profile and sector routes
- [ ] Write DESIGN.md (profile page, sector index, gated-field treatment)
- [ ] Provision R2 bucket for logos and profile assets

## Phase 1: Core

- [ ] Source adapter one: extract company, sector and description into staging with source URL and retrieval date
- [ ] Source adapter two: funding rounds into staging, same provenance contract
- [ ] Promotion step: conflict resolution between candidate facts, accepted fact written, losers retained for audit
- [ ] Profile page rendering funding, team, competitors and metrics, each with its source visible
- [ ] Similar-company lookup via pgvector to draft the competitor set
- [ ] Sector index pages across the full advertised taxonomy
- [ ] Meilisearch index over company names with sector filters
- [ ] Entitlement model: free / Stripe-Pro / lifetime-Pro, with gated fields resolved through it
- [ ] Capped lifetime-grant issuance and redemption, grandfathering flag set at grant time
- [ ] Suggest-an-edit: contribution lands in the same staging table as machine candidates, contributor as source
- [ ] Review queue with contributor attribution on accepted edits
- [ ] Profile-depth report: share of companies meeting the funding + competitor + team floor per sector
- [ ] Human review gate on funding facts before promotion

## Phase 2: Deploy

- [ ] Run the limited-time campaign against the grant cap
- [ ] Open Stripe Pro at a post-campaign price
- [ ] Monitor month-two and month-three return rate of granted accounts
- [ ] Verify in production
