---
id: "3706"
slug: amc-stocks-hub-asset-manager-profiles-13f-holdings-and-
title: "AMC Stocks Hub – asset-manager profiles, 13F holdings, and co-holdings"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487177"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
country: United States
tech: [Astro, TypeScript, SQLite, SEC EDGAR ingestion]
---
# AMC Stocks Hub – asset-manager profiles, 13F holdings, and co-holdings

## Value Proposition

A readable surface over the SEC's quarterly Form 13F filings — so a curious investor can ask "what is everyone buying?" and get an answer in one click, without parsing EDGAR XML.

**One-liner:** 13F filings, turned into pages.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Retail investors tracking the smart money | They want a one-glance view of what asset managers hold, what was bought last quarter, and what was sold; a Bloomberg terminal is overkill and most free 13F tools are unusable. |
| Independent analysts and journalists | They need a starting point for flow stories: which manager owns what, who else owns it, and how the position changed quarter over quarter. |
| Public-market asset managers (BLK, KKR and equivalents) | They appear in the AMC directory with price and market cap; the directory is the read-only surface the operator chose to ship first. |

## Jobs To Be Done

1. **Functional job** — Answer "what does every asset manager with over $100M in US equities actually hold?" from a single, readable page.
2. **Emotional job** — Stop the read-EDGAR-by-hand loop when the question is "is everyone crowding into this name?"
3. **Social job** — Cite a clean link to back up a claim about asset-manager flows in a write-up, instead of pasting a link to a raw filing PDF.

## Success Metrics

- **Activation:** % of new visitors who land on a profile page (a manager, a ticker, a co-holdings view) and traverse to a second one.
- **Retention:** Quarterly return rate aligned to SEC filing windows — the data refresh is the natural re-engagement moment.
- **Revenue:** Not stated on the landing page; no pricing tier, no subscription, no ads are visible. The revenue shape is an open question.

## Pricing & Monetization

The landing page does not state pricing, plans, or a paid tier. The product's current shape is a free, read-only site. The post does not commit to a business model.

## Competitive Landscape

The 13F category has multiple incumbents: WhaleWisdom, 13F Info, Dataroma, Insider Monkey, MarketBeat, Hedgefollow. The product's stated differentiator on its own landing page is the co-holdings map ("AMC Co-Holdings: Which Stocks Are Held by Multiple Managers?") and the public-AMC directory spanning US, UK, EU, Hong Kong, Singapore, Japan, Australia, Canada with price and market cap. The product does not name competitors on the landing page.

## Risks & Open Questions

- **Data freshness is the trust signal.** The site is honest about "Data as of 2026-06-30 · Updated quarterly." A user who lands in the gap between filings sees stale numbers; the product has to make that visible on every page, not just in the footer.
- **EDGAR parser correctness.** 13F filings come in XML; a parsing bug propagates to every page. The MVP needs a fixture set of known filings and a regression test that asserts the parsed counters match the published totals.
- **Listed-AMC price feed.** The directory shows price and market cap for asset managers that are publicly listed. A stale price feed is worse than no price — the MVP needs to either pin a freshness timestamp on every price row or remove the column.
- **Revenue model unstated.** No pricing, no subscription, no ads. The product ships as a free site; the path to a business is a question the post leaves open.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49487177) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
