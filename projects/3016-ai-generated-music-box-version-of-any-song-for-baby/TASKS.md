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

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/3016-ai-generated-music-box-version-of-any-song-for-baby/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Reproduce the founder's BS-roformer + Basic Pitch pipeline on a single test track and capture the existing "drunk little music box" output as the baseline render.
- [ ] Wrap the stem-separation step behind a Python function that takes a path to a source audio file and returns a dict of stems (vocals, instrumental, mix) as temporary WAV files.
- [ ] Wire Basic Pitch to read the chosen stem and emit a MIDI file, with a fallback that surfaces a clear error if Basic Pitch returns fewer than N notes.
- [ ] Write a music-box renderer that loads the MIDI, restricts notes to a 1.5-octave window, thins repeated notes, slows tempo into a 50-70 BPM range, and renders a pluck-style synth to WAV using soundfile + numpy.
- [ ] Expose a single FastAPI endpoint `/render` that accepts a multipart upload, runs the full pipeline, and returns the rendered WAV as an attachment response.
- [ ] Add a vanilla HTML upload form that posts to `/render` and surfaces a download link on success.
- [ ] Add a stem picker (vocals / instrumental / mix) on the result page that re-runs the pipeline against the same upload without re-uploading.
- [ ] Handle common failure modes — unsupported file types, files above a 10-minute cap, and BS-roformer / Basic Pitch errors — with a clear user-facing message.
- [ ] Write a README with a one-command `make run` target and a note on the recommended GPU.
- [ ] Smoke-test the full flow end-to-end against three songs of different genres (acoustic, electronic, vocal-heavy) and capture sample outputs in the repo.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-18_
