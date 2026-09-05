---
id: "3886"
slug: shevtoneaudio-orchestrator-turning-midi-into-full-orche
title: ShevtoneAudio Orchestrator – Turning MIDI into Full Orchestration
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497791"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Symbolic MIDI analysis, Harmony and orchestration rules, Multi-section arrangement engine, DAW MIDI export, Orchestral density modeling]
---
# ShevtoneAudio Orchestrator – Turning MIDI into Full Orchestration

## Tech Stack

- **Symbolic MIDI analysis:** harmony, melody, rhythm, dynamics, structure and density are read from the composer's MIDI.
- **Harmony and orchestration rules:** the musical logic that turns analysis into arrangements.
- **Multi-section arrangement engine:** strings, brass, percussion and other sections are generated per piece.
- **DAW MIDI export:** output stays editable MIDI the composer can continue working with.
- **Orchestral density modeling:** density is analyzed and shaped across the arrangement.

## Architecture

- **Input layer:** the composer's own MIDI file enters the pipeline.
- **Analysis layer:** musical material is decomposed — harmony, melody, rhythm, dynamics, structure, density.
- **Arrangement layer:** sections (strings, brass, percussion and others) are composed around the material.
- **Output layer:** editable MIDI returns to the composer's DAW.

## Milestones

1. **M0 — Analysis.** The composer's MIDI is analyzed across harmony, melody, rhythm, dynamics, structure and density.

2. **M1 — Arrangement.** Full orchestrations across strings, brass, percussion and other sections are generated.

3. **M2 — Editable output.** MIDI output is verified inside real DAWs.

4. **M3 — Launch feedback.** The $149 offer ships; composers and music-tech people give the requested feedback.

## Risks

- **Musical taste ceiling:** rule-based orchestration can sound correct and lifeless; no external validation exists.
- **DAW compatibility:** editable MIDI must round-trip across DAWs, each with its own quirks.
- **Solo composer-developer:** two years of work by one person; the feedback loop the author asks for has not happened yet.
- **Positioning risk:** convincing composers that a MIDI-level tool beats audio-grade generators is the core market question.
