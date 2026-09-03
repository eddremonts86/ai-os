# PRODUCT.md — Indextkn – live list prices for 900 AI models in one API

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve been building quite a few POCs that use LLMs at work, and something that always comes up is: &quot;OK, how much are we paying for X?&quot; Or the one that follows right after: &quot;If we use another model, would that be cheaper?&quot;<p>So far, what we&#x27;ve used are hardcoded files or keeping the data in our DB. This won&#x27;t hold when moving to prod. It also keeps us very limited when it comes to creating price comparisons across different models&#x2F;providers.<p>indextkn came from that. Over the past 3 weeks, I&#x27;ve spent a lot of time understanding more about pricing, when prices usually change, discounts (flex, batch, based on X number of tokens, etc.)... and it&#x27;s massive.<p>The current state is not where I want it to be. The goal is to cover all prices and modalities offered by all providers. But right now, we have:<p>1. Prices fetched every couple of minutes, served via API, MCP, or you can install our SKILL.<p>2. Webhooks per model + provider, so you get a notification when anything changes.<p>Most of the time went into the logic to get the prices right and the logic to validate them! We have different levels of confidence, and I&#x27;m particularly proud of how we&#x27;re double-checking when a price seems off (a combination of programmatic logic + agentic workflow).<p>Happy to answer any questions, and I&#x27;d love to have more folks testing it than just myself at the moment. :)

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49527549) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
