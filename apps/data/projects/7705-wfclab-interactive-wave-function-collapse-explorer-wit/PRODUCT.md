# PRODUCT.md — WFCLab – Interactive Wave Function Collapse Explorer (With Source)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Author here. WFCLab is a desktop app I built in Godot 4 for experimenting with
example-based procedural generation, specifically wave function collapse.<p>The workflow is: load a source image, decompose it into tiles and constraints, review the
resulting tile set and constraints and make a limited set of changes, then run synthesis to generate new layouts that follow the same local rules without copying the original.<p>Some context on why I built it this way:<p>Most WFC implementations I found were either libraries you call from code or one-shot scripts that take an image and print an output. I wanted something where the intermediate steps were visible, so I could examine them and mess around with them. Thus, when synthesis fails or produces garbage, you can go looking for the cause and mess around with the settings until you figure it out, and can better track down the source instead of leaving it hidden away inside a huge function. So WFCLab exposes each stage as a separate view you can inspect and tweak.<p>Current state: the full pipeline works end to end, and there are sample images and saved projects in the repo so you can try it without your own art. It is very much a work in progress. The UI is functional rather than polished, and I have not tested it on a wide range of source images.<p>Known limitations:
- Performance drops on large output sizes, especially with backtracking enabled
- Constraint editing is list-based, not a visual graph editor yet
- Only 4-way and 8-way adjacency, no custom direction sets
- No built in image editing at all.
- Can&#x27;t actually export output images yet.<p>Is anyone interested in this? Should I dedicate additional effort to developing it, or focus my efforts elsewhere? If you have used WFC before, what would you want to be able to control or inspect that this does not expose?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49744376) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
