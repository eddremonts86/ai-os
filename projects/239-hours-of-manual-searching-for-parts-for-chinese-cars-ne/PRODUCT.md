---
id: "239"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [AI, Other]
country: Russia
tech: [Python, FastAPI, OpenAI CLIP + GPT-4o, Elasticsearch, Next.js 14, Telegram Bot API, PostgreSQL]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Reduces a multi-hour forum-and-Avito search to a single photo or text message, with results that name the part and the supplier.

## Target Users

Russian owners of Chinese cars; independent parts shops; small auto service stations.

## Jobs To Be Done

When a part breaks, I want to take a photo of it (or describe it) and get a list of suppliers with prices so I can choose without spending an evening on forums. When I run a parts shop, I want a fast visual lookup tool so my staff can answer customers in seconds.

## Success Metrics

Time from query to ranked results under 30 seconds. Match-accuracy on a labelled eval set (target: 80% top-3 accuracy). Monthly active Telegram bot users. Repeat-use rate at 30 days.

## Pricing & Monetization

Pricing & Monetization is intentionally left as TODO in this plan because the source post at `https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts` did not name a price, a billing model, or a comparable benchmark. Forcing a price here would invent a claim the poster never made. The pricing decision lives in a separate product memo once the MVP is shipped and a real user from Russia has validated the value of the task it removes.

## Competitive Landscape

Exist.ru, Emex.ru, and Autodoc are catalogue-driven but require exact OEM numbers. Avito is manual. Russian Telegram bots exist but are mostly scam-prone resellers. No source-named AI competitor.

## Risks & Open Questions

CLIP fine-tuning on Chinese-car-part imagery requires a labelled dataset that does not publicly exist. Russian supplier feeds are unreliable and need ongoing scraping. Need to validate with 10 service-station owners before claiming accuracy numbers.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for) · **Category:** retail · **Tags:** Retail,AI,Other
