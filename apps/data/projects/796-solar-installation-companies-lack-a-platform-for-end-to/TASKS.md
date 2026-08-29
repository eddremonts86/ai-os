---
id: "796"
slug: solar-installation-companies-lack-a-platform-for-end-to
title: "Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/ldt9cicmy1-solar-installation-companies-lack-a-plat"
category: business
date: "2026-01-10"
tags: [Business, Marketing, Other]
country: Brazil
tech: [Elixir, Phoenix LiveView, PostgreSQL, TimescaleDB extension, Oban (background jobs), S3-compatible object storage, CPF / CNPJ validation library, Pix / Brazilian payment integration, WhatsApp Business API, Coolify]
---
# Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/796-solar-installation-companies-lack-a-platform-for-end-to/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the project record, the stage machine, the stage-transition event log, and the per-project document vault in PostgreSQL with TimescaleDB on the event log.
- [ ] Build the operator console: project creation, stage transitions with owner field, file attachments, per-stage SLA timers (green / yellow / red).
- [ ] Build the customer-facing read-only tracking page per project: current stage, next stage, owner per stage, chronological timeline, visible documents.
- [ ] Wire WhatsApp Business API for stage-transition notifications, with delivery tracking and a configurable per-transition notification list.
- [ ] Build the document vault with the customer-visible vs inspector-only split, versioned files, and the documented retention sweep.
- [ ] Add the per-stage SLA surface: throughput dashboard, per-stage average dwell time, per-project stalling list.
- [ ] Add the published stage configuration the install company agrees to before going live, with stage names, transitions, and SLA targets explicit.
- [ ] Add the customer-facing dispute field and the documented escalation path for stage transitions the customer contests.
- [ ] Add tenant scoping at the database layer with row-level constraints so one install company's projects cannot leak into another's view.
- [ ] Add the CPF/CNPJ validation at customer onboarding as a starting input check.
- [ ] Add the optional Pix / payment-processor integration for the install company to populate a payment-status field on the project, without the platform handling the actual payment.
- [ ] Add the LGPD regulatory-confirmation milestone before launch with real customer data.
- [ ] Wire Brazilian-Portuguese copy throughout operator, customer, and admin surfaces; keep English out of scope at MVP.
- [ ] Run an end-to-end test: an install company onboards, a sale closes, a project moves through survey, design, equipment order, install, utility filing, inspection, and official approval, with every transition timestamped, every notification delivered, and every required document attached to the vault.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
