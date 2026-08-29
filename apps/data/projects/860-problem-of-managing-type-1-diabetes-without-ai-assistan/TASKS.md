---
id: "860"
slug: problem-of-managing-type-1-diabetes-without-ai-assistan
title: Problem of managing type 1 diabetes without AI assistance
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/45u31o0b41-problem-of-managing-type-1-diabetes-with"
category: health
date: "2025-10-30"
tags: [Health, Food, AI, Other]
country: Serbia
tech: [React Native (Expo), TypeScript, FastAPI (Python), PostgreSQL, TimescaleDB (optional time-series extension), DuckDB (on-device analytics), Apple HealthKit, Google Health Connect, Coolify, Docker]
---
# Problem of managing type 1 diabetes without AI assistance

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/860-problem-of-managing-type-1-diabetes-without-ai-assistan/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the React Native (Expo) mobile app with per-source consent for HealthKit and Health Connect
- [ ] Build the on-device encrypted store and the DuckDB analytics layer over the local data export
- [ ] Implement the personal observations surface with every observation traceable to the underlying data points and both disclaimers inline
- [ ] Build the shareable summary export (server-side or on-device) with both disclaimers in the header
- [ ] Wire the FastAPI backend over PostgreSQL + TimescaleDB for opt-in cloud sync, encrypted at rest, with a per-user data-deletion endpoint
- [ ] Build the operator regulatory-watch surface behind admin auth, tracking the Serbian medical-device framework, EU MDR SaMD classification and named regulator guidance, with a content-review trigger on any logged change
- [ ] Build the operator content-review surface behind admin auth listing every observation wording in production with a drift-toward-clinical-recommendation flag, review-pass required before any wording change ships
- [ ] Render the non-medical-device disclaimer on every screen of the app and on every export
- [ ] Render the non-dosing disclaimer on every observation card and on every export
- [ ] Add the request-id-tied audit log across imports, observation generations, exports and consent changes
- [ ] Define and document the GDPR-compliant retention policy, the cloud-sync encryption policy and the per-user data-deletion endpoint before any pilot user is onboarded

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
