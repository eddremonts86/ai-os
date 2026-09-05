# PRODUCT.md — A headless Synergy server setup for niche use cases

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ For someone with a bunch of retro machines that do not have a Synergy server port (and may not be near a machine that does or near one that I&#x27;d rather not run a Synergy server on) but do have a Synergy client port, using a headless Synergy server on a tiny SBC like the OrangePiZero makes for a slick, no frills setup to share a single mouse and keyboard among them.<p>How do I use this?
I&#x27;ve currently got it connect across my Amiga 1000, Pegasos II running AmigaOS 4.1 FE and Pegasos II running MorphOS.<p>A bit more info
For headless Synergy, we can&#x27;t use xvfb (a virtual framebuffer) since it doesn&#x27;t take input from physical devices. We can however use Xorg with a dummy device, which is similar to xvfb, but has the benefit of being able to use physical input devices. The below steps will go through the setup process and enabling a persistent Synergy server from the moment the system boots up.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49550214) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
