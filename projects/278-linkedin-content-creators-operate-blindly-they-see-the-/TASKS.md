---
id: "278"
slug: linkedin-content-creators-operate-blindly-they-see-the-
title: "LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/media/ja0oyjzdd1-linkedin-content-creators-operate-blindl"
category: media
date: "2025-12-02"
tags: [Marketing, Other]
country: India
tech: [Next.js 14, TypeScript, PostgreSQL, LinkedIn API, OpenAI GPT-4o, Stripe, Resend]
---
# LinkedIn content creators operate blindly: they see the results but don't understand the reasons behind their posts' success or failure

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/278-linkedin-content-creators-operate-blindly-they-see-the-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Next.js dashboard with LinkedIn OAuth
- [ ] Postgres schema: creators, posts, analyses, playbooks
- [ ] Post-history import via LinkedIn API
- [ ] GPT-4o per-post classification (topic, hook, format, timing)
- [ ] Per-post "why this worked / didn't work" report
- [ ] Creator-playbook aggregation view
- [ ] Stripe paid tier
- [ ] Resend playbook delivery email

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 278-linkedin-content-creators-operate-b MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
