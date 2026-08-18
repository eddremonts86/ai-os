---
id: "262"
slug: immigrants-lack-an-ai-service-for-finding-familiar-and-
title: "Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/zlt9tnxv31-immigrants-lack-an-ai-service-for-findin"
category: other
date: "2026-01-03"
tags: [Immigration, AI, Other]
country: Serbia
---
# Immigrants lack an AI service for finding familiar and verified places (pharmacies, doctors, banks) in a new country, causing daily stress and time loss

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/262-immigrants-lack-an-ai-service-for-finding-familiar-and-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Build the place data model in PostgreSQL with Prisma (places, categories, languages, evidence tags, confirmations, Q&A threads) and the operator console for seeding 30–50 places per category in Belgrade with verified starter tags.
- [ ] Implement multilingual search (origin country, languages, category) with Meilisearch; results ranked by evidence-tag accumulation.
- [ ] Build the place profile page (evidence tags, languages spoken, accepted documentation types, contact) and the per-place community Q&A thread; replies in the immigrant's language.
- [ ] Wire Mapbox (or MapLibre + OpenStreetMap) for the place map with multilingual place-name rendering.
- [ ] Implement the "I was helped here" confirmation flow that updates the place's evidence tag with the origin country and the date.
- [ ] Add the second pilot city using the same operator-seed workflow after the first city is validated.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 262-immigrants-lack-an-ai-service-for-f MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Serbia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
