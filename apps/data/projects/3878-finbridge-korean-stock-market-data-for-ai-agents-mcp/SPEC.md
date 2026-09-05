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

## Problem

This capture is a URL-only Show HN post (https://www.gronox.kr/) whose product claim is the title: FinBridge, Korean stock market data for AI agents, delivered as an MCP server. The linked site describes the underlying gap in one line — your agent reads EDGAR but it cannot read DART, and a model that knows NVIDIA guesses about SK Hynix. FinBridge answers that with Korean and U.S. markets in one schema: an MCP server for Claude exposing screening and technical tools (screen_minervini, get_technicals, dart_get_insider_trades among them) over KOSPI and KOSDAQ listings, with quotes, financials and filings kept free, no signup and no login, and a sample watchlist showing Korean and U.S. names with relative-strength signals and AI commentary. The capture itself contains no post body beyond the title and URL.

## Objective

Turn the URL-only capture into a complete plan: FinBridge as an MCP server that gives AI agents one schema for Korean and U.S. market data — KOSPI and KOSDAQ quotes, technicals, filings and insider-trade disclosures — so a model can answer questions about both markets in the same fields and units. The MVP is the existing no-signup offering: free quotes, financials and filings, a screener runnable without login, and an API key flow for Claude.

## Target Users

- Developers wiring stock-market data into AI agents who hit the DART gap: their models can read EDGAR but not Korean disclosures.
- Quantitative and trend-template investors screening KOSPI and KOSDAQ names with Minervini-style conditions alongside U.S. tickers.
- Anyone who wants Korean market data without building a scraper or paying before trying: quotes, financials and filings are free and signup-free.

## MVP Scope

- MCP server exposing screening and technical tools: screen_minervini, get_technicals, dart_get_insider_trades.
- Korean and U.S. markets in one schema: same fields and units on both sides.
- No-signup screener and watchlist with sample Korean and U.S. names.
- Free quotes, financials and filings; API key issued for Claude.

## Constraints

- The source capture is a URL plus title; all product specifics come from the linked site's own copy.
- Data correctness across two regulatory regimes (DART versus EDGAR) is the core promise and the core risk.
- Free tier (quotes, financials, filings) is stated by the source; pricing for anything beyond it is not.
- The MCP server must stay usable by off-the-shelf agent clients without custom integration.

## Design Direction

See `DESIGN.md` for this project's design tokens.
