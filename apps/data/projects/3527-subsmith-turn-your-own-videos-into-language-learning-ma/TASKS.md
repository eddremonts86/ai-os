---
id: "3527"
slug: subsmith-turn-your-own-videos-into-language-learning-ma
title: SubSmith – Turn your own videos into language-learning material
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49476894"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Offline-first desktop app, local speech-to-text transcription (whisper.cpp or equivalent), Anki export (.apkg), local media playback]
---

# SubSmith – Turn your own videos into language-learning material

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3527-subsmith-turn-your-own-videos-into-language-learning-ma/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the offline-first desktop shell with a local SQLite store and a media drop target
- [ ] Wire local media playback with timestamp-anchored transcript alignment
- [ ] Integrate local speech-to-text (whisper.cpp or equivalent) so media never leaves the machine
- [ ] Build the transcript workspace: word and sentence lookup, line replay, transcript editing
- [ ] Implement sentence saving that preserves the original audio clip and surrounding context on every card
- [ ] Bundle a local or built-in dictionary for word and sentence lookup
- [ ] Build .apkg Anki export that round-trips audio and context into a real Anki deck
- [ ] Add the account-required free trial as it stands today, plus funnel instrumentation to measure account-before-trial drop-off
- [ ] Surface the author's six open questions inside the app and collect feedback responses

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_