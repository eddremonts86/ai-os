---
id: "781"
slug: hours-of-manual-searching-for-parts-for-chinese-cars-ne
title: Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a035m95nv1-hours-of-manual-searching-for-parts-for"
category: retail
date: "2026-01-21"
tags: [Retail, AI, Business, Other]
country: Russia
tech: [Python, FastAPI, CLIP, OpenCLIP, Qdrant, PostgreSQL, Redis, Telegram Bot API, Next.js, Tailwind CSS, Docker]
---
# Hours of manual searching for parts for Chinese cars. Need an AI agent that understands queries from photos or text and finds the part.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An AI parts-search agent that takes either a photo of an automotive part or a free-text description and returns a short, ranked list of candidate parts for Chinese-brand cars, with the part number and fitment metadata the user needs to actually order it. The agent works in the same vector space for text and images, so the user can switch between the two without re-entering context.

The product is not a parts catalogue the user has to learn; it is a search box that accepts whatever the user has and narrows the field. The Telegram-first surface matches the audience the post implies: a mechanic at the bench with a phone, not a buyer at a desk with a laptop. The web surface is for the people who keep the catalogue honest — the suppliers and the curators who add new parts as models arrive.

The value compounds with catalogue depth. The first time the agent sees a model, it is a guess; the hundredth time, it is a confident answer. The feedback loop turns the user's accept / reject into a small ranking improvement, so the agent gets sharper on the cars its real users actually service.

**One-liner:** PartFinder turns a phone photo or a one-line description of an automotive part into a ranked list of candidates with part numbers and fitment, so the mechanic stops searching by hand.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Independent mechanic / small workshop | Services Chinese-brand cars and currently relies on phone calls and hand-searched catalogues. |
| Car owner doing basic repairs | Wants to identify a part before ordering, without driving to a shop to ask. |
| Parts supplier / aggregator | Wants a faster intake path than a phone call from every customer. |
| Small-fleet manager | Needs faster parts identification across multiple Chinese-brand units in the fleet. |

## Jobs To Be Done

1. **Functional job** — Identify a part from a phone photo without driving to a shop.
2. **Functional job** — Describe the part in Russian text when no photo is available.
3. **Functional job** — Hand a part number and a fitment range to a supplier on the same screen.
4. **Emotional job** — Stop the half-hour dig through catalogues for a model the user only sees once a month.
5. **Emotional job** — Stop guessing whether the part in the hand is the part in the order.
6. **Social job** — Share a working part number with a fellow mechanic without sending the whole catalogue.

## Success Metrics

- **Query-to-result latency** — median seconds from a Telegram message to a ranked list of candidates, because speed is the entire promise.
- **Top-1 acceptance rate** — share of queries where the user accepts the top-ranked candidate without re-querying, because that is the agent's accuracy.
- **Top-3 coverage** — share of queries where the right part appears in the top three results, because a long tail of useless candidates defeats the use case.
- **Catalogue coverage of models seen in production** — share of distinct (brand, model, year) tuples observed in real queries that the catalogue has at least one entry for.
- **Photo-query success rate on imperfect images** — share of phone-camera images (not studio photos) that return a useful top-three.
- **Supplier onboarding throughput** — number of distinct parts added per week by suppliers and curators, because the catalogue is the agent's long-term value.

## Pricing & Monetization

The post names no price, no tier and no business model. What the architecture does fix is the cost shape: every query incurs an embedding compute and a vector lookup, while the catalogue and the supplier onboarding are roughly fixed costs that grow with coverage rather than with usage. Any future monetisation has to align with the user — the mechanic or the fleet manager — rather than the supplier, because a marketplace that charges the buyer per query will push the user back to the free text search the agent exists to replace.

## Competitive Landscape

- **Generic visual search tools** — handle the embedding half of the problem and stop there, with no automotive metadata and no Russian catalogue.
- **Parts supplier catalogues with search** — have the metadata but not the photo-or-text intake, and the search assumes the user already knows the part number.
- **Forums and Telegram groups where mechanics ask each other** — the current workaround the post calls out, slow and dependent on who is online.

The post names no competitor. The shapes above are generic and no specific vendor is claimed here.

## Risks & Open Questions

- [ ] Validate that CLIP / OpenCLIP embeddings are discriminative enough on real phone-camera part photos before committing to the catalogue build.
- [ ] Confirm the Russian-language catalogue covers enough of the post-2015 Chinese-brand import set to make the first launch useful.
- [ ] Establish how the agent reports a model it has never seen, because a confident wrong answer is the worst possible failure.
- [ ] Decide whether the feedback loop runs per user, per workshop or globally, because the right granularity determines how fast the ranking improves and how noisy it gets.
- [ ] Measure the Telegram bot's photo-upload behaviour on the worst 3G the user base actually has.
- [ ] Decide whether the supplier onboarding path is self-serve or curated, because a curated catalogue is honest but slow, and a self-serve one is fast but quality-variable.
