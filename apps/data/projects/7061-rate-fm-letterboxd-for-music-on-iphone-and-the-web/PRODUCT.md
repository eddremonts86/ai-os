# PRODUCT.md — Rate.fm – Letterboxd for Music, on iPhone and the Web

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I made rate.fm because every “Letterboxd for music” app sucked. I tried RYM (still 2004), AOTY (a charts website), and Musicboard (dying). I just wanted a fast diary where I could log what I heard, give it a number, write a little, and see what friends thought.<p>The app lets you rate albums and songs out of 10, write reviews, make lists, and follow friends. We aggregate scores from 19 publications (Pitchfork, Rolling Stone, NME, AllMusic, The Guardian) and show them on the pages as well. Connect Apple Music, Spotify, or Last.fm to log passively and get stats. You can rate whatever song is playing from the Lock Screen without opening the app, and import your Musicboard history with a tap.<p>Tech: UIKit and SwiftUI, Node on Vercel, Postgres on RDS. The catalog is about 226k albums and 563k songs, mostly from Apple Music, with MusicBrainz for the more obscure releases.<p>The hardest problem was a clean music library. Music identity is extremely convoluted: the same recording shows up across ISRCs, reissues, and regional storefronts, and basically every feature was broken until I folded them into one identity.<p>Free, no ads, iPhone only for now: <a href="https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;rate-fm-rate-your-music&#x2F;id6756295934">https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;rate-fm-rate-your-music&#x2F;id6756...</a><p>I’d love feedback on the onboarding, and whether you think the critic scores are a good feature or just a distraction.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49693141) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
