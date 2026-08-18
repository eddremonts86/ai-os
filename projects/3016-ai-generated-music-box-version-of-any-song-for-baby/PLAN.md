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

## Tech Stack

- **Stem separation:** BS-roformer via the project's pre-trained checkpoints — the source explicitly names it, so no swap to demucs or MDX-Net without changing the audio character.
- **Audio-to-MIDI:** Spotify Basic Pitch, the only tool the source names and the natural pair to BS-roformer for a "stem then quantise" pipeline.
- **Music-box render:** A small Python step that reads the MIDI, drops everything outside a chosen pitch window, normalises tempo to a baby-friendly range, and emits a pluck-style synth using soundfile + numpy.
- **Web shell:** FastAPI with a single upload endpoint and a static HTML page — kept light because the brief is "drag a file in, get a file back", not a product surface.
- **Local packaging:** A Makefile target that runs the server with uvicorn and a small README so a Show HN visitor can clone and try it in one command.
- **No frontend framework:** A vanilla HTML form is enough; React would only add weight to a hobby utility.

## Architecture

```
[ Browser upload ] ---> [ FastAPI /render ]
                              |
                              v
              [ BS-roformer ] --> stem.wav (vocals / inst / mix)
                              |
                              v
                  [ Basic Pitch ] --> midi.mid
                              |
                              v
              [ music_box.render ] --> musicbox.wav
                              |
                              v
                  [ Download link ]
```

The flow is a single linear pipeline. The browser submits a multipart upload, the server runs BS-roformer on a temp file, hands the chosen stem to Basic Pitch, quantises the resulting MIDI into a music-box note set, and returns the rendered WAV through the same response. There is no queue, no database, and no user state.

## Milestones

1. **M0 — Pipeline on disk:** Reproduce the founder's exact steps (BS-roformer + Basic Pitch + a simple MIDI quantiser) on a single test track so we know the existing result is reachable from a fresh checkout.
2. **M1 — Web shell:** A FastAPI endpoint that accepts an upload, runs the pipeline, and returns a downloadable WAV; the result page lets the user pick a different stem and re-render.
3. **M2 — Music-box voicing:** A dedicated render pass that drops velocities, thins repeats, and slows the tempo into a baby-friendly range; verify on three songs of different genres.
4. **M3 — One-command run:** A Makefile target and a short README so a Show HN visitor can clone, install, and produce a render in under five minutes on a laptop with a modest GPU.
5. **M4 — Polish:** Error messages for unsupported formats, oversized files, and empty stems; a basic progress indicator so the parent knows the server is alive during the BS-roformer step.

## Risks

- **Heavyweight models on consumer hardware** — BS-roformer is GPU-friendly; on CPU only the MVP may time out for the typical 3-minute input. Mitigation: document the GPU requirement in the README and fail fast with a clear message.
- **"Drunk music box" turns off more users than it charms** — the imperfection is part of the appeal for the founder but may read as broken elsewhere. Mitigation: keep a side branch with a cleaner quantiser so the founder can offer both if feedback skews negative.
- **No legal clarity on sharing rendered output** — the source does not say what parents may do with the rendered WAV. Mitigation: ship with a "personal use only" note in the README rather than a stronger claim.
- **Render wall time vs. parent patience** — a parent holding a crying baby will not wait two minutes for a render. Mitigation: target under 60 seconds for a 3-minute MP4 on the reference machine and show a progress indicator.
