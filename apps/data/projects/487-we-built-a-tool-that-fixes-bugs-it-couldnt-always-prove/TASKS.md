---
id: "487"
slug: we-built-a-tool-that-fixes-bugs-it-couldnt-always-prove
title: "We built a tool that fixes bugs. It couldn't always prove it."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1ve51dd/we_built_a_tool_that_fixes_bugs_it_couldnt_always/"
category: indiehackers
date: "2026-08-03"
tech: [TypeScript, Node.js (Fastify), Playwright, PostgreSQL, Redis, Docker, Hetzner]
---
# We built a tool that fixes bugs. It couldn't always prove it.

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/487-we-built-a-tool-that-fixes-bugs-it-couldnt-always-prove/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Bug ingestion
- [ ] Auto-repro generator
- [ ] Apply + verify loop
- [ ] Scorecard

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (TypeScript, Node.js (Fastify), Playwright) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 487-we-built-a-tool-that-fixes-bugs-it- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for TypeScript, Node.js (Fastify), Playwright errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
