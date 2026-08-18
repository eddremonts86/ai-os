---
id: "322"
slug: problem-of-finding-and-obtaining-grants-for-small-busin
title: Problem of finding and obtaining grants for small businesses
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/gkrcgpelx1-problem-of-finding-and-obtaining-grants"
category: finance
date: "2025-10-29"
tags: [Finance, Business, Legal, Other]
country: Canada
tech: [Next.js 14, TypeScript, Postgres + pgvector, OpenAI API, Canada.ca grants API (where available), Stripe, Hetzner (Canada region)]
---
# Problem of finding and obtaining grants for small businesses

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/problem-of-finding-and-obtaining-grants-for-small-busin/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Business profile intake: legal entity, province, NAICS, employee count, prior funding.
- [ ] Federal-grants database: Canada.ca programs with eligibility rules.
- [ ] Provincial coverage: ON, BC, AB, QC; municipal pilots in 3 cities.
- [ ] Foundation grants: top 50 private Canadian foundations.
- [ ] Matching engine: per-grant eligibility rules vs business profile.
- [ ] Application drafting via OpenAI with per-funder templates.
- [ ] Per-funder template library maintained by grant writer on retainer.
- [ ] Submission tracker: drafted → submitted → awarded/declined with follow-up cadence.
- [ ] Quebec French-language template + native-speaker review.
- [ ] Concierge tier with human grant writer review per application.
- [ ] Pilot with 100 SMBs across 5 provinces; measure submission and award rate at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 322-problem-of-finding-and-obtaining-gr MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Canada completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
