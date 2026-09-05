# PRODUCT.md — Tell HN: Check your Claude settings, it may have silently enabled remote access

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I went to https:&#x2F;&#x2F;claude.ai&#x2F;code today and saw some of my most recent Claude CLI sessions appeared there. I have never explicitly enabled RC, specifically because of security concerns and the only sessions I previously had in https:&#x2F;&#x2F;claude.ai&#x2F;code were the ones I actually started there out of convenience, whenever I was away from my dev machine.<p>So imagine my complete shock when I saw those sessions in their web client <i>and</i> that &#x2F;rc was <i>actually</i> enabled in my CLI! Again, I never enabled it!!!<p>Notably, there was a recent bug fixed 3 days ago (https:&#x2F;&#x2F;github.com&#x2F;anthropics&#x2F;claude-code&#x2F;releases&#x2F;tag&#x2F;v2.1.257) which reads:<p>&quot;Fixed dismissing the Remote Control consent prompt (Esc, or n at claude remote-control) counting as consent, so the next request connected without asking&quot;<p>But MY GOD, if this is what happened here to me—even though I don&#x27;t recall being asked that question—then Anthropic NOT handling this properly by disabling RC and <i>re-asking</i> users to <i>double-check</i> their config and <i>explicitly</i> re-enable it is just unimaginable.<p>This has personally absolutely drew the line for me with them. I use Codex simultaneously and as soon as they release GPT6, I am canceling my sub. Enough is enough.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49565799) · **Category:** ask-hn · **Tags:** Ask HN,Problem
