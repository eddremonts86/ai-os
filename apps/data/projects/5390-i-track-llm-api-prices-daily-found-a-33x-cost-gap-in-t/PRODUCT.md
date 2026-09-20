# PRODUCT.md — I track LLM API prices daily, found a 33x cost gap in the same model

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I kept finding LLM pricing comparison posts that were already stale, so I built a scraper that snapshots the full OpenRouter catalog (425 models, 58 providers) every day and diffs it against the previous day. It&#x27;s been running unattended for about a week now: https:&#x2F;&#x2F;costpertoken.dev<p>One thing that fell out of the data surprised me: on the exact same model, a coding-agent-shaped call (large context in, code out) costs roughly 33x more per call than a bulk-classification-shaped call. I checked this on GPT-5.6, Claude Sonnet 5, and Gemini 3.7 Flash and got 33.6x, 33.3x, and 33.3x respectively -- almost identical despite three unrelated pricing tables. Seems to be a property of the call shape, not the vendor. Writeup here: https:&#x2F;&#x2F;costpertoken.dev&#x2F;guides&#x2F;why-agent-calls-cost-more-than-chat-calls&#x2F;<p>The site is a static Cloudflare Worker. Data collection runs via a local launchd job independent of any AI model or API, specifically so it can&#x27;t silently stop working.<p>Feedback and pricing corrections welcome -- it&#x27;s day 8, so there are rough edges.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49586810) · **Category:** ask-hn · **Tags:** Ask HN,Problem
