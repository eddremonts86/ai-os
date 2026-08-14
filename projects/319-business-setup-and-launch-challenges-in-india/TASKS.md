---
id: "319"
slug: business-setup-and-launch-challenges-in-india
title: Business setup and launch challenges in India
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/xnzvy42z31-business-setup-and-launch-challenges-in-indi"
category: ai
date: "2025-10-29"
tags: [Business, Legal, Finance, Other]
country: India
tech: [Next.js 14, TypeScript, Postgres, Zoho / Tally integration, MCA21 (Ministry of Corporate Affairs) API, GSTN API, Razorpay, Hetzner]
---
# Business setup and launch challenges in India

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/business-setup-and-launch-challenges-in-india/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Eligibility quiz: Pvt Ltd vs LLP vs OPC vs Proprietorship.
- [ ] Document checklist per entity type via DigiLocker (Aadhaar + PAN + address proof).
- [ ] MCA filing: SPICe+ (Pvt Ltd) / RUN-LLP (LLP) via partner CA.
- [ ] PAN + TAN application.
- [ ] Current account opening with IndusInd + HDFC partner APIs (parallel-track).
- [ ] GST registration via GSTN.
- [ ] Udyam registration if MSME.
- [ ] EPFO + ESIC registration if hiring.
- [ ] Founder agreement + ESOP setup (Premium tier).
- [ ] Founder dashboard with every step's status, ETA, and document store.
- [ ] Pilot with 100 founders across tier-1/tier-2 cities; measure time-to-CIN and savings at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 319-business-setup-and-launch-challenge MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
