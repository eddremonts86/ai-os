---
id: "512"
slug: tocala-song-writers-companion-app
title: "toca.la - song writer's companion app"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnxwsj/tocala_song_writers_companion_app/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, Web Audio API, PostgreSQL, Stripe, Resend, Vercel]
---
# toca.la - song writer's companion app

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/512-tocala-song-writers-companion-app/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Lyric editor
- [ ] Audio attachments
- [ ] Project library
- [ ] Stripe paid tier

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, Web Audio API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 512-toca-la-song-writer-s-companion-app MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, Web Audio API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
