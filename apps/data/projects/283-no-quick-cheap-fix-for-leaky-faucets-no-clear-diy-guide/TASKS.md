---
id: "283"
slug: no-quick-cheap-fix-for-leaky-faucets-no-clear-diy-guide
title: "No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/e59sb30221-no-quick-cheap-fix-for-leaky-faucets-no"
category: other
date: "2025-12-01"
tags: [Other]
country: India
tech: [Flutter mobile app, Dart, SQLite offline cache, Firebase Auth, WhatsApp Business API, Razorpay]
---
# No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/no-quick-cheap-fix-for-leaky-faucets-no-clear-diy-guide/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Symptom chooser screen with 4 options, each with a 5-second silent video clip and a 'what this looks like' still.
- [ ] Decision tree engine in Dart that maps (symptom, tap model, part availability) → recommended part list.
- [ ] Parts catalogue admin (Fastify + Postgres) — load and edit top 50 SKUs with image, MRP, retailer links.
- [ ] DIY checklist screen — per step: photo, 15-second timer, 'mark complete', 'I have a problem here' button.
- [ ] Photo checkpoint capture and storage (Firebase Storage) for after-action log.
- [ ] Plumber onboarding — KYC photo upload, work-sample photo upload, service pin-code, self-set availability windows.
- [ ] Plumber booking flow — slot picker → quote review → Razorpay ₹99 hold → WhatsApp notify.
- [ ] Job lifecycle states: requested → accepted → en route → arrived → in progress → completed → released.
- [ ] In-app chat (text + photo only) between household and assigned plumber during the active job.
- [ ] Rating screen post-job (1–5 stars + free-text) for both sides; affects future matching weight.
- [ ] End-to-end pilot in Bengaluru: 20 households, 10 plumbers, 100 completed jobs, median time-to-fix measured.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Flutter mobile app, Dart, SQLite offline cache) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 283-no-quick-cheap-fix-for-leaky-faucet MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Flutter mobile app, Dart, SQLite offline cache errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
