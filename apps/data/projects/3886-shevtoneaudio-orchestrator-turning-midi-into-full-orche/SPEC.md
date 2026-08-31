---
id: "3886"
slug: "shevtoneaudio-orchestrator-turning-midi-into-full-orche"
title: "ShevtoneAudio Orchestrator – Turning MIDI into Full Orchestration"
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

## Problem

Bor Shev, a composer and developer, has spent two years building ShevtoneAudio Orchestrator. The idea: instead of generating a finished piece of music and replacing the composer, Orchestrator takes the composer's own MIDI and develops it into a full orchestration. It analyzes the musical material — harmony, melody, rhythm, dynamics, structure and orchestral density — and creates an arrangement across strings, brass, percussion and other sections. The important part is that the result remains editable MIDI: the composer keeps control and can continue working with everything inside their DAW. The author believes this is a breakthrough direction for AI-assisted composition — AI as an orchestration tool rather than a replacement for the musician — and he is running a limited launch offer for Orchestrator at $149. The demo is at orchestra.shevtoneaudio.com. He is looking for feedback from developers, composers and people working in music technology.

## Objective

Launch ShevtoneAudio Orchestrator as the MIDI-in, MIDI-out orchestration assistant the author describes: it develops a composer's own MIDI into a full arrangement across sections, and hands back editable MIDI so the work continues in the DAW. The MVP is the working product at the $149 launch offer, with the demo at orchestra.shevtoneaudio.com as the proof.

## Target Users

- Composers who write MIDI and want orchestration developed across strings, brass, percussion and other sections without losing control.
- DAW users who refuse output they cannot edit; editable MIDI is the stated requirement.
- Music-technology developers evaluating AI assistance that augments rather than replaces the musician.

## MVP Scope

- MIDI input from the composer's own material.
- Analysis of harmony, melody, rhythm, dynamics, structure and orchestral density.
- Arrangement generation across strings, brass, percussion and other sections.
- Editable MIDI output that continues to work inside the DAW.
- Launch offer at $149.

## Constraints

- The composer's material is the input and the composer keeps control; replacing the musician is explicitly not the goal.
- Output must remain editable MIDI, not a rendered audio file.
- The $149 launch offer is the only stated price.
- Everything comes from the author's single Show HN post.

## Design Direction

See `DESIGN.md` for this project's design tokens.
