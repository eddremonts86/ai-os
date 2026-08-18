---
id: "496"
slug: killgate-blueprint-a-6-agent-ai-operating-system-design
title: Killgate Blueprint - A 6-agent AI operating system designed to kill bad SaaS ideas before you waste months building them
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnztj5/killgate_blueprint_a_6agent_ai_operating_system/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Claude API, Anthropic API, PostgreSQL, Resend, Vercel]
---
# Killgate Blueprint - A 6-agent AI operating system designed to kill bad SaaS ideas before you waste months building them

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/496-killgate-blueprint-a-6-agent-ai-operating-system-design/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] 6-agent orchestration
- [ ] Evidence trail
- [ ] Independent Evaluator
- [ ] Verdict page

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (TypeScript, Claude API, Anthropic API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 496-killgate-blueprint-a-6-agent-ai-ope MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for TypeScript, Claude API, Anthropic API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
