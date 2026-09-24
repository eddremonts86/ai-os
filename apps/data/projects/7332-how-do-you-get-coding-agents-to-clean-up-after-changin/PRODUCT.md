# PRODUCT.md — How do you get coding agents to clean up after changing direction?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve noticed the same failure mode across most coding agents.<p>When an implementation runs into a problem, such as a function not meeting the requirement, the agent often writes a replacement. If the overall approach changes, it starts a new path. If only a detail needs adjustment, it may add another helper or class.<p>What it rarely does is remove the code and data definitions added for the abandoned approach. After a few iterations, the result may work, but it contains stale branches, unused helpers, redundant logic, and fields that no longer serve a purpose.<p>I&#x27;ve started thinking this needs an explicit project-level rule for agents responsible for implementation and fixes:<p>```
After changing an implementation approach or fixing an issue, review the code logic and data definitions touched by the change. Keep only items that are still required. Remove unused functions, redundant logic, and data fields that are no longer needed.
```<p>A git-commit skill can be a useful trigger for this check, but the cleanup should remain part of the implementation process rather than the responsibility of a commit skill.<p>How are others handling this? do you add an explicit cleanup phase after each correction, enforce it during review, or rely on tooling to catch the leftovers?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49722980) · **Category:** ask-hn · **Tags:** Ask HN,Problem
