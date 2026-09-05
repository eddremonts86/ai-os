# PRODUCT.md — Instantly get the transcript from the agent that wrote any line of code

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ This is basically &quot;git blame but for agent sessions&quot;.<p>In the olden days, we would use git blame (or gitlens extension) to see what body of work a certain line range or file was a part of. We would look back at the PR to see why something was done a certain way.<p>While agents can still do this part well, we can now take it a step further: we can surface the entire agent session from when the code was originally committed! You (or rather your agent) can go back and read the entire original transcript from when it was done.<p>This is very helpful for figuring out why something was done wrong. Maybe a missed assumption, maybe just regular slop. Either way it helps a ton to reference the original implementation session.<p>This is an extra capability, you can also use the regular search to pull up old sessions and work.<p>It runs fully locally and has a pretty cool set of performance optimizations if you care to look into what makes it so fast.<p>I built it for myself and didn&#x27;t look at my own usage levels until this week and realized the search and blame commands are being used over 1k times per day (yes it&#x27;s a lot, but against 5b tokens per day it&#x27;s reasonable).

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49550141) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
