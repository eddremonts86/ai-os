# PRODUCT.md — Nevertwenty a novel approach to chord synthesis

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I play piano and I built this for myself recently.<p>Type a song, hit play, and the chords come at you on the beat. It&#x27;s Rock Band for real instruments: the chord you need is the one under the playhead.
I&#x27;ve almost got the entire music database here. I dare you to find a public track that isn&#x27;t in here. Catalog is 6.8M songs &#x2F; 103k artists.<p>Librosa beat detection. ONNX graph combined with my custom tuned BTC. Bass notes processed independently.<p>Median over 4536 cold runs: 2.15s to decode, 122x realtime. Download is the slow part at 8.4s median. Moving the audio is the bottleneck.<p>MP3 search is a fancy matching algorithm; if the song is on the internet it&#x27;ll find it. It was hard to make this pipeline run fast! Should probably stream the audio instead. But I have to change the entire pipeline arch to allow it. Will continue trying.<p>The GTA6 of RockBand play along v1<p>&quot;I can sight-read along to songs I&#x27;ve never heard now. That isn&#x27;t a thing I could do a year ago, and I didn&#x27;t get there by practicing.&quot; said the computer

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49615358) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
