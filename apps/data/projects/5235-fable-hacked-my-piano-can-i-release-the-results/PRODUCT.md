# PRODUCT.md — Fable hacked my piano, can I release the results?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have a self playing piano, using a system called PianoDisc Protigy. They have an online store which sells music for their system, from various modern artists along with classics such as Bach and Beethoven. Last night I saw they had released some music from Eric Satre, a 19th century French composer, which I bought. Curious if I could have just used AI to create these files, I began experimenting with Astra and Fable. Feeding the output of one into the other to critique. After an hour of LLM discussion of Rubato and fermata, solenoid response times and proper sustain pedal technique, they settled on their ultimate version of Gymnopedie No 1.<p>I then asked Fable to compare it to the open source version I&#x27;d downloaded from Mutopia, which it promptly ripped apart. No sustain, zero rubato, upside down balance.<p>Ok, what about the version I&#x27;d just bought?<p>The PianoDisc versions are mp3s encoded with the right channel carrying MIDI to be played on the piano, and the left channel containing any accompanying music to be played through attached speakers (who doesn&#x27;t want the harmonica on Piano Man?)<p>I gave the mp3 to Fable, which promptly decoded the format, identifying the right channel carrying MIDI using a 2004.5 Hz square wave.<p>It then went on to analyze the nuance of pedal lift and melody relative to the chords.<p>Fable then asked if I wanted it to build an encoder to write my own MIDI files into the right channel of mp3s.<p>Sounds great, and I instructed it to write the encoder.<p>What it came back with was a python encoder PLUS a decoder.<p>In the verbose explanation, it mentioned decoy notes.<p>Curious, I asked it to explain the decoy notes.<p>Apparently PianoDisc adds obfuscation into their format which is handled properly by their decoder, but would leave naively extracted MIDI unplayable on other systems.<p>Fable created an encoder which adds those decoy notes, and a decoder which removes them.<p>Am I allowed to publish the decoder? The encoder?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49577129) · **Category:** ask-hn · **Tags:** Ask HN,Problem
