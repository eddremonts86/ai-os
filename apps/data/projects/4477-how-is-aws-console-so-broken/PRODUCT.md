# PRODUCT.md — How is AWS console so broken?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ A small rant, after painful user experience. I admit I visited it after a while spending on GCP space, but the console looks like it is either not maintained at all, or individual teams just throwing stuff at it and causing a mess.<p>My simple workflow - I want to copy millions of objects from one bucket in us-east-1 to us-west-1<p>1. I can kick off the replication rule. but oh wait, there is no monitoring, unless you select it in edit rules. Even then, the experience is broken and I have now no idea if anything is happening in the background.<p>2. There is batch operation. It doesn&#x27;t work. If I select source region for aws console, I can&#x27;t see destination region bucket to execute copy batch. Vice-a-versa, if I select destination region, I can&#x27;t select any buckets from the source region.<p>I can perhaps use a CLI, which is a long list of instructions to follow and execute without pulling my hair out.<p>I asked claude code to just figure out out to create a job and execute it and tell me the state. It didn&#x27;t even hesitate.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49531472) · **Category:** ask-hn · **Tags:** Ask HN,Problem
