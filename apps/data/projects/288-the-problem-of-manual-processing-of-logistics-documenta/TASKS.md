---
id: "288"
slug: the-problem-of-manual-processing-of-logistics-documenta
title: The problem of manual processing of logistics documentation and lack of unified
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/80bgjnm951-the-problem-of-manual-processing-of-logistics"
category: logistics
date: "2025-10-29"
tags: [Logistics, Business, Productivity]
country: Mexico
tech: [Python (FastAPI), Postgres + pgvector, OpenAI Vision API, Tesseract OCR (Spanish), Facturama SAT API, Cloudflare R2, Docker on Hetzner]
---
# The problem of manual processing of logistics documentation and lack of unified

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/the-problem-of-manual-processing-of-logistics-documenta/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Mobile-camera intake screen with capture-time guidance (lighting, angle, frame).
- [ ] Document classifier: carta porte (Traslado), pedimento, BOL — multi-class with confidence score.
- [ ] OCR pipeline: Vision API first; Tesseract Spanish fallback when Vision confidence is low.
- [ ] Field extractor: SAT folio numbers, RFC, fecha, transportista, mercancía descripción, valor, peso.
- [ ] Shipment-binding: vector similarity search over prior shipments to suggest the right one.
- [ ] SAT CFDI validation via Facturama; surface invalid/missing folio with a red badge.
- [ ] Searchable archive: full-text + filters by document type, date range, RFC, shipment ID.
- [ ] PDF export per shipment: bundled carta porte + pedimento + BOL with cover page for accountant.
- [ ] Operator console (Next.js): shipment list, document timeline, audit trail per shipment.
- [ ] Offline mobile intake: queue uploads, sync when network returns; conflict resolution by timestamp.
- [ ] Pilot onboarding kit: 5 brokers, 50 shipments each, week 12 review.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI), Postgres + pgvector, OpenAI Vision API) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 288-the-problem-of-manual-processing-of MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Mexico completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI), Postgres + pgvector, OpenAI Vision API errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
