---
id: "485"
slug: i-couldnt-find-a-writing-tool-that-didnt-sound-ai-gener
title: "I couldn't find a writing tool that didn't sound AI-generated for GTM work, so I built my own and dogfooded it for 2 months"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vej4p9/i_couldnt_find_a_writing_tool_that_didnt_sound/"
category: indiehackers
date: "2026-08-03"
tech: [Next.js, TypeScript, Anthropic API, PostgreSQL, Stripe, Resend, Vercel]
---
# I couldn't find a writing tool that didn't sound AI-generated for GTM work, so I built my own and dogfooded it for 2 months

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/485-i-couldnt-find-a-writing-tool-that-didnt-sound-ai-gener/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Brief intake
- [ ] Draft + rubric
- [ ] Editor highlighting
- [ ] Stripe paid tier

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, Anthropic API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 485-i-couldn-t-find-a-writing-tool-that MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, Anthropic API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
