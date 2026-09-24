# PRODUCT.md — Chess Cheater Detector

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve been playing with this idea to build an estimation of chess cheating likelihood from an exported chess game (PGN format).<p>The main thing I&#x27;ve developed so far is a way of estimating the complexity of each position. The intuition is that matching an engine&#x27;s top moves in difficult positions is much more informative than doing so when there&#x27;s an obvious best move.<p>The detector currently combines complexity with engine agreement and centipawn loss to make a prediction. I&#x27;d like to move beyond the heuristics and train an ML model on a decent dataset of known cheating&#x2F;non-cheating games.<p>There is an obvious limitation though: I have fewer signals available than than Chess.com&#x2F;Lichess. I generally don&#x27;t have a player&#x27;s game history, and most PGNs don&#x27;t contain time-per-move data, both of which would presumably be very useful.<p>Still pretty experimental, so I&#x27;d be interested in feedback; especially from anyone who&#x27;s worked on chess engines, cheating detection, or related statistical problems.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49706032) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
