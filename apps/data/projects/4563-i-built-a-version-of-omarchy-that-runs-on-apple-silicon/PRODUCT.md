# PRODUCT.md — I built a version of Omarchy that runs on Apple Silicon

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I wanted to try out Omarchy before doing a full install, but I only have an M series MacBook so I would have to find a laptop and there&#x27;s no official M support yet.<p>So I decided to create something that allows people to test and run Omarchy on their devices so they can understand how it feels.<p>So I built an app that allows you to run Omarchy Quattro as a native, hardware-accelerated app on your Apple Silicon Mac!<p>It uses QEMU and Apple&#x27;s HVF, a custom built Omarchy ARM image, a swift app enclosing it, and custom patches on Omarchy, QEMU, Hyprland and more.<p>I tried many things, and this approach achieved the best results. The native keyboard experience with Super shortcuts works very well, along with all the rest.<p>It supports any resolution (fixed ratio), retina or non retina displays, audio input &#x2F; output devices, shared clipboard, and many other features.<p>Since it runs on top of macOS, native features like universal clipboard and AirPods work smoothly.<p>It takes ~3min to install, works the same as any other standard macOS app.<p>The whole project is open source, so feel free it check it out on GitHub, install, PRs, etc.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49539913) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
