# PRODUCT.md — Triplox, a distributed Datalog engine with incremental queries

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have been working on a distributed Datalog engine à la Datomic on top of object storage. The system is called Triplox. I am using <a href="https:&#x2F;&#x2F;github.com&#x2F;slatedb&#x2F;slatedb" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;slatedb&#x2F;slatedb</a> at the storage layer. The main ideas are roughly the following (in no particular order):<p>- Object storage centric. In its final version Triplox should simply need a single (or likely two) S3 bucket(s) for deployment.<p>- The Datomic data model and API as main inspiration.<p>- A client&#x2F;server architecture.<p>- Incremental Datalog queries. You can dynamically subscribe and unsubscribe from live Datalog queries.  This is the most experimental part of Triplox and will need more effort to scale.  Standard connectives (`and`, `or`, `not`) are already supported. You can find an intro here: <a href="https:&#x2F;&#x2F;triplox.xyz&#x2F;incremental-queries&#x2F;overview&#x2F;" rel="nofollow">https:&#x2F;&#x2F;triplox.xyz&#x2F;incremental-queries&#x2F;overview&#x2F;</a>.<p>The incremental query angle is likely the most interesting aspect for people considering such a solution. If you have an incremental Datalog problem or are working on sync engines, Triplox might be of interest.<p>Website: <a href="https:&#x2F;&#x2F;triplox.xyz&#x2F;" rel="nofollow">https:&#x2F;&#x2F;triplox.xyz&#x2F;</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49550003) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
