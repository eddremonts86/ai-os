# SPEC.md — Fable hacked my piano, can I release the results?

## Problem

I have a self playing piano, using a system called PianoDisc Protigy. They have an online store which sells music for their system, from various modern artists along with classics such as Bach and Beethoven. Last night I saw they had released some music from Eric Satre, a 19th century French composer, which I bought. Curious if I could have just used AI to create these files, I began experimenting with Astra and Fable. Feeding the output of one into the other to critique. After an hour of LLM discussion of Rubato and fermata, solenoid response times and proper sustain pedal technique, they settled on their ultimate version of Gymnopedie No 1.<p>I then asked Fable to compare it to the open source version I&#x27;d downloaded from Mutopia, which it promptly ripped apart. No sustain, zero rubato, upside down balance.<p>Ok, what about the version I&#x27;d just bought?<p>The PianoDisc versions are mp3s encoded with the right channel carrying MIDI to be played on the piano, and the left channel containing any accompanying music to be played through attached speakers (who doesn&#x27;t want the harmonica on Piano Man?)<p>I gave the mp3 to Fable, which promptly decoded the format, identifying the right channel carrying MIDI using a 2004.5 Hz square wave.<p>It then went on to analyze the nuance of pedal lift and melody relative to the chords.<p>Fable then asked if I wanted it to build an encoder to write my own MIDI files into the right channel of mp3s.<p>Sounds great, and I instructed it to write the encoder.<p>What it came back with was a python encoder PLUS a decoder.<p>In the verbose explanation, it mentioned decoy notes.<p>Curious, I asked it to explain the decoy notes.<p>Apparently PianoDisc adds obfuscation into their format which is handled properly by their decoder, but would leave naively extracted MIDI unplayable on other systems.<p>Fable created an encoder which adds those decoy notes, and a decoder which removes them.<p>Am I allowed to publish the decoder? The encoder?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49577129)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-05T14:54:44Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
