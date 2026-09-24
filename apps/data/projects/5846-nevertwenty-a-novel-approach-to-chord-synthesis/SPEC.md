# SPEC.md — Nevertwenty a novel approach to chord synthesis

## Problem

I play piano and I built this for myself recently.<p>Type a song, hit play, and the chords come at you on the beat. It&#x27;s Rock Band for real instruments: the chord you need is the one under the playhead.
I&#x27;ve almost got the entire music database here. I dare you to find a public track that isn&#x27;t in here. Catalog is 6.8M songs &#x2F; 103k artists.<p>Librosa beat detection. ONNX graph combined with my custom tuned BTC. Bass notes processed independently.<p>Median over 4536 cold runs: 2.15s to decode, 122x realtime. Download is the slow part at 8.4s median. Moving the audio is the bottleneck.<p>MP3 search is a fancy matching algorithm; if the song is on the internet it&#x27;ll find it. It was hard to make this pipeline run fast! Should probably stream the audio instead. But I have to change the entire pipeline arch to allow it. Will continue trying.<p>The GTA6 of RockBand play along v1<p>&quot;I can sight-read along to songs I&#x27;ve never heard now. That isn&#x27;t a thing I could do a year ago, and I didn&#x27;t get there by practicing.&quot; said the computer

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49615358)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T19:15:13Z

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
