---
id: "318"
slug: problem-of-managing-type-1-diabetes-without-ai-assistan
title: Problem of managing type 1 diabetes without AI assistance
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/bx6kjqfm21-problem-of-managing-type-1-diabetes-without-ai"
category: health
date: "2025-10-29"
tags: [Health, AI, Other]
country: Serbia
tech: [Next.js 14 (mobile-web), Python (FastAPI) backend, Postgres + TimescaleDB, OpenAI API, Dexcom / Libre CGM adapters, Apple Health / Google Fit, Hetzner (EU)]
---
# Problem of managing type 1 diabetes without AI assistance

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/problem-of-managing-type-1-diabetes-without-ai-assistan/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Dexcom CGM ingest via Dexcom API; Libre 2/3 via Abbott API.
- [ ] Meal logging via photo + natural-language ('two slices of bread and cheese').
- [ ] Insulin dose logging (pump or MDI).
- [ ] Activity ingest via Apple Health / Google Fit.
- [ ] Pattern detection pipeline: time-of-day trends, post-meal spikes, nocturnal lows.
- [ ] Daily brief in Serbian + English with explicit 'educational, not medical advice' disclaimer.
- [ ] Real-time alert when glucose trajectory suggests hypo/hyper within 30 minutes.
- [ ] Endocrinologist view: structured pattern summary exportable as PDF.
- [ ] Parent view for T1 children: real-time hypo alerts overnight.
- [ ] GDPR flows: EU data residency, per-user export, right-to-erasure.
- [ ] Pilot with 100 Serbian T1 patients + 5 endocrinologists; measure TIR delta at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14 (mobile-web), Python (FastAPI) backend, Postgres + TimescaleDB) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 318-problem-of-managing-type-1-diabetes MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Serbia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14 (mobile-web), Python (FastAPI) backend, Postgres + TimescaleDB errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
