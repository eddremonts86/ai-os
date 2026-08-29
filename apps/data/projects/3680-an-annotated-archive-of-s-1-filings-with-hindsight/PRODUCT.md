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

## Value Proposition

A reader who pulls a company's S-1 from EDGAR today sees the original pitch and risk factors; six months after the IPO, that same reader cannot easily check which warnings materialised. The archive closes that loop — each filing is paired with a hindsight layer that links every "could go wrong" clause to subsequent SEC filings, press coverage or observable events, so the reader lands on one page and sees the confession, the warnings, and the outcome together.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Self-directed retail investor | Wants the hindsight layer pre-attached to filings instead of manually chasing 10-Ks after every IPO. |
| Journalist / analyst / MBA | Needs cross-company searches (e.g. "every 2021 SPAC that warned about remote-work") rather than per-company deep-dives. |
| Founder drafting an S-1 | Wants a worked example of the risk-factor register and the disclosures that aged badly. |
| Long-tail reader (lawyer, academic) | Treats the archive as a primary-source citation tool with annotations linked back to SEC.gov. |

## Jobs To Be Done

1. **Functional job** — Find the S-1 for a specific company, read the risk factors, and see which of them later came true.
2. **Emotional job** — Replace the feeling of "I took the IPO pitch at face value" with "I have a record of what was said and what actually happened."
3. **Social job** — Be able to cite a single URL that captures the disclosure-plus-outcome story instead of linking to an EDGAR raw filing plus a Twitter thread.

## Success Metrics

- **Filing coverage:** the archive ingests every new S-1 (or S-1/A amendment) filed on EDGAR within 24 hours of the accession appearing in the public submissions feed.
- **Hindsight depth:** at least 60% of filings older than 12 months have a hindsight annotation for ≥ 1 risk factor.
- **Reader signal:** median reader scrolls past the headline risk factor block (proxy for the hindsight layer being the actual draw, not just the filing text).
- **Watchlist accuracy:** every "still private" issuer (e.g. OpenAI, Anthropic) is auto-promoted to a live page within 24 hours of their public S-1 appearing on EDGAR.
- **Disclaimer presence:** 100% of pages render the "Nothing here is investment advice" footer (legal coverage).

## Pricing & Monetization

The site as published is free and ad-free. If the author later monetises, plausible surfaces are:

- **Newsletter sponsorship** — a weekly digest of new filings plus notable hindsight additions, sold to one sponsor per issue.
- **Premium API** — paid tier for analysts who want the annotated dataset (risk text + outcome links + dates) as JSON or CSV rather than scraping HTML.
- The author has not stated a price on the source page, so no `wtp` field is set.

## Competitive Landscape

- **SEC EDGAR full-text search** — the primary source; the archive is downstream of it and explicitly links to it.
- **SEC-plus community sites (e.g. RavenPack, Sentieo)** — paid platforms aimed at buy-side analysts; the archive is a public-facing reading layer rather than a research terminal.
- **MacroMicro / Koyfin / similar free investing sites** — focus on price and fundamentals; the archive's editorial hindsight layer is not a feature they ship.
- **Wikipedia / individual blog posts** — each covers a single company; the archive's product is the consistent cross-company format and the watchlist for not-yet-public issuers.
- **AI-generated S-1 summaries** — bypass the original filing entirely; the archive refuses to do this because every annotation must hyperlink back to the original.

## Risks & Open Questions

- [ ] EDGAR rate limits and fair-access policy: the daily poll must respect the SEC's published limits or the source IP will be throttled; build a backoff and a single shared User-Agent.
- [ ] Annotation drift over time: the editorial hindsight layer requires someone to update each filing as new 10-K / 8-K filings land; without a documented editor workflow the layer goes stale within a quarter.
- [ ] Confidential draft filings are not public: the watchlist cannot reproduce the contents of a confidential draft S-1, so the page must say "no filing on record" until the issuer files the public version.
- [ ] Legal posture for "what came true" claims: a hindsight annotation that says "this risk materialised" can be disputed; every claim must link to a primary source (SEC filing or established outlet), and the "Nothing here is investment advice" disclaimer must remain on every page.
