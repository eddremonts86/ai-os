---
id: "439"
slug: the-build-step-is-easy-now-the-deploy-step-is-where-eve
title: "The build step is easy now, the deploy step is where every small tool dies"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0mio/the_build_step_is_easy_now_the_deploy_step_is/"
category: saas
date: "2026-08-14"
tech: [Vite, TypeScript, Node.js (Hono), Docker, Caddy, Hetzner, GitHub Actions]
---
# The build step is easy now, the deploy step is where every small tool dies

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/439-the-build-step-is-easy-now-the-deploy-step-is-where-eve/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] CLI binary skeleton
- [ ] Git URL → build → run flow for Node.js
- [ ] Caddy integration with auto-TLS
- [ ] systemd unit generation

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Vite, TypeScript, Node.js (Hono)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 439-the-build-step-is-easy-now-the-depl MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Vite, TypeScript, Node.js (Hono) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
