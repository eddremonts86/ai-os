# PRODUCT.md — I killed every houseplant I owned, so I built an app to stop doing that

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve killed more houseplants than I&#x27;d like to admit. Not from neglect exactly — from the specific, stupid way I neglect them: I water everything on the same day because I can&#x27;t keep track of which plant wants what, so half of them rot and the other half go thirsty.<p>So a few months ago I started building GrowBook. A plant care tracker. Flutter, offline-first, Android first.<p>I know. There are already a hundred plant apps. I want to be honest about why I built another one instead of just downloading one of those.<p>I tried them. The good-looking ones are subscription walls with a plant drawing on top — you can&#x27;t add a second plant without paying. The free ones drown you in a feed and a shop and &quot;plant coins.&quot; And almost all of them assume you&#x27;re online, all the time, which is a weird assumption for an app whose entire job is to remind you to do a thing at home.<p>What I actually wanted was small and boring:<p>- A list of my plants with a photo of each real one, not a stock image of the species.
- Per-plant watering &#x2F; fertilizing &#x2F; pruning schedules, because my snake plant and my fern do not live on the same clock.
- A reminder that actually fires, even with no internet, even after I reboot my phone.
- The whole thing usable without an account. Cloud sync should be a thing I opt into, not the price of entry.<p>That last point turned into the spine of the whole architecture. GrowBook is offline-first: everything lives in a local SQLite database (I&#x27;m using Drift), and the app is fully functional before you&#x27;ve ever seen a login screen. Sync to the cloud is a feature you turn on, not a wall you climb over.<p>I&#x27;m building this mostly solo, and I want to do it in the open — including the parts that go wrong, which so far is most of them. The next few posts are going to be very specific: the week I lost to Android&#x27;s notification system, the light sensor Flutter refused to read, the AI plant identifier I had to rip out and rebuild. Real bugs, real dead ends.<p>Where I&#x27;m at right now, honestly:<p>- Users: 0
- Revenue: $0
- Plants kept alive by the app: a suspiciously healthy count, but I&#x27;m the developer, so I don&#x27;t count.<p>If you keep plants: what&#x27;s the one thing every plant app you&#x27;ve tried gets wrong for you? I&#x27;d rather build from your annoyance than my assumptions.<p>— building GrowBook in public, #1

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49604776) · **Category:** ask-hn · **Tags:** Ask HN,Problem
