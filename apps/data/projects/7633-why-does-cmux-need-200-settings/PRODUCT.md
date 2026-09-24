# PRODUCT.md — Why does cmux need 200 settings?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Just recently discovered how great cmux terminal is but silly question: why does it need 200 settings? I&#x27;m trying to find how to turn certain things on and off and I gave up trying to use my human brain to search for the right thing and started asking codex.<p>Then I found the one settings I want (turn off the bell notification isn&#x27;t even there) so I forked it and had codex add that only to discover the xcode build process takes hours. So I made a branch called &quot;simple&quot; and I told codex &quot;remove 90% of the code from this branch and just make this a very simple version of cmux.&quot; And then I started adding back the few missing things:<p>https:&#x2F;&#x2F;github.com&#x2F;andrewarrow&#x2F;cmux&#x2F;commits&#x2F;simple&#x2F;<p>Now it builds in 6 seconds and any custom setting I need codex just ads so the silly question is:<p>For a terminal app used by developers for developers who all use codex, why do we even need 1 giant 2 hour build process app with all that extra stuff? We all have xcode and since I have to use codex anyway to find the right setting, this isn&#x27;t slower it&#x27;s faster!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49743291) · **Category:** ask-hn · **Tags:** Ask HN,Problem
