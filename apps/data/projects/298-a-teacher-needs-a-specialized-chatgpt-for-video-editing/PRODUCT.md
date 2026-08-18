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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A teacher with no editing skill produces a polished instructional video in under 15 minutes by chatting with the assistant, with the same quality they would have spent 3 hours producing in a non-linear editor.

## Target Users

| Stakeholder | Why they care |
|---|---|
| US K-12 teacher | Produces 2–5 short instructional videos a month; never opens a non-linear editor. |
| US community-college adjunct | Needs flipped-classroom videos on a tight schedule. |
| US corporate trainer / instructional designer | Wants the chat-driven workflow for rapid iteration on training videos. |

## Jobs To Be Done

1. **Functional job** — Turn raw footage into a finished instructional video with captions and a voice-over in under 15 minutes.
2. **Emotional job** — Stop dreading the 'editing weekend' that a flipped-classroom video currently demands.
3. **Social job** — Send a polished link to parents or students instead of an unedited phone-camera file.

## Success Metrics

- Time-to-finished-video median ≤ 15 minutes for a 5-minute lesson.
- Caption word-accuracy ≥ 95% on clear audio.
- Teacher NPS ≥ 50 at month 3.
- Re-edit rate ≤ 2 (median teacher re-edits the same project twice before export).

## Pricing & Monetization

Free tier: 5 videos/month, 5-minute max length, watermarked. Teacher Pro: $14/month (unlimited videos, no watermark, custom templates, captions in 8 languages). School plan: $399/month per school for unlimited teachers, district-level admin, FERPA-aligned data handling.

## Competitive Landscape

- CapCut — strong on mobile, no chat-driven editing, complex for first-time users.
- Descript — chat-driven transcript editing, but the chat is transcript-first, not footage-first.
- Canva video — template-driven, not chat-driven; quality ceiling low.

## Risks & Open Questions

- [ ] Editing accuracy on noisy classroom audio — Mitigation: explicit 're-record the voice-over' fallback when ASR confidence is low.
- [ ] FERPA / COPPA exposure on student footage — Mitigation: explicit consent flag, district plan with BAA, no retention of student footage beyond project close.
- [ ] School-blocked OpenAI access — Mitigation: explicit 'paste your school API key' option; on-prem model for the largest district customers.

---

_Source:_ [manual](https://problemhunt.pro/en/education/fhq9kxog51-a-teacher-needs-a-specialized-chatgpt-for-vid) · **Category:** education · **Tags:** Education, AI, Media
