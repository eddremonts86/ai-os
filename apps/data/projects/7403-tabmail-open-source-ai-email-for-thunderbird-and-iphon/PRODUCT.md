# PRODUCT.md — TabMail. Open-source AI email for Thunderbird and iPhone

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi all,<p>I&#x27;m the sole developer of TabMail. I wanted my email client to have AI features, and ended up making a Thunderbird add-on and an iPhone app. I&#x27;ve now open-sourced both under MPL 2.0, and I wanted to share them here to get some community feedback, if possible.<p>I made a short video of both, since it&#x27;s easier to show what they do than explain everything in a post. Hopefully you like it: <a href="https:&#x2F;&#x2F;tabmail.ai&#x2F;demos&#x2F;tabmail-promo.mp4" rel="nofollow">https:&#x2F;&#x2F;tabmail.ai&#x2F;demos&#x2F;tabmail-promo.mp4</a><p>You can review a prepared reply, tell it what to change, or ask questions about your inbox and calendar. On TB, I wanted to do most of this with the keyboard. On the phone, I wanted to just talk to it :)<p>Code:
Thunderbird: <a href="https:&#x2F;&#x2F;github.com&#x2F;TabMail&#x2F;tabmail-thunderbird" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;TabMail&#x2F;tabmail-thunderbird</a>
iOS: <a href="https:&#x2F;&#x2F;github.com&#x2F;TabMail&#x2F;tabmail-ios" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;TabMail&#x2F;tabmail-ios</a><p>Note: I have the AI backend closed for now, since it does need me to fish compute from LLM providers, etc. Still, I made the email&#x2F;calendar processing ZDR (zero data retention) since, as a solo dev, I didn&#x27;t want to go through the headache of storing anyone&#x27;s email or calendar data. The content can be sent for AI processing, but isn&#x27;t kept on TabMail&#x27;s servers. Search stays on-device.<p>Anyhow, please try it out! Just trying to share how I wanted email to be with AI features :) Happy to answer questions.<p>Downloads: <a href="https:&#x2F;&#x2F;tabmail.ai" rel="nofollow">https:&#x2F;&#x2F;tabmail.ai</a><p>PS. The Thunderbird add-on uses the Experiments API for things that aren&#x27;t supported in MV3, so I&#x27;m hosting it on my website for now.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49730649) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
