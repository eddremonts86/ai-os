# PRODUCT.md — Below the Root (1984 game) ported to JavaScript

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ As a kid, I loved this relatively unknown game, Below the Root.  The world-building of the original trilogy of novels from the 1970s, is lovingly carried through into this side-scrolling &quot;platform-adventure&quot;.<p>You can play the IBM PC port of this game online fairly easily, but the quality of the C64 version is much better (non-dithered graphics, better colors, polyphonic sound).  However I found there was a lot of friction to just play the C64 version. So back in 2013, I tried restoring and packaging the C64 version of the game to make it just one step to play. I made a bootable x86 ISO with a Linux unikernel that only ran the VICE C64 emulator, pre-configured to launch the game from some .G64 disk images that a German hacker cracked for me.  Took about 4 months of effort and the results were mid; the game would be running from VMWare boot in 5 seconds but it still required a whole VM, the sound was choppy, and save games were kind of a hassle.  I made a basic webpage and shelved it as a beta experiment.<p>Then, for some reason about a week ago I decided to try again.  But this time I directed Fable and Astra in varying capacities to dissect and disassemble the original .G64 images, produce a spec, and produce a Javascript version equivalent to the original.  They got about 75% mostly autonomously in a single evening.  I&#x27;ve since spent a few tens of hours playing it through, getting bugs fixed, tweaking the interface, improvements, and writing the About page.  I had to have some difficult conversations with Claude and I made some unpopular decisions, but after all that, this is the result and I&#x27;m kinda proud of it.  It&#x27;s not a major project, but then it never should have been.<p>So I just wanted to share this game from my childhood and the process and the result.  Hope other people remember this game fondly and enjoy playing it again!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49686686) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
