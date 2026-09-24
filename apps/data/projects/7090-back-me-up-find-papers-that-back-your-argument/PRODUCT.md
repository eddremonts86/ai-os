# PRODUCT.md — Back Me Up – Find papers that back your argument

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Back Me Up is a tiny science-ish machine that finds published papers that back your argument. It stemmed from a conversation with a friend around life sciences, where we kind of landed at &quot;surely there’s a paper confirming most arguments&quot;, i.e. coffee is bad, coffee is great, etc.<p>You enter a claim, e.g. &quot;drinking wine is good for the heart&quot; -&gt; the system does a semantic search across a corpus (PMC, bioRxiv, medRxiv and arXiv) -&gt; pulls in relevant quotes if they fit your claim, and gives you a verdict.<p>Frontend was done with a combination of Sol + Opus, I spent a bit of time exploring different designs and landed on this slightly ridiculous printer that spits out your evidence.<p>Some notes: 
- I have no accuracy evals, this was a throwaway thing I built, so no clue on reliability. It does pass the vibe test, so give it a whirl!
- Initially built a RAG for a tiny set of PMC, but scaling that up seemed like a lot of work for an evening project. Luckily found an API that does the semantic search across the different sources.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49709678) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
