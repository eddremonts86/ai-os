---
id: "315"
slug: lack-of-a-unified-hub-for-tasks-from-different-services
title: Lack of a unified hub for tasks from different services
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/3bwf3l7wh1-lack-of-a-unified-hub-for-tasks-from-differen"
category: productivity
date: "2025-10-29"
tags: [Productivity, Communication, Other]
country: Serbia
tech: [Next.js 14, TypeScript, Postgres, OAuth integrations (Google, Microsoft, Slack, Linear, GitHub, Jira, Trello), Stripe, Hetzner]
---
# Lack of a unified hub for tasks from different services

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/lack-of-a-unified-hub-for-tasks-from-different-services/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] OAuth integrations: Gmail, Outlook, Slack, Linear, Jira, Trello, Notion, GitHub.
- [ ] Per-source task extractor: emails with to-do labels, Slack mentions/DMs, Linear/Jira/Trello assigned issues, Notion tasks, GitHub PR reviews.
- [ ] Priority engine with per-user rule editor: source weights, time-of-day rules, snooze.
- [ ] Daily digest: email + push notification; configurable send time per user.
- [ ] Web app + mobile web: 'today' list, source filter, override, snooze, link back to source.
- [ ] Team-wide 'today' view for team tier; admin dashboard for shared priority rules.
- [ ] Background worker: per-user polling schedule, exponential backoff on API errors.
- [ ] GDPR flows: per-integration disconnect, data export, right-to-erasure.
- [ ] Serbian + English UI; EUR pricing with Stripe EU.
- [ ] Pilot with 50 users + 10 agencies; measure time-to-next-action and app-open delta at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 315-lack-of-a-unified-hub-for-tasks-fro MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Serbia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
