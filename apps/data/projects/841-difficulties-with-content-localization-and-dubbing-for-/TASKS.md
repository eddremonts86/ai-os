---
id: "841"
slug: difficulties-with-content-localization-and-dubbing-for-
title: Difficulties with content localization and dubbing for TV channel
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: media
date: "2025-11-14"
tags: [Media, Other]
country: Jordan
tech: [Python (FastAPI), TypeScript (React for the editor UI), Whisper, Coqui XTTS / Piper, Postgres]
---
# Difficulties with content localization and dubbing for TV channel

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copy `edd-app-template` → `apps/841-difficulties-with-content-localization-and-dubbing-for-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Ingest video, run Whisper to get original-language transcript with timestamps
- [ ] Translate to Arabic via an LLM with structured time-coded output
- [ ] Build time-coded script editor UI
- [ ] Generate synthetic Arabic voiceover aligned to original timings

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
