# PRODUCT.md — Has anyone made a legacy codebase more legible to AI coding agents?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Quick Summary: Did you ever optimize a legacy&#x2F;vibe-coded codebase to improve AI driven development results and avoid fixing a bug for 2 more to appear? i want to hear what your experience was.<p>First, some context. ~7 months ago i was the first Engineering hire at a ( now ) 2 years old startup. The codebase started as a Lovable MVP built by our low level CTO, one month ago we hired a second dev and we are further expanding our engineering team and preparing the terrain for me to move to Staff.
Now as you probably expected, the codebase is a mess since we simply built on top of the first MVP, of course with zero documentation, the main problems i identified in our codebase:
- Duplicated business logic → no single source of truth &#x2F; poor separation of concerns.
- Zombie tables and columns → accumulated schema&#x2F;structural debt, most of them look right, they are not
- We manually track downstream effects since everything is scattered and duplicated in the most confusing way → implicit dependencies, implicit architecture and high change coupling. Changing a thing here also needs changing there and there ( this is mainly fixable by a codebase graph indexer )<p>Now quickly, so you dont get bored, ive identified as the sweet spot solution between speed and reliability to properly document the whole codebase and store that efficiently as a &#x27;knowledge database&#x27; for our AI agents, so they are at least aware of the known gaps, constraints, decisions, business logic, where else to change something and the causes and effects of changes.<p>The closest and most interesting article that treats this exact issue is this one from Meta, which i want to start my approach from.<p>Now what im asking here is for some similar experiences, other startup engineers that had to go through a similar approach, what was their approach, experience, outcome and any tips on what should i avoid or be aware of.<p>Any help will be much appreciated

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49698073) · **Category:** ask-hn · **Tags:** Ask HN,Problem
