# PRODUCT.md — Pelmet – menu bar manager for macOS 27 that hides icons on demand

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey, super happy to share about Pelmet, a macOS menu bar manager. It started as a side project during macOS 27 beta and just passed over 500 stars on GitHub and 5000+ downloads in a few weeks. This is crazy to me!<p>Since macOS completely changed the menubar architecture in macOS 27 the tools I was using were no longer working at the time, so I decided to build my own. Hadn&#x27;t build an app in over a decade and things have changed so much since. I&#x27;m a design director so of course special attention went in the user experience and aesthetics (Settings with previews, subtle reveal animations, drag&amp;drop and much more)<p>So macOS now knows how to hide icons natively, it does it when a Mac is locked down for an exam for example, Pelmet reuses the hiding part which then lets macOS know which icons should stay visible. The app does call on a private framework (MenuBarClientCore) resolved at runtime and has a safety net in case it fails, it reports hiding is unavailable instead of breaking the bar. Everything else (positions, clicks, previews, etc.) uses public APIs (Accessibility, ScreenCaptureKit).<p>I&#x27;m amazed with the reception Pelmet got, seems I wasn&#x27;t alone to want a simple menu bar tool that does one thing, and (hopefully) does it well ;) Pelmet was built in native Swift, requires no accounts, no analytics, it&#x27;s just private. Only external call it does is Sparkle for its updates. 
The project is free and open source (GPLv3) and hopefully makes many people happy.<p>Get the calm back in your menu bar and happy to answer questions

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49742398) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
