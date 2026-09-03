# PRODUCT.md — The Fastest Local H3 Video Generation on Mac

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ 960×544, 124 frames, 6 DiT steps with Turbo LoRA:<p>On M5 Pro MacBook Pro 16&quot;, 24 GB RAM: 
Vpipe 5 min 0 sec vs. H3.c 7 min 19 sec.<p>For comparison, H3.c is probably the best-known “hardcore” H3 implementation out there.<p>Vpipe runs H3 through our own C++&#x2F;Metal inference stack — no Python or third-party tensor runtime in the forward pass. We use weight streaming with resident blocks to fit the 33B model on a 16GB Mac, with M5-specific acceleration through NAX matmul2d.<p>If you know of a faster H3 implementation on Apple Silicon, we’d love to benchmark against it.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49523873) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
