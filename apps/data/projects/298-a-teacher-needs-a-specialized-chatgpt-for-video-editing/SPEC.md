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

## Problem

A US teacher wants to produce short instructional videos — for flipped classrooms, parent updates, asynchronous lessons — but lacks video editing skills and finds existing tools (Premiere, Final Cut, CapCut) either too complex or too shallow. The title asks for a specialised 'ChatGPT for video editing' — a chat-style interface that takes a teacher's rough footage and instructions and produces a finished video with cuts, captions, and a teacher's voice-over, without the teacher learning a non-linear editor.

## Objective

Ship a chat-driven video-editing product that takes a teacher's footage (uploaded from phone or cloud) plus a natural-language instruction ('cut to 3 minutes, add captions in English, narrate over the slides') and returns a finished video. Outcome: a teacher with no editing skill produces a polished instructional video in under 15 minutes.

## Target Users

US K-12 and community-college teachers (and adjunct faculty) who routinely create short instructional videos for flipped classrooms, parent updates, or asynchronous lessons. Adults 28–65, comfortable with chat interfaces, often working from a school-issued laptop or phone. Secondary: corporate trainers and instructional designers who want the same chat-driven workflow.

## MVP Scope

Video ingest: upload from local, Google Drive, or phone-camera roll. Natural-language editor: chat thread where the teacher describes the desired edit (length, captions, voice-over, music, title card). Editing primitives: trim, cut, captions (English + Spanish), title card, background music, voice-over (ElevenLabs or teacher's own recording). Mux-hosted preview + download. Project save and re-edit. Teacher-friendly templates: '5-minute lesson', 'parent update', 'lab demo'.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/education/fhq9kxog51-a-teacher-needs-a-specialized-ch` follows the constraints in `298-.../SPEC.md` and the chosen stack (Python (FastAPI) backend, Next.js 14 frontend, Postgres + pgvector). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must work on a school-issued laptop (Chromebook compatible) and on a phone. No professional NLE (no multi-track timeline) in v1; chat is the only editing surface. All exports at 1080p max in v1 (4K deferred). Caption accuracy: ≥ 95% word-level accuracy on clear audio, with an explicit edit step for the teacher. COPPA / FERPA awareness: if the teacher uploads student footage, an explicit consent flag is required before processing.
