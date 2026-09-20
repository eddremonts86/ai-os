# PRODUCT.md — ChessNotate – Fix a broken PGN without branching into a new variation

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN! I just built ChessNotate to turn my handwritten chess scoresheet into a clean PGN to solve my own pain points when it comes to capturing my games (and my son&#x27;s)<p>A lot of times my son and I make typos (accidentally mixing up B with b), or missing out moves through the middlegame and the frustrating part is when I try to validate it using PGN validator, if the PGN is invalid, it either rejects the PGN outright, or stops at the first error and everything else gets discarded. Then I have to fix the moves one by one. Worse, correcting a move usually gets treated as branching to a new variation<p>ChessNotate validates the moves but it doesn&#x27;t simply stop and discard past any errors. You can still see the rest of the moves which helps you to confirm if your fixes (including inserting or deleting moves) on the errors are correct. The lack of branching is on purpose because it&#x27;s not an analysis tool so it&#x27;s meant to do move correction<p>Initially the plan was to use OCR to capture handwritten notes with Apple VisionKit to avoid paying for a frontier model but it didn&#x27;t work out. It only detected tables on a really good photo and it couldn&#x27;t reliably parse fairly neat handwriting so I decided just to discard the OCR idea and focus on the core problem of making it easy to fix PGN instead<p>It&#x27;s on the App Store now as a paid app (small one-time fee) and there&#x27;s also a free web version available. The app is a UX upgrade over the web version with sound&#x2F;haptic feedback, eval bar and a dedicated notation keypad built for iPhone

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49582796) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
