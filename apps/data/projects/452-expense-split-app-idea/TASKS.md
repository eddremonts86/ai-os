---
id: "452"
slug: expense-split-app-idea
title: Expense split app idea
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnxl6p/expense_split_app_idea/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, Node.js (Hono), PostgreSQL, Stripe Connect, Resend, Vercel]
---
# Expense split app idea

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/452-expense-split-app-idea/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Club + member setup
- [ ] Stripe Connect integration
- [ ] RSVP-gating engine
- [ ] Reminder emails

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, TypeScript, Node.js (Hono)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 452-expense-split-app-idea MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in the country stated in the source completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, TypeScript, Node.js (Hono) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
