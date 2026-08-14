---
id: "243"
slug: searching-for-direct-hotel-contacts-to-book-without-ove
title: "Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/travel/kymbn6kp61-searching-for-direct-hotel-contacts-to-b"
category: travel
date: "2026-01-19"
tags: [Business, Other]
country: UK
tech: [Next.js 14, TypeScript, PostgreSQL, Playwright (Python), Stripe, SendGrid, Redis]
---
# Searching for direct hotel contacts to book without overpaying to aggregators, which markup prices by 15-30%

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/243-searching-for-direct-hotel-contacts-to-book-without-ove/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Postgres schema: properties, direct_contacts, markup_estimates, verifications
- [ ] Seed UK hotel contact database (top 200)
- [ ] Chrome and Firefox browser extension
- [ ] Aggregator-page detector (Booking.com, Expedia)
- [ ] Playwright verification pipeline for direct contacts
- [ ] Markup estimator (15-30% range with per-property confidence)
- [ ] Next.js admin for manual contact verification
- [ ] SendGrid transactional emails for verification requests

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 243-searching-for-direct-hotel-contacts MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in UK completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
