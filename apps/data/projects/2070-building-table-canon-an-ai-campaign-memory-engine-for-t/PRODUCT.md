---
id: "2070"
slug: building-table-canon-an-ai-campaign-memory-engine-for-t
title: "Building Table Canon, an AI Campaign Memory Engine for TTRPGs"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49376991"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Building Table Canon, an AI Campaign Memory Engine for TTRPGs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN! I built Table Canon to solve a problem my playgroup kept running into: 3-4 hour tabletop gaming sessions leave behind massive audio recordings, but standard meeting note-takers treat every session as an isolated island, butcher fantasy terms, and don't know who is speaking.I wanted an engine that tracks long-term state across months of games, so I built a pipeline to extract entity updates, open quest hooks, and character promises across sessions.The Tech Stack:* Transcription: whisper-large-v3-turbo
* Diarization: pyannote for speaker embeddings & voice profile matching
Extraction & Memory: OpenAI API with Structured Outputs (JSON Schema enforcement for state updates)
* TTS & Audio Recaps: Kokoro / Chatterbox Turbo
Music Generation: ACE-Step-v1.5-XL-Turbo for rendering session summaries into lyrics/balladsA Few Engineering Lessons & Challenges:* State Delta Extraction vs. Context Explosions: Feeding 20 prior session transcripts into context windows quickly becomes cost-prohibitive and noisy. Instead of re-reading raw history, each session outputs an atomic state delta (updates to NPC dossiers, new locations, resolved promises) to a database. Keeping context bounded as campaigns stretch past session 30+ has been one of the trickiest architectural hurdles.
* Custom Pre-Lexicons: General STT models struggle with homebrew proper nouns (turning fantasy names into standard dictionary words). Injecting a pre-pass fantasy term dictionary into prompt context significantly improved first-pass spelling.
* VAD & Audio Chunking: Passing a 4-hour raw audio file directly to Pyannote/Whisper leads to memory leaks and process timeouts. Pre-processing with Voice Activity Detection (VAD) and deterministic chunking was necessary before touching the models.Current Limitations & Active Hard Problems:* Entity Alias Resolution: Matching entities across sessions when players use varying aliases or informal shorthand (e.g., matching "The Red Bishop" to "Arthur" or "that cult leader guy") without accidentally merging distinct NPCs. I address this, partially, but allowing the user to Edit aliases, merge or split entities after-the-fact.
* Quest & Hook Resolution Logic: Fine-tuning the LLM to reliably determine whether a promise, open mystery, or quest has actually been resolved versus remaining open or implicitly abandoned.I'd love feedback on how others are handling these sorts of issues - or any notes for folks who try it out! No initial login required with 6 hours of upload available to try.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49376991) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
