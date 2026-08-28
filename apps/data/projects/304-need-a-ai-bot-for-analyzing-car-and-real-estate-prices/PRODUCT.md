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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Russian buyer, reseller, or agent can paste a car or apartment listing URL into a Telegram chat and get a same-language verdict (underpriced / fair / overpriced) backed by a small comparable set, in under a minute.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Russian individual buyer | Wants a sanity check on a single high-stakes purchase. |
| Russian reseller / dealer | Screens leads against market range before responding; needs a fast verdict. |
| Independent real-estate agent | Needs a quick second opinion on a listing's price before a showing. |

## Jobs To Be Done

1. **Functional job** — Get a price verdict on a specific listing without building a spreadsheet of comparables.
2. **Emotional job** — Avoid the gut-feeling anxiety of "am I overpaying?".
3. **Social job** — Be able to share the verdict link in a chat with a partner before committing.

## Success Metrics

- **Verdict latency:** median ≤ 60 seconds from URL to verdict.
- **Comparable coverage:** ≥ 5 comparables returned in ≥ 80% of Moscow / SPb metro queries.
- **User trust:** ≥ 60% of repeat users act on the verdict (visit, bid, or message the seller) within 7 days.
- **Stability:** the bot stays online ≥ 99% of weekly hours in pilot.

## Pricing & Monetization

Free tier: 20 verdicts per month. Paid tier: unlimited verdicts + multi-listing comparison (RUB/month). No commission on transactions.

## Competitive Landscape

- **Avito / CIAN built-in analytics** — limited to the platform's own listings, no cross-market view.
- **Manual spreadsheets + Auto.ru / DomClick** — accurate but slow; a 30-listing comp set takes an afternoon.
- **Generic LLM chat** — gives plausible answers with no grounding in actual comparable listings.

## Risks & Open Questions

- [ ] Confirm Avito's official API access before launch; if denied, run a polite scraper behind a server with rate limits and an explicit disclaimer.
- [ ] Define the comparable-set heuristic (year band, mileage band, area band) so verdicts are reproducible across runs.
- [ ] Decide how to surface model-year and trim-level nuance without forcing the user to fill a 10-field form.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/ai/lbdzym5un1-need-a-ai-bot-for-analyzing-car-and-real) · **Category:** ai · **Tags:** AI,Other
