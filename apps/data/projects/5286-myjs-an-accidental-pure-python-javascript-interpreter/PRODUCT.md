# PRODUCT.md — Myjs An accidental pure-Python JavaScript interpreter

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN! byteface here. myjs was a recent accident I&#x27;d like to share.<p>Several years ago I began writing DOM API&#x27;s in Python as a curiosity: <a href="https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic&#x2F;" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic&#x2F;</a><p>Every now and then I do another pass rolling in more features from the MDN pages. I have lots of unit tests but found that porting real code and libraries was a useful test of the DOM compatibility. But I didn&#x27;t want to pollute the core any further as had already ported d3 and jquery.<p>So I created a new repo called domonic-libs: <a href="https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic-libs&#x2F;" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic-libs&#x2F;</a><p>Anyways a couple of days ago while porting some js libraries faithfully to run against dom.py and javascript.py I came across Acorn (a Javascript parser) and coverted it into pure python.<p>Once Acorn.py was producing an AST, I mapped that against domonic&#x27;s Javascript and DOM nodes and to my surprise... actual JS code started executing inside the Python process!<p>Give it a try:<p>pipx install myjs<p>Would love to hear your thoughts, edge cases to test, or feedback!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49579498) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
