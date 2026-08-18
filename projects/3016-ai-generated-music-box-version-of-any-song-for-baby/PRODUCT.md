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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A single-purpose hobby tool that takes any track a parent already enjoys and renders it as a slow, sparse music-box arrangement suitable for playing to a baby, using BS-roformer for stem separation and Spotify Basic Pitch for audio-to-MIDI transcription. The founder's framing is that the imperfection — the result sounds like "a drunk little music box" — is the appeal, not a defect.

## Target Users

| Stakeholder | Why they care |
|---|---|
| New parents on leave | Tired of the same three nursery songs; want to play tracks from their own library without the dense arrangement overwhelming the baby. |
| Stay-at-home caregivers | Need long stretches of low-stimulation background audio and prefer songs they personally enjoy. |
| Friends and family gift-givers | Want a music-box version of a wedding song, lullaby cover, or inside-joke track as a keepsake. |
| Show HN tinkerers | Drawn to the "AI pipe that does one weird thing" aesthetic and likely to file issues or PRs. |

## Jobs To Be Done

1. **Functional job** — Take a track from the parent's existing library and produce a slow, simplified music-box version they can play for the baby in under a minute.
2. **Emotional job** — Replace the resignation of "Brahms' Lullaby again" with the small pleasure of hearing a song they actually like in a form the baby responds to.
3. **Social job** — Share the rendered result with a partner, group chat, or baby-shower audience as a personal artefact rather than another stock lullaby playlist.

## Success Metrics

- **Activation:** At least one successful render per Show HN visitor who clones the repo and runs the one-command local start within 5 minutes.
- **Render quality:** Median upload-to-download wall time under 60 seconds for a 3-minute MP3 on a laptop GPU.
- **Engagement:** Returning visitors who upload a second song within 7 days, since the brief implies the tool is meant to be re-run against a personal library.
- **Distribution:** Comment count and star count on the HN thread and the repo as a proxy for the "weird hobby tool" reach.

## Pricing & Monetization

The source is a paternity-leave hobby project with no commercial framing. The MVP ships free and unmonetised; a donation link or "buy me a coffee" badge is the only commercial surface the founder has signalled.

## Competitive Landscape

No competitors are named in the source. Adjacent categories exist — general audio-to-MIDI tools like Basic Pitch itself, stem splitters like demucs and the BS-roformer library, and novelty music generators — but the source does not position this project against any of them. TODO: source names no alternatives

## Risks & Open Questions

- The "drunk little music box" character may read as charming to the founder and as broken to everyone else; we have no third-party validation that the output is actually pleasant for babies.
- BS-roformer and Basic Pitch are heavyweight enough that the MVP may not run on a parent laptop without a discrete GPU; the source does not say whether CPU rendering is acceptable.
- The source gives no legal signal on whether the rendered output can be shared publicly for tracks the parent does not own.
- "Slowed down" is described but no target BPM is stated; the MVP picks a range and parents may disagree.
