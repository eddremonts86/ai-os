# PRODUCT.md — Syq – copy files between machines fast (better than rsync)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I got frustrated with the slowness of rsync and made an alternative that works faster by using multiple parallel connections, direct encrypted TCP when available, and other optimizations. I also added cool features like the ability to maintain a persistent ssh connection to the server for fast one-offs, the ability to download to your laptop while working in an ssh shell on a server, and the ability to do direct remote-remote transfers without forwarding your ssh agent (by using restricted ssh keys on the receiver that will only execute a specific request signed with the key on your laptop). It is also designed to be more robustly&#x2F;flexibly scriptable than alternatives.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49644955) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
