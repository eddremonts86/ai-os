---
id: "285"
slug: the-problem-of-multi-platform-kyckyb-processes-in-finte
title: The problem of multi-platform KYC/KYB processes in fintech leading to specialist
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/bqzh0d2au1-the-problem-of-multi-platform-kyckyb-processes-i"
category: ai
date: "2025-10-29"
tags: [AI, Finance, Business, Legal]
country: France
tech: [NestJS API, TypeScript, Postgres, MinIO (S3-compatible), Onfido SDK, Stripe Connect, FranceConnect (OAuth), Docker on Scaleway]
---
# The problem of multi-platform KYC/KYB processes in fintech leading to specialist

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/the-problem-of-multi-platform-kyckyb-processes-in-finte/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Master KYB schema in Postgres: legal entity, UBO graph, documents, partner-connector status.
- [ ] Onboarding wizard (Next.js) for the legal representative: company info, KBIS upload, UBO declarations.
- [ ] FranceConnect OAuth flow with mock-mode fallback for development.
- [ ] Onfido integration: per-UBO identity check with webhook reconciliation.
- [ ] Document storage service (MinIO) with encryption-at-rest and per-partner retention rules.
- [ ] Stripe Connect adapter: build account.individual + account.company payloads from master KYB graph.
- [ ] Powens adapter: customer onboarding v2 translation.
- [ ] Treezor adapter: KYB profile translation.
- [ ] Partner webhook receiver: account.updated, customer.updated → master graph update.
- [ ] GDPR right-to-erasure job: nightly reconcile against partner data-export APIs.
- [ ] Status dashboard for the entity owner: which partners they are live with, what is pending, what is missing.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (NestJS API, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 285-the-problem-of-multi-platform-kyc-k MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in France completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for NestJS API, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
