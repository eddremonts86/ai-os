# PRODUCT.md — Review agent changes locally before pushing

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve often found that agents do stupid things when implementing requests. When I only see their changes  with  limited context in a scroll-by approval blob, it&#x27;s easy to miss some of that stupidity.  In those cases, I&#x27;ll often only see it when I can review the full change in context in a PR.<p>This tool adds a local review step, giving the human a final opportunity to be in the loop: your agent commits the changes, pushes to a local &#x27;review&#x27; remote, and waits for feedback. The push itself opens a review via post-receive hook, and provides you with a localhost URL to review the changes.<p>If you request changes via inline comments (like you would for a PR), the agent sees the comments and makes adjustments.  It pushes again and the process repeats until you&#x27;re satisfied.<p>When you approve the change, your agent can take whatever step is next in your normal workflow - push to open an actual PR, merge locally, etc. These are lightweight instructions (~500 tokens) that should be customized for your workflow.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49721156) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
