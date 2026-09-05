# PRODUCT.md — How do you gate an autonomous coding agent's shell access?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve been giving coding agents more autonomy lately, letting them run shell commands unattended for longer stretches, and I don&#x27;t have a good answer for how people actually gate that beyond &quot;run it in a container and hope.&quot; A container limits blast radius but doesn&#x27;t stop the agent from reading a secret and then making an outbound call in the same session, or force-pushing to a branch it shouldn&#x27;t touch, or just doing something irreversible while nobody&#x27;s watching. Curious what people are actually doing: allowlists of commands, human-in-the-loop approval for anything destructive, something built into the agent framework itself, or just accepting the risk because the alternative is too slow? Specifically interested in what happens when the approval step itself fails or times out, does your setup default to allow or deny?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49556858) · **Category:** ask-hn · **Tags:** Ask HN,Problem
