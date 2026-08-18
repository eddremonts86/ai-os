---
id: "503"
slug: difftrail-reconstruct-git-history-even-if-you-never-com
title: "DiffTrail: Reconstruct Git history even if you never committed it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnypso/difftrail_reconstruct_git_history_even_if_you/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Node.js (Fastify), Git, PostgreSQL, Resend, Vercel]
---
# DiffTrail: Reconstruct Git history even if you never committed it

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/503-difftrail-reconstruct-git-history-even-if-you-never-com/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] VS Code autosave reader
- [ ] Workspace state reader
- [ ] Diff reconstruction
- [ ] Optional commit

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (TypeScript, Node.js (Fastify), Git) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 503-difftrail-reconstruct-git-history-e MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for TypeScript, Node.js (Fastify), Git errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
