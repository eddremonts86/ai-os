---
id: "304"
slug: need-a-ai-bot-for-analyzing-car-and-real-estate-prices
title: Need a AI-bot for analyzing car and real estate prices
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/lbdzym5un1-need-a-ai-bot-for-analyzing-car-and-real"
category: ai
date: "2025-11-13"
tags: [AI, Other]
country: Russia
tech: [Python, FastAPI, Postgres, Telegram Bot API, Avito API, CIAN API, Anthropic Claude API]
---
# Need a AI-bot for analyzing car and real estate prices

## Problem

A Russian user describes the missing tool directly: they want an AI bot that analyses prices in two of the highest-stakes consumer categories — cars and real estate. The pain is that both markets in Russia have wide asking-price variance, frequent refreshes of listings, and a mix of legacy scraping plus manual judgement that takes hours per decision. A bot that can ingest a listing (or a desired buy spec), pull comparable data, and produce a price verdict in a chat thread is the missing layer.

## Objective

Ship a Telegram bot that, given a car listing or an apartment/house listing, returns a comparable-set analysis and a price verdict (underpriced / fair / overpriced) with a confidence band, sourcing the comparables from public Russian marketplaces.

## Target Users

- Russian individual buyers researching a specific car or apartment purchase.
- Russian resellers and dealers who screen incoming leads against market ranges before responding.
- Independent real-estate agents who need a quick sanity check on a listing's price before showing it.

## MVP Scope

- Telegram bot interface: user pastes an Avito auto listing URL or a CIAN real-estate URL.
- Backend fetches the listing, normalises attributes (model year, mileage, area, rooms, floor).
- Comparables puller queries the same marketplaces for similar listings within a configurable radius.
- Verdict engine: median, p25, p75 of comparable prices, deviation of the target listing, one-line justification.
- Conversation history per chat so the user can compare two listings side by side.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/ai/lbdzym5un1-need-a-ai-bot-for-analyzing-car-and-rea` follows the constraints in `304-.../SPEC.md` and the chosen stack (Python, FastAPI, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- All marketplace queries must respect each platform's terms; if an official API is not available, scraping must use a polite rate limit and a clear user-agent.
- The verdict is an opinion, not a guarantee; the bot must surface the assumption set (number of comparables, time window, radius) every time.
- Must run inside Russia-region infrastructure to keep latency to Avito / CIAN reasonable.
