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

## Phase 0: Scaffold

- [x] Read the capture: URL-only Show HN post; retrieved product specifics from the linked gronox.kr site
- [x] Write SPEC.md (this document)
- [x] Write PRODUCT.md: value proposition, stakeholder table, JTBD, metrics, pricing and risks
- [x] Write PLAN.md: tech stack, architecture, M0-M3 milestones and risks

## Phase 1: Core

- [ ] Verify schema parity: Korean and U.S. fields, units and meanings mapped one-to-one
- [ ] Exercise the MCP tools: screen_minervini, get_technicals and dart_get_insider_trades against live listings
- [ ] Validate the no-signup screener and watchlist flow
- [ ] Test the API key issuance path for Claude

## Phase 2: Deploy

- [ ] Confirm data licensing for KRX and DART sources
- [ ] Publish coverage and latency documentation for agent builders
- [ ] Define what sits behind the API key and whether it is priced

---

_Generated automatically by Lúa on 2026-08-30_
