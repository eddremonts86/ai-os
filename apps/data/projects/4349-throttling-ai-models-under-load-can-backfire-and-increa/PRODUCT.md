# PRODUCT.md — Throttling AI models under load can backfire and increase demand (SIM)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ OP here: TL-DR: When AI providers silently swap weaker models under high demand, this can cause even more demand as users tend to re-ask. This is even worse for agents. Both of these effects cause even higher load on the data centers. I guess all of us have felt when the models &quot;don&#x27;t feel quite the same&quot;, so this could explain part of it.<p>I modeled this as a fleet scheduling problem using Queueing Theory and Dynamic Programming over a finite horizon. The standard practice of throttling once the number of jobs in server exceeds certain threshold is in fact suboptimal. The optimal policy consists in segmenting the part of the traffic that is retry sensitive, from those that are not. For example, an user doing a basic data parsing might still do well under a weaker model, but a power user will certainly feel the degradation and ask more.<p>Demo: Just a toy instance to illustrate the issue. The user can create their own policies and see how they perform against the industry standard and the optimal one. It is roughly 100 lines of Flask + JS frontend.<p>Paper with proofs: <a href="https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2608.23986" rel="nofollow">https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2608.23986</a><p>For those of you who have worked in inference infra, does this match anything you have seen?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49521092) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
