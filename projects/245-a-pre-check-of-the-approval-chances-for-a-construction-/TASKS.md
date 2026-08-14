---
id: "245"
slug: a-pre-check-of-the-approval-chances-for-a-construction-
title: A pre-check of the approval chances for a construction project with the Australian council before making significant investments
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/realty/38t2m50py1-a-pre-check-of-the-approval-chances-for"
category: realty
date: "2026-01-18"
tags: [Business, Other]
country: Australia
tech: [Next.js 14, TypeScript, PostgreSQL, Python PDF parsers, Stripe, S3-compatible storage, SendGrid]
---
# A pre-check of the approval chances for a construction project with the Australian council before making significant investments

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/245-a-pre-check-of-the-approval-chances-for-a-construction-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Next.js intake form (address, project type, description)
- [ ] Postgres schema: properties, councils, planning_schemes, decisions, reports
- [ ] Stripe one-time payment per report
- [ ] Python ETL for top 5 Australian councils (planning scheme + decisions)
- [ ] Report-generation pipeline (LLM-assisted summary of council constraints)
- [ ] Structured PDF report template (probability estimate, risks, next steps)
- [ ] Next.js report viewer with disclaimer
- [ ] SendGrid report delivery and 90-day feedback survey

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, PostgreSQL) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 245-a-pre-check-of-the-approval-chances MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Australia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, PostgreSQL errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
