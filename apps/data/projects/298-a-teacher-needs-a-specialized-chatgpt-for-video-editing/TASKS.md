---
id: "298"
slug: a-teacher-needs-a-specialized-chatgpt-for-video-editing
title: A teacher needs a specialized «ChatGPT for video editing»
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/education/fhq9kxog51-a-teacher-needs-a-specialized-chatgpt-for-vid"
category: education
date: "2025-10-29"
tags: [Education, AI, Media]
country: USA
tech: [Python (FastAPI) backend, Next.js 14 frontend, Postgres + pgvector, OpenAI Assistants API, FFmpeg, Mux for hosted video playback, AWS S3]
---
# A teacher needs a specialized «ChatGPT for video editing»

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/a-teacher-needs-a-specialized-chatgpt-for-video-editing/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Video ingest: local upload, Google Drive picker, phone-camera roll.
- [ ] Chat editor: natural-language instructions translated into a deterministic edit plan.
- [ ] Trim/cut/concat via FFmpeg with explicit preview before commit.
- [ ] Captions (English) via Whisper with confidence-scored word-level accuracy.
- [ ] Voice-over via ElevenLabs or teacher's own recording.
- [ ] Title card + background music (royalty-free, school-safe catalogue).
- [ ] Three teacher templates: 5-minute lesson, parent update, lab demo.
- [ ] Re-edit flow: chat refines the plan, deterministic engine re-runs.
- [ ] Mux-hosted preview + 1080p download export.
- [ ] School plan: BAA-aligned, no retention beyond project close unless opted in.
- [ ] Pilot with 30 teachers; measure time-to-finished-video at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI) backend, Next.js 14 frontend, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 298-a-teacher-needs-a-specialized-chatg MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI) backend, Next.js 14 frontend, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
