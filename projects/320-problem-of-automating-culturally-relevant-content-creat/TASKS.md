---
id: "320"
slug: problem-of-automating-culturally-relevant-content-creat
title: Problem of automating culturally relevant content creation
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/media/2lqksf9vw1-problem-of-automating-culturally-relevant-cont"
category: media
date: "2025-10-29"
tags: [Media, AI, Marketing, Other]
country: Jamaica
tech: [Next.js 14, TypeScript, Postgres + pgvector, OpenAI API, ElevenLabs voice, Mux, Canva Connect API]
---
# Problem of automating culturally relevant content creation

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/problem-of-automating-culturally-relevant-content-creat/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Brand voice profile: tone, Patois register, palette, motifs, do-not-use list.
- [ ] Cultural-tone prompt set: Jamaican English + Patois with explicit anti-stereotype guardrails.
- [ ] Copy generation templates: social post, short-video script, tourism copy, product description.
- [ ] Visual generation via Canva Connect with Caribbean-tuned palettes and motifs.
- [ ] Short-video generation with ElevenLabs Jamaican voices (consent per voice).
- [ ] Cultural-advisor review queue for high-risk content (flagged by prompt risk score).
- [ ] Calendar scheduling via Meta Graph API + TikTok API + YouTube Data API.
- [ ] Creator review flow: every post reviewed by the creator before scheduling.
- [ ] Engagement-rate dashboard: per-post metrics with prior-baseline delta.
- [ ] Brand Pro tier: multi-creator roster + custom brand voice + Patois opt-in.
- [ ] Pilot with 20 Jamaican creators + 5 brands; measure time-to-calendar and engagement delta at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 320-problem-of-automating-culturally-re MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Jamaica completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
