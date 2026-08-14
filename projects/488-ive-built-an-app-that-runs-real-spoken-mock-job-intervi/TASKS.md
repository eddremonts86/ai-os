---
id: "488"
slug: ive-built-an-app-that-runs-real-spoken-mock-job-intervi
title: "I've built an app that runs real spoken mock job interviews with an AI — it researches the company first, then grills you for 30 minutes"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo0ipz/ive_built_an_app_that_runs_real_spoken_mock_job/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Next.js, OpenAI Realtime API, PostgreSQL, Stripe, Vercel]
---
# I've built an app that runs real spoken mock job interviews with an AI — it researches the company first, then grills you for 30 minutes

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/488-ive-built-an-app-that-runs-real-spoken-mock-job-intervi/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Realtime voice mock
- [ ] Scorecard
- [ ] Recording + transcript
- [ ] Stripe paid tier

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (TypeScript, Next.js, OpenAI Realtime API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 488-i-ve-built-an-app-that-runs-real-sp MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for TypeScript, Next.js, OpenAI Realtime API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
