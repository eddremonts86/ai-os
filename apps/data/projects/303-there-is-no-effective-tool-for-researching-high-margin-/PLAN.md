---
id: "303"
slug: there-is-no-effective-tool-for-researching-high-margin-
title: There is no effective tool for researching high-margin and small e-commerce products
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ecommerce/uwa5w0mc31-there-is-no-effective-tool-for-researc"
category: ecommerce
date: "2025-11-13"
tags: [Ecommerce, Research, Other]
country: Australia
tech: [Next.js, TypeScript, Postgres, Playwright scraper, Keepa API, OpenAI, Hetzner]
---
# There is no effective tool for researching high-margin and small e-commerce products

## Tech Stack

- **Web app:** Next.js 14 (App Router), TypeScript, deployed on Hetzner behind a Coolify reverse proxy.
- **Database:** Postgres on Hetzner for category seeds, scraped snapshots, scoring runs, shortlists, refresh jobs.
- **Scraper:** Playwright in a Node worker, rate-limited per marketplace, with a per-domain robots.txt cache.
- **Marketplace data:** Keepa API for Amazon ASIN history (where AU coverage is sufficient); eBay AU via the official Finding API.
- **Scoring + categorisation:** small OpenAI calls to extract structured attributes from raw listing copy.
- **Exports:** CSV export via a server action; PDF export is not in scope for v1.

## Architecture

A Next.js app serves the operator dashboard (authed RSC) and the export endpoints. A separate scraper worker pulls listings on a schedule (or on demand) and writes raw snapshots into Postgres. A scoring job reads the snapshots, computes per-product margin and competition signals, and writes a shortlist. Refresh jobs are scheduled by a simple cron worker; shortlists carry a freshness timestamp and a re-run button.

```
Browser ─▶ Next.js dashboard
              │
              ├─▶ Cron worker ──▶ Scraper (Playwright) ──▶ Postgres snapshots
              │                                              │
              └─▶ Scoring job ───────────────────────────────┘
                                                              ▼
                                                     Shortlist + CSV export
```

## Milestones

1. **M0 — Spec freeze + scraper sandbox.** One category, one marketplace, end-to-end run on a dev box. End of week 1.
2. **M1 — Scoring + shortlist UI.** Margin %, competition count, freshness stamp on the dashboard. End of week 3.
3. **M2 — Multi-marketplace support.** Amazon AU + eBay AU + one niche marketplace chosen per category. End of week 5.
4. **M3 — Refresh + CSV export.** Cron-driven refresh, one-click export, audit log. End of week 7.
5. **M4 — Private beta with 20 AU operators.** End of week 10.

## Risks

- **Scraper breakage** — any marketplace can change its DOM and break the worker; mitigation is per-domain Playwright selectors behind a versioned adapter, with a canary scrape that fails fast.
- **Margin assumption drift** — if the assumed wholesale source is stale, the margin math lies; mitigation is a required "wholesale source" field on the shortlist and an explicit "I verified this" checkbox before export.
- **AU marketplace data sparsity** — Amazon AU has fewer SKUs than US; some shortlists will be thin. Mitigation is honest "we found N candidates" messaging, not padding the list with US-only results.
