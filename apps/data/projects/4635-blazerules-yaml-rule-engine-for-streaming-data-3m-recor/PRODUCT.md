# PRODUCT.md — BlazeRules – YAML rule engine for streaming data, 3M records/SEC

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ <a href="https:&#x2F;&#x2F;blazerules.dev" rel="nofollow">https:&#x2F;&#x2F;blazerules.dev</a> I initially wanted to make a sub-millisecond log parser in C++ but that blew into a embeddable decision engine, that can run YAML defined rules on incoming data.
The rules are executed in a vectorized format on incoming data by reprojecting into a columnar format first, if it&#x27;s not already. Depending on the payload size and rules complexity, the performance goes from 200K records&#x2F;s to more than million records&#x2F;sec, in terms of througput this would be around 200 MiB&#x2F;s to 3 GiB&#x2F;s on average.<p>Rules can be sql expressions too, or onnx models (numeric), window ops and quite a few more operations are supported.<p>It&#x27;s comparable to DuckDB but for streaming data and on the fly decisions.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49534550) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
