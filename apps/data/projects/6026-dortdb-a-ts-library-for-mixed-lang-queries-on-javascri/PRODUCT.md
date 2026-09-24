# PRODUCT.md — DortDB, a TS library for mixed-lang queries on JavaScript structures

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello HN,<p>I made a TypeScript library for querying in-memory JS data. Originally, the goal was to have a more modular and lightweight alternative to AlaSQL, but then I was asked to include support for SQL&#x2F;XML, which I personally find way too verbose. So I got to thinking, remembered Virtuoso&#x27;s combined SQL and SPARQL queries and extrapolated from there.<p>The resulting engine consists of a shared core that provides the optimizer, query infrastructure etc., and separate languages that can be added as plugins. The way this is implemented is that the languages are translated into a common algebra. Thanks to that, you can mix multiple languages in a single query - imagine you need to process some tabular data, but for each row you want to extract information from a deep tree-like structure. Well, you can write an outer SQL query and put in an XQuery subquery and it just works. The algebra itself is designed to be extensible - I don&#x27;t presume to have covered everything any query language might need (but there is a language implemented for every major data model - SQL, XQuery and a Cypher-like language (licensing)). For example, XQuery includes two special algebra operators of its own, without needing to modify the core.<p>There is a link to a demo on the GitHub README, where you can play with query plans, or execute queries on some sample data. There is also a link to my diploma thesis about this project, if you&#x27;re interested in that. The whole thing was presented as a demo at VLDB last year.<p>This is a result of more than 2 years of work, and I&#x27;m at the point where I think other people might find it useful too - mainly because I was able to make docs I am happy with. The docs were created with the help of a LLM, but I spent weeks on that, so hopefully they read good. The code itself was written by hand, with the exception of the initial batch of regression tests.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49625773) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
