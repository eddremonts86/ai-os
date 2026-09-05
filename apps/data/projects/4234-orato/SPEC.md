---
id: "4234"
slug: orato
title: Orato
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/orato-speech-coach"
category: product-launch
date: "2026-08-29"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Orato

## Problem

Practising speaking is high-friction: pick a drill, speak for 30 to 90 seconds, and get scored on pacing, fluency, vocabulary, and coherence. Most drills hide the failure modes the speaker needs to see — every filler and long pause should land on a transcript the speaker can read back, with the metric the speaker is trying to improve surfaced alongside the transcript, not buried in a black-box score. On an iPhone with Apple Intelligence, Orato runs the drill on the device, so the speaker's audio never leaves the phone.

The source is the ProductHunt page for Orato by Petros Tepoyan. The launch tags are Productivity, Education, Artificial Intelligence. The product is free, with the speaker picking a drill and getting scored on pacing, fluency, vocabulary, and coherence. The transcript surfaces every filler and long pause. Day rank is #8 with 146 points.

The source names the actor (a speaker who wants to practise speaking with drills that surface pacing, fluency, vocabulary, and coherence failures), the pain (most drills hide the failure modes; the speaker cannot see the fillers and long pauses), and the missing thing (a drill app that scores the four axes and surfaces every filler / long pause on a transcript the speaker can read back, running on the device with no account). It does not name a specific drill set, a specific AI model, or a specific commercial offering beyond the free launch.

## Objective

Build the Orato iPhone app: pick a drill, speak for 30 to 90 seconds, get scored on pacing, fluency, vocabulary, and coherence, with every filler and long pause surfaced on a transcript the speaker can read back; runs on the device on iPhone with Apple Intelligence, with no account.

## Target Users

- Speakers who want to practise speaking with drills that score pacing, fluency, vocabulary, and coherence.
- Speakers who want to see every filler and long pause on a transcript they can read back, not a black-box score.
- iPhone users with Apple Intelligence who want the drill to run on the device, with no account, so the audio never leaves the phone.
- Speakers preparing for a specific talk, interview, or presentation who want a focused drill surface.
- Educators and coaches who want to recommend a speaking drill app to students without an account requirement.

## MVP Scope

- An iPhone app, Orato, free on the App Store, by Petros Tepoyan.
- Drill picker: the speaker picks a drill, speaks for 30 to 90 seconds.
- Per-drill scoring on pacing, fluency, vocabulary, and coherence.
- A transcript the speaker can read back, with every filler and long pause surfaced on the transcript.
- On-device inference on iPhone with Apple Intelligence, so the speaker's audio never leaves the phone.
- No account.
- The launch tags Productivity, Education, Artificial Intelligence.
- The four-score axes (pacing, fluency, vocabulary, coherence) the source names explicitly.
- The filler-and-pause surface the source names explicitly.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The four scoring axes are pacing, fluency, vocabulary, and coherence. The plan does not invent a fifth axis the source does not name.
- The transcript surfaces every filler and long pause. The plan does not invent a different transcript surface.
- The drill duration is 30 to 90 seconds. The plan does not invent a longer drill.
- The app runs on the device on iPhone with Apple Intelligence, so the audio never leaves the phone. A drill that uploads the audio is an on-device guarantee breach.
- No account. The speaker picks a drill and speaks without creating an account.
- The app is free at launch. The plan does not invent a subscription, a per-drill price, or a paid tier.
- The launch tags are Productivity, Education, Artificial Intelligence. The plan does not invent a tag.
- iPhone is the supported form factor. The plan does not invent an Android or a web surface.
