---
id: "241"
slug: automating-cross-posting-of-an-indie-hackers-technical-
title: "Automating cross-posting of an indie hacker's technical content across multiple platforms (Twitter, LinkedIn, Product Hunt) while adhering to each platform's best practices"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/media/3i2dy4ryd1-automating-cross-posting-of-an-indie-hac"
category: media
date: "2026-01-20"
tags: [Marketing, Other]
country: Morocco
tech: [Next.js 14, TypeScript, PostgreSQL, BullMQ + Redis, Twitter API v2, LinkedIn API, Product Hunt API, OpenAI GPT-4o-mini]
---
# Automating cross-posting of an indie hacker's technical content across multiple platforms (Twitter, LinkedIn, Product Hunt) while adhering to each platform's best practices

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/241-automating-cross-posting-of-an-indie-hackers-technical-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Postgres schema: drafts, variants, schedules, engagements
- [ ] Draft editor with canonical markdown
- [ ] GPT-4o-mini variant generation per platform
- [ ] BullMQ queues per platform with rate-limit awareness
- [ ] Twitter / X connector with approval gate
- [ ] LinkedIn connector with approval gate
- [ ] Product Hunt connector with approval gate
- [ ] Engagement pull-back cron and canonical-post metrics view

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 241-automating-cross-posting-of-an-indi MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Morocco completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
