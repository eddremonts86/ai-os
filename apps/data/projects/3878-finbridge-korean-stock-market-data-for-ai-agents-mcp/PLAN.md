---
id: "3878"
slug: "finbridge-korean-stock-market-data-for-ai-agents-mcp"
title: "FinBridge – Korean stock market data for AI agents (MCP)"
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

## Tech Stack

- **MCP server:** the interface agents use, exposing screening and technical tools by name.
- **DART filing access:** Korean corporate disclosures ingested into the unified schema.
- **KRX quote feed:** KOSPI and KOSDAQ market data behind quotes and technicals.
- **Unified KR/US schema:** one field and unit mapping across Korean and U.S. markets.
- **Technical screening engine:** Minervini-style conditions such as RS and trend-template checks.
- **Watchlist streaming:** sample watchlists with relative-strength signals and AI commentary.

## Architecture

- **Ingestion layer:** feeds from KRX and DART on the Korean side and U.S. market data on the other, normalized into one schema.
- **Tool layer:** named MCP tools (screen_minervini, get_technicals, dart_get_insider_trades) map agent intents to queries.
- **Serving layer:** no-signup screener, watchlist and free quotes, with an API key flow for agent clients.
- **Commentary layer:** AI-generated reads on watchlist names, such as VCP and trend-template status per ticker.

## Milestones

1. **M0 — Unified schema.** Korean and U.S. quotes, financials and filings live in one field and unit mapping.

2. **M1 — MCP tools.** screen_minervini, get_technicals and dart_get_insider_trades are callable by an agent.

3. **M2 — No-signup surface.** Screener and watchlist run without login; API key flow for Claude works.

4. **M3 — Data quality loop.** Sample watchlists and AI commentary verified against source filings on both markets.

## Risks

- **Schema drift:** keeping Korean and U.S. fields truly identical in unit and meaning is ongoing work, not a one-time mapping.
- **Upstream licensing:** KRX and DART data reuse terms are not addressed anywhere in the capture.
- **Free-tier cost:** serving quotes, financials and filings free has infrastructure costs with no stated funding.
- **Thin capture:** the plan is built from a title, a URL and the product site; hidden constraints may exist.
