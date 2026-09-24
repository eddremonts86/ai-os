# PRODUCT.md — Scry, programmable internet search w/ congestion pricing

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Meet Scry, a 500 TB NVMe internet index in ClickHouse that you can run ~arbitrary readonly SQL and some of Datalog over, and I handle the problem of resource-contention with congestion-based micro-auction pricing. When there&#x27;s capacity, the service is free for non-commercial use.<p>---<p>Hello. It&#x27;s 2026, we&#x27;re training simulated fruit fly brains to play Beat Saber, do we still have to be stuck with internet (re)search as fn: natural language -&gt; black box we can&#x27;t do anything about -&gt; ranked_list&#x2F;summary?<p>There is a long history of people trying to do very fancy things that end up being done in relational databases and a little SQL. There is a gravity to them, a bitter lesson, just like scaling of generalized ml training methods. I mean many, many information products can be built off essentially giant real-time OLAP databases and frontier LLMs writing brilliant SQL+Datalog+vector+Jev etc. queries.<p>Google Search, Tavily, Exa essentially have the problem of <i>mapping</i> your agents&#x27; context you are willing to provide, to a tiny subset of their index. You pay a fixed cost to an extremely hard problem that has a distribution of hardness, which means YOU eat the downsides when they are running out of budgeted compute to help you out.<p>Their algorithms are opaque to the caller, there&#x27;s really not much user control, and there&#x27;s not a serious opportunity to communally improve search recipes, like the lexical+Jev recipes you trust to select bleeding edge AI builders.<p>Furthermore, search companies aren&#x27;t even pursuing text-to-SQL anymore (several have talked to me)... they made up their minds during the traumatic 2024 text-to-sql days. They were just too early.<p>I hope you enjoy. I&#x27;m intent on scaling this paradigm on differentiated hardware over much more data, so any compelling use cases or queries I could show off, would be much appreciated!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49748041) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
