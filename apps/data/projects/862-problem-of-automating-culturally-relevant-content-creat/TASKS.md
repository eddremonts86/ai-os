---
id: "862"
slug: problem-of-automating-culturally-relevant-content-creat
title: Problem of automating culturally relevant content creation
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/pxet2490m1-problem-of-automating-culturally-relevan"
category: media
date: "2025-10-30"
tags: [Media, Marketing, AI, Business, Other]
country: Jamaica
tech: [Node.js, Hono, Bun, SQLite (better-sqlite3), FFmpeg, Whisper, Llama 3.1]
---
# Problem of automating culturally relevant content creation

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/862-problem-of-automating-culturally-relevant-content-creat/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Hono-on-Bun API and the SQLite schema for briefs, outputs, edit history and the reference library
- [ ] Build the brief form with topic, audience, register, format, length and named-reference fields
- [ ] Wire the Llama 3.1 generation path in Standard Jamaican English and Patois with the confidence indicator per paragraph
- [ ] Seed the reference library with Jamaican places, festivals and idioms and enforce the included-set constraint in the prompt
- [ ] Build the side-by-side editor with brief, generated text, edit history and the export gate that requires a saved review
- [ ] Implement the audio pipeline with TTS in both registers and FFmpeg normalisation
- [ ] Add the Whisper re-transcription match check before audio export
- [ ] Stand up the voice-library consent schema and seed a small initial roster of consenting Jamaican speakers
- [ ] Add the consent-state read at audio render time so an expired consent blocks the render
- [ ] Implement the per-account brief history search and the style-seed flow for new briefs
- [ ] Add the Patois TTS fine-tune dataset and route the audio pipeline through it as the default
- [ ] Write the unit tests for the register classifier and the integration tests for the export gate

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
