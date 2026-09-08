---
id: "3878"
slug: finbridge-korean-stock-market-data-for-ai-agents-mcp
title: FinBridge – Korean stock market data for AI agents (MCP)
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499026"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [MCP server, DART filing access, KRX quote feed, Unified KR/US schema, Technical screening engine, Watchlist streaming]
---
# FinBridge – Korean stock market data for AI agents (MCP)

## Value Proposition

One MCP server that closes the DART gap for AI agents: Korean and U.S. market data in a single schema, so a model that reads EDGAR can also read Korean filings and answer questions about both markets in the same fields and units. Screening and technical tools — including Minervini trend-template screening and insider-trade lookups — run over KOSPI and KOSDAQ listings, with quotes, financials and filings free and no signup required.

**One-liner:** Korean and U.S. stock market data in one schema, exposed to AI agents as an MCP server with free quotes, financials and filings.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Agent builders in finance | Their models read EDGAR but guess about Korean names; FinBridge supplies the DART side in matching fields and units. |
| KOSPI and KOSDAQ screeners | Run Minervini-style technical conditions and insider-trade lookups on Korean listings next to U.S. tickers. |
| Cost-conscious data users | Quotes, financials and filings are free with no signup or login before an API key is needed. |

The capture is thin; this table reflects the site's stated audiences rather than a published market study.

## Jobs To Be Done

1. **Functional job** — Let an AI agent screen every Korean listing for conditions like names above RS 90 passing the trend template.

2. **Functional job** — Read filings and financials on both sides of the Pacific with the same fields and units.

3. **Functional job** — Pull Korean insider-trade disclosures into agent workflows alongside U.S. data.

4. **Emotional job** — Replace guessing about SK Hynix with actually reading its filings.

## Success Metrics

- **Schema parity:** every Korean field maps to the same units and meaning as its U.S. counterpart (the stated design).
- **Screener reach:** an agent can screen every KOSPI and KOSDAQ listing in one query.
- **Frictionless entry:** quotes, financials and filings usable without signup or login.
- **Agent compatibility:** the MCP server works with Claude out of the box via an issued API key.

## Pricing & Monetization

The site states quotes, financials and filings stay free with no signup and no login. No price is stated for anything beyond that, though a Get an API key flow for Claude implies gated access exists.

## Competitive Landscape

The post names no competitors. The category is market-data APIs for AI agents — financial data platforms, exchange data vendors and MCP market-data servers. The stated differentiator is coverage, not just access: Korean and U.S. markets in one schema, with DART-derived filings and Korean technical screening that U.S.-only data feeds cannot provide.

## Risks & Open Questions

- [ ] The capture is a URL plus title; every product detail rests on the linked site, which can change without the capture updating.
- [ ] Dual-regime data quality: DART and EDGAR semantics differ; same fields, same units is easy to promise and hard to verify.
- [ ] Free quotes, financials and filings create a cost base with no stated revenue model for the free tier.
- [ ] MCP discovery and distribution are unstated; the post itself contains no adoption evidence.
