---
id: "303"
slug: there-is-no-effective-tool-for-researching-high-margin-
title: There is no effective tool for researching high-margin and small e-commerce products
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ecommerce/uwa5w0mc31-there-is-no-effective-tool-for-researc"
category: ecommerce
date: "2025-11-13"
tags: [Ecommerce, Research, Other]
country: Australia
tech: [Next.js, TypeScript, Postgres, Playwright scraper, Keepa API, OpenAI, Hetzner]
---
# There is no effective tool for researching high-margin and small e-commerce products

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (shortlist table, margin card, refresh badge)
- [ ] Provision Hetzner VPS + Postgres + Coolify reverse proxy
- [ ] Wire Keepa API key + eBay AU Finding API credentials
- [ ] Pick auth model for operators (email magic link via Resend)

## Phase 1: Core

- [ ] Operator signup + workspace (one workspace per operator, multi-store notes)
- [ ] Category seed input: free-text niche, marketplace picker, "small product" filter (size/weight cap)
- [ ] Scraper worker: Playwright + per-domain robots.txt cache + rate limiter
- [ ] Snapshot store: raw listing data, observed price, seller count, review velocity
- [ ] Scoring job: estimated wholesale cost (operator-editable), retail band, competition count, gross margin %, freshness
- [ ] Shortlist view: sortable table, one-click CSV export
- [ ] Refresh schedule: cron every 24h per active shortlist; manual refresh button
- [ ] Audit log: which shortlists were exported and when
- [ ] End-to-end test: seed "kitchen gadgets under $30" → 50 scraped SKUs → 10-row shortlist → CSV

## Phase 2: Deploy

- [ ] Move to live Keepa + eBay API quotas
- [ ] Recruit 20 AU operators for a private beta
- [ ] Coolify-side deployment of the dashboard backend
- [ ] Status page + scraper health monitoring
- [ ] Post-mortem after week 10 with the private beta cohort
