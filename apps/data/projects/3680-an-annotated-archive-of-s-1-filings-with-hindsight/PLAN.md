---
id: "3680"
slug: an-annotated-archive-of-s-1-filings-with-hindsight
title: "An annotated archive of S-1 filings, with hindsight"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485902"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Astro (static site generator), SQLite via Drizzle ORM, Node.js ingestion scripts, Cloudflare Pages]
---
# An annotated archive of S-1 filings, with hindsight

## Tech Stack

- **Static site:** Astro 4 with content collections for filing pages and watchlist pages; output deployed to Cloudflare Pages for global low-latency reads.
- **Source of truth:** a single SQLite file managed via Drizzle ORM. Three tables: `companies` (CIK, name, status), `filings` (accession, filing_date, raw_url, content_html), and `annotations` (per-risk-factor rows with `risk_text`, `disclosed_on`, and a JSON array of `outcome_links`).
- **Ingestion:** a Node.js script that runs on a daily cron (Cloudflare Worker cron trigger) and polls the SEC EDGAR submissions API for newly filed S-1 accessions. Respects the SEC fair-access policy (single descriptive User-Agent, ≤ 10 requests/sec, exponential backoff on 429).
- **Annotation editor:** a password-protected admin route at `/admin` that lets the editor paste a risk-factor block, choose an outcome link per row, and save. Editor output is committed to the SQLite file; the next build picks it up.
- **Watchlist:** a `watchlist` table with `issuer_name`, `confidential_filing_date`, `expected_filing_window`, `status` (still-private | live). The ingestion script flips the status when a matching CIK accession appears.

## Architecture

The site is a static build over a single SQLite database. Each day, the ingestion worker pulls new S-1 accessions from EDGAR, downloads the HTML, extracts the risk-factor section, and writes rows. The annotation editor updates the same SQLite. A scheduled Cloudflare Pages build then re-renders every page. The reader sees HTML served from the CDN; the only dynamic surface is the admin route.

```
SEC EDGAR ──daily poll──▶ Worker (ingest.mjs)
                                │
                                ├─▶ parse S-1 ──▶ SQLite (filings, risk_factors)
                                │
                                └─▶ match watchlist CIKs ──▶ flip status
                                                            │
EDGAR ──outcome updates────▶ editor (admin route) ──▶ SQLite (annotations)
                                                            │
                                                            ▼
                                                Cloudflare Pages build
                                                            │
                                                            ▼
                                                  CDN: HTML per filing
```

## Milestones

1. **M0 — Spec freeze + data model.** SPEC.md approved, `companies` / `filings` / `annotations` / `watchlist` tables defined in Drizzle. End of week 1.
2. **M1 — Ingestion worker.** Daily EDGAR poll, S-1 HTML download, risk-factor extraction into `filings` + a normalised `risk_factors` table, idempotent on accession. End of week 3.
3. **M2 — Static site.** Astro project, one page per filing, risk-factor block rendered, link-out to SEC.gov. End of week 5.
4. **M3 — Watchlist.** Manual list of watched issuers (OpenAI trio, Anthropic duo as published today); ingestion flips a row to live on accession. End of week 6.
5. **M4 — Hindsight editor.** Password-protected admin route, write annotations, JSON array of outcome links per risk factor. End of week 8.
6. **M5 — RSS + footer disclaimer.** Public RSS feed for new filings; "Nothing here is investment advice" footer on every page. End of week 9.
7. **M6 — Pilot cohort.** 50 filings retroactively backfilled with hindsight annotations; reader metrics (scroll depth, RSS subscriber count) reviewed at week 13.

## Risks

- **SEC rate limits.** EDGAR's published fair-access policy caps unauthenticated traffic at 10 req/s and requires a descriptive User-Agent. The ingestion worker must queue requests, retry on 429 with exponential backoff, and never run more than one poll at a time, or the build pipeline will be throttled for hours.
- **Annotation drift.** The hindsight layer ages: a risk factor that "has not materialised" today may materialise next quarter. The editor workflow needs a quarterly re-review schedule or the "still waiting" annotations will silently go stale.
- **Confidential drafts.** OpenAI's confidential May 22, 2026 draft and Anthropic's June 1, 2026 confidential draft are not on EDGAR yet. The watchlist page must say "no filing on record" rather than paraphrase or speculate; the moment the issuer files the public prospectus the watchlist must be flipped automatically, with no manual touch.
- **Legal posture.** A hindsight annotation that says "this risk materialised" can be disputed. Every claim links to a primary source (SEC filing or established outlet), the disclaimer is on every page, and no price targets, projections or buy/sell language may appear anywhere on the site.
- **Source-of-truth drift between editor and build.** If the editor writes to a different SQLite than the build reads, annotations silently disappear. The build must read from the same SQLite path the worker and editor write to, with no copies.
