---
id: "3016"
slug: ai-generated-music-box-version-of-any-song-for-baby
title: AI-generated music box version of any song (for baby)
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338988"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# AI-generated music box version of any song (for baby)

## Problem

title basically covers it. project #2 from my paternity leave. My partner & I got frustrated with hearing Brahm's Lullaby and Wheels On The Bus repeatedly. I also stand by that babies can enjoy adult music just as easily as they can enjoy "kids music". But most adult music is too dense/complex for babies to understand, so I created this to generate baby-friendly, slowed down versions of songs that we like to play for our baby & sing along with.Uses BS-roformer for stemming out the input audio + spotify Basic Pitch for transposing to midi. Still needs some work, kinda sounds like a drunk little music box version of the original but very fun.

---

## Objective

The MVP delivers a single-purpose web tool that takes any song a parent likes and turns it into a sparse, slow, music-box arrangement suitable for playing to a baby. The pipeline keeps BS-roformer for vocal/instrument separation and Spotify's Basic Pitch for audio-to-MIDI transcription, then renders a deliberately reduced note set in a music-box timbre. The founder is explicit that the current output already resembles "a drunk little music box", so the MVP prioritises getting the end-to-end transform running on a laptop or modest GPU over polish. The first experience is a drag-and-drop upload that returns an audio file the parent can play from a phone, with the option to pick a different stem (vocals, accompaniment, full mix) as the source.

## Target Users

1. **New parents on paternity or shared parental leave** who already own a sizeable music library and want to play tracks they personally enjoy rather than relying on a small canon of nursery songs.
2. **Stay-at-home caregivers** who need long stretches of low-stimulation background audio and are happy to feed the tool new uploads as their taste evolves.
3. **Music-curious parents and friends-of-family** who would like a custom "music-box version" of a wedding song, lullaby cover, or inside-joke track as a keepsake gift.
4. **Hobbyist tinkerers** drawn to the "AI pipe that does one weird thing" aesthetic of Show HN, who will use the tool to experiment with their own playlists and may submit issues and PRs.

## MVP Scope

- Web upload form that accepts an MP3 or WAV file up to roughly 10 minutes long and returns a downloadable WAV render.
- Server-side pipeline that runs BS-roformer to separate the input into stems, picks one stem (default: instrumental), and feeds it through Basic Pitch to produce MIDI.
- A music-box renderer that quantises the MIDI to a limited pitch set, drops velocity and note density, and slows the tempo into a baby-friendly range (roughly 50-70 BPM).
- A simple stem-picker in the result page so the parent can re-run with vocals only, accompaniment only, or the original mix.
- A short README and one-command local run so other Show HN visitors can clone the repo and try it on their own songs.
- Basic error handling for unsupported formats, files that exceed the size limit, and stems that produce too few notes to render meaningfully.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The MVP will not attempt to clean up the "drunk little music box" artefact; the founder's framing is that the imperfection is part of the charm and the tool is explicitly a hobby utility.
- The MVP will not provide streaming, playlists, accounts, or any persistence layer — every render is fire-and-forget and the server can forget the upload.
- The MVP will not include a paid tier, subscription, or usage cap. The tool is a personal project, not a commercial product.
- The MVP will not attempt beat-perfect time-stretching, key transposition UI, or per-instrument muting; the source brief lists BS-roformer + Basic Pitch and nothing more sophisticated.
- The MVP will not ship a mobile app — a phone browser opening the web tool is sufficient for the "play for the baby" use case.
