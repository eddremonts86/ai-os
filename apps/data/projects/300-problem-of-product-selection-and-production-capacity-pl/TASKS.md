---
id: "300"
slug: problem-of-product-selection-and-production-capacity-pl
title: Problem of product selection and production capacity planning
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/cbc7zd9891-problem-of-product-selection-and-product"
category: business
date: "2025-11-13"
tags: [Business, Manufacturing, Other]
country: India
tech: [Python (FastAPI), Next.js 14, Postgres + TimescaleDB, Prophet forecasting, WhatsApp Business API, Razorpay]
---
# Problem of product selection and production capacity planning

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/problem-of-product-selection-and-production-capacity-pl/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Order history ingest: CSV upload, WhatsApp forwards (LLM-parsed), Tally/Zoho export.
- [ ] Demand forecasting per SKU via Prophet with Indian-festival calibration (Diwali, Eid, Holi, wedding season).
- [ ] Capacity-constraint solver: machine-hours and labour allocation across SKUs.
- [ ] Weekly recommendation generation: per SKU, 'produce this much, confidence X, because Y'.
- [ ] WhatsApp Business API template for weekly digest; opt-in/opt-out; opt-out keyword handling.
- [ ] Operator console: weekly review UI, override flow, what-if scenario.
- [ ] Per-plant onboarding wizard: machine-hours, labour, SKUs, seasonality.
- [ ] Tally / Zoho Books integration for Plant tier customers.
- [ ] Industry-association priors: bootstrap for new plants with no order history.
- [ ] Hindi + English UI in operator console.
- [ ] Pilot with 20 plants; measure inventory write-down and stockout deltas at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI), Next.js 14, Postgres + TimescaleDB) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 300-problem-of-product-selection-and-pr MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI), Next.js 14, Postgres + TimescaleDB errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
