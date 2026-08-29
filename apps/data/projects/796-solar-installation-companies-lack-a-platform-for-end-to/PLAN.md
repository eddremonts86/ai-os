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

## Tech Stack

- **Elixir with Phoenix LiveView** for the operator console and the customer-facing tracking page, because the state-machine surface benefits from LiveView's server-rendered updates and the per-project timeline benefits from Elixir's process model.
- **PostgreSQL with the TimescaleDB extension** for the projects table and the stage-transition event log, so per-project and per-stage queries scan time ranges cheaply as the corpus grows.
- **Oban** for the background jobs (WhatsApp notification fanout, SLA-timer recomputation, document retention sweeps), because the platform is a long-lived state machine rather than a request-response shape.
- **S3-compatible object storage** for the document vault (survey reports, designs, install photos, utility filings, inspection certificates), versioned and retention-tagged so an inspector can replay the project record later.
- **CPF/CNPJ validation library** as a starting input check for the customer record, so the install company gets a validated tax-id at onboarding.
- **Pix integration (or a Brazilian payment-processor integration)** as an optional payment-status field the install company can populate, even though the platform does not handle the customer's payment.
- **WhatsApp Business API** as the customer-facing notification channel, since WhatsApp is the messaging surface Brazilian customers already use.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The platform has three surfaces — a customer-facing read-only tracking page, an operator console for the install company, and a project state machine — and one event log underneath. Every stage transition is an event with a timestamp, an owner, an attached file (where applicable), and a notification record. The event log is the source of truth for the customer-facing timeline; the project record is the source of truth for the current stage.

The operator console is the surface where the install company moves projects through the stages. Each stage has a published definition, an owner field, and an SLA target. Moving a project from one stage to the next writes a stage-transition event to the log, attaches any file the install company uploads, and triggers a WhatsApp notification to the customer on the configured transition list. The console surfaces per-project SLA timers (green, yellow, red) and per-stage throughput so the operations manager can spot stalling work.

The customer-facing tracking page is read-only and lives at a stable URL the install company shares with the customer at sale-close. The page shows the current stage, the next stage, the owner of each stage, a chronological timeline of transitions with timestamps, and the attached documents the install company chose to make visible. The page is intentionally minimal — the customer is not learning a new tool, they are opening a page and reading the timeline. WhatsApp notifications drive the active awareness; the page is for the customer who wants to look something up.

The document vault is keyed to the project and visible to the customer, the install company, and (where the install company permits) the inspector. Documents are stored with retention tags so the operator can run a documented retention sweep without losing the audit trail of a closed project. Files the install company marks sensitive can be hidden from the customer but remain visible to the inspector, since the inspector needs the full record to verify the install.

The stage machine is published as a configuration the install company agrees to before going live, with stage names, transitions and SLA targets stated explicitly. The configuration is the contract: a customer who reads "install scheduled" gets the same meaning on every install company using the platform. A change to the stage machine is a published event, not a silent edit.

The platform does not file the utility paperwork. The install company manages the filing; the platform records the filing event, attaches the filing receipt, and surfaces a stage for the inspector. The actual regulatory submission is the install company's responsibility and stays on the upstream system they already use.

## Milestones

1. **M1 — Stage machine and project model** — the published stage definition, the project record, the stage-transition event log.
2. **M2 — Operator console** — project creation, stage transitions, owner field, file attachments, per-stage SLA timers.
3. **M3 — Customer-facing tracking page** — read-only page per project, current stage, next stage, chronological timeline, visible documents.
4. **M4 — WhatsApp Business API** — stage-transition notifications, configurable per transition, delivery tracking.
5. **M5 — Document vault** — per-project files, customer-visible vs inspector-only split, retention policy.
6. **M6 — Per-stage SLA surface** — green/yellow/red timers, per-stage throughput, operations-manager dashboard.
7. **M7 — LGPD confirmation** — sign-off on Brazilian data-protection rules before launch with real customer data.

## Risks

- **Stage-machine drift** — the install company edits stages ad-hoc and the customer-facing timeline stops being meaningful. Mitigation: published stage configuration, change events, and a customer-visible "what changed" note when stages are added.
- **WhatsApp delivery failure** — a notification fails to deliver and the customer thinks nothing has changed. Mitigation: delivery tracking per transition, with the operator console surfacing undelivered notifications for retry.
- **Document privacy leak** — a sensitive document is shown to the customer who should not see it. Mitigation: customer-visible flag is per-document and validated server-side, not a CSS toggle.
- **SLA timer gaming** — the install company moves the project to the next stage to reset the timer without doing the work. Mitigation: SLA timers are on the actual work stages (survey, install, utility filing) rather than administrative stages, and the operations-manager dashboard surfaces the move-pattern.
- **LGPD regulatory gate** — Brazilian data-protection rules can block the launch. Mitigation: regulatory review is its own milestone before live customer data, not a launch-day scramble.
- **Customer dispute on stage transition** — the customer disputes the install company marking the install complete. Mitigation: documented escalation path with a customer-facing dispute field and a re-inspection loop.
- **Multi-tenant data isolation** — one install company's projects leak into another's view. Mitigation: tenant scoping enforced at the database layer with row-level constraints, not in application code.
