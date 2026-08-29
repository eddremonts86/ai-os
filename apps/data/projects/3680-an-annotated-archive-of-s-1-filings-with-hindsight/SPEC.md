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

## Problem

S-1 prospectuses filed on EDGAR are public domain but raw: hundreds of pages per filing, no consistent cross-company structure, and no mechanism for showing which of the risk factors or forward statements actually came true afterwards. The Show HN submission at s-1.space frames this as a "confession" problem — every IPO must tell shareholders, in writing and under oath, what could go wrong; the document is then rarely revisited in the light of what actually happened. The author publishes a curated subset already: real public filings with editorial hindsight annotations (e.g. a "Still private" page tracks OpenAI's May 22, 2026 confidential draft S-1 and Anthropic's June 1, 2026 confidential draft S-1 at a reported $965B Series H valuation, with a note that the page "activates the day one appears" on EDGAR). The product gap is operational: keeping pages current as new filings land, scaling annotation depth without hand-writing every entry, and giving readers a way to compare promised risks against realised outcomes across many companies at once.

## Objective

Ship a public, SEO-friendly static archive of S-1 filings where each filing has (a) the full risk factor text, (b) a hindsight layer that maps the original disclosures to subsequent SEC filings (10-K, 8-K, proxy), press coverage, and verifiable public events, and (c) a "still private" queue that watches EDGAR for expected issuers and auto-publishes a company page on the day the filing hits EDGAR. The reader should be able to land on the archive, find a company, and within a page see the original pitch, the warnings, and — for issuers whose post-IPO history has unfolded — which warnings materialised. Editorial standards explicitly disclaim investment advice.

## Target Users

- **Primary:** retail investors and self-directed readers who already pull filings from EDGAR and want the hindsight layer pre-attached, so they can compare what a company said it would do against what it actually did after going public.
- **Secondary:** journalists, analysts and MBAs researching IPO disclosures in bulk — they need cross-company views (e.g. "how many 2021 SPAC filings cited remote-work tailwinds that did not materialise") rather than a single company deep-dive.
- **Tertiary:** founders and operators drafting their own S-1, who want a working example of the disclosure register to crib from.

## MVP Scope

- A static site with one page per filing, plus one "still private" page per watched issuer. Both are generated at build time from a local SQLite source-of-truth.
- Ingestion: a Node.js script polls SEC EDGAR's submissions API on a daily cron, parses the filing index, fetches the S-1 HTML and risk-factor section, and inserts a row into SQLite (company, CIK, filing date, accession number, URL to the filing on SEC.gov).
- Hindsight annotation layer: for each filing, structured fields per risk factor (the verbatim risk text, the date it was disclosed, and a list of "what happened" links to later 10-K / 8-K filings or coverage, written by the editor and stored alongside the filing). MVP supports manual annotation; the author already does this on s-1.space.
- "Still private" watchlist: a curated list of expected issuers (OpenAI, OpenAI Global, OpenAI Holdings; Anthropic, Anthropic PBC per the source) with their confidential filing date and expected prospectus date; the EDGAR poll checks for a new public S-1 accession and, when one is detected, swaps the "still private" page for the live archive page automatically.
- Per-claim link: every annotation that says "X happened" must hyperlink to a primary source (SEC filing, company press release, or established news outlet). The disclaimer "Nothing here is investment advice" appears in the footer and on each filing page.
- Public RSS feed of new filings added, so subscribers can follow the archive without visiting.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Filings themselves are public domain sourced from SEC EDGAR; the editorial hindsight layer is the only original content and must not be copyrighted by an upstream provider.
- The site must clearly disclose that "Nothing here is investment advice" — the author already does this in the source and the disclaimer is load-bearing for legal posture.
- No real-time quotes, no current price tickers, no projections. The archive is about filed disclosure, not market data.
- The build pipeline must not mass-download EDGAR faster than the published SEC fair-access limits (10 requests/sec with a descriptive User-Agent) or the next IP will be rate-limited.
- "Still private" pages must explicitly say no public prospectus exists yet, and must not republish the contents of confidential draft filings (which are not public until the issuer files them).
