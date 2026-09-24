# PRODUCT.md — Zuck's bot increased our Vercel bill 10x

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I’m writing this after receiving a Vercel bill that was 10x higher than usual.<p>The worst part: The increase wasn’t caused by more users, but by +1M requests from meta-externalagent&#x2F;1.1.<p>The requests targeted a Vercel preview deployment that we had shared on WhatsApp to test whether its link-preview metadata was working correctly.<p>We naively never bothered with bot calls; they had never caused any problems in the previous four years of our app on Vercel, but that changed when Meta’s crawler began repeatedly visiting this preview deployment.<p>If you host on Vercel, review your bot-protection settings and make sure preview deployments aren’t unnecessarily exposed. Otherwise, an aggressive crawler could leave you with a surprisingly large bill. And unfortunately, Vercel declined to help to ease this bill.<p>Zuck is definitely not slowing down.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49732873) · **Category:** ask-hn · **Tags:** Ask HN,Problem
