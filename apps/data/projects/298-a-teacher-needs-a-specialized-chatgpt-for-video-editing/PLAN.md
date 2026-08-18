---
id: "298"
slug: a-teacher-needs-a-specialized-chatgpt-for-video-editing
title: A teacher needs a specialized «ChatGPT for video editing»
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/fhq9kxog51-a-teacher-needs-a-specialized-chatgpt-for-vid"
category: education
date: "2025-10-29"
tags: [Education, AI, Media]
country: USA
tech: [Python (FastAPI) backend, Next.js 14 frontend, Postgres + pgvector, OpenAI Assistants API, FFmpeg, Mux for hosted video playback, AWS S3]
---
# A teacher needs a specialized «ChatGPT for video editing»

## Tech Stack

- Python (FastAPI) for the edit orchestration and AI pipeline.
- Next.js 14 (App Router) for the chat editor UI.
- Postgres + pgvector for project state, template metadata, semantic recall of past edits.
- OpenAI Assistants API for the chat editor with a teacher-tuned prompt set.
- FFmpeg for trim/cut/concat; ElevenLabs for voice-over; Whisper for ASR/captions.
- Mux for hosted video preview + download.
- AWS S3 for raw footage storage.

## Architecture

Next.js chat editor sends the teacher's natural-language instructions to a FastAPI service that translates them into a deterministic edit plan (trim ranges, caption placement, voice-over slots, music bed). FFmpeg runs the edits; Mux hosts the result. The chat thread is the only editing surface; the teacher sees a preview after each edit and can refine. Templates are pre-built edit plans that the chat composer invokes.

## Milestones

1. **M0** — Spec freeze, single-template MVP ('5-minute lesson'), chat → edit plan. End of week 1.
2. **M1** — Video ingest (local + Google Drive) + trim/cut/concat via FFmpeg. End of week 4.
3. **M2** — Captions (English) + voice-over (ElevenLabs). End of week 7.
4. **M3** — Three teacher templates + re-edit flow. End of week 10.
5. **M4** — Spanish captions + school plan with FERPA-aligned data handling. End of week 14.

## Risks

- **Editing quality variance** — Mitigation: deterministic edit plan with explicit review step; chat only refines, never re-invents the plan.
- **Caption accuracy on classroom audio** — Mitigation: confidence-scored captions; manual edit step before export.
- **FERPA / COPPA** — Mitigation: explicit consent flag; district plan with BAA; no retention beyond project close unless teacher opts in.
