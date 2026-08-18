---
id: "252"
slug: startups-at-the-monetization-validation-stage-have-nowh
title: Startups at the monetization validation stage have nowhere to quickly start accepting payments without company registration to test demand for their MVP.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/startups/elj91ej9k1-startups-at-the-monetization-validation"
category: startups
date: "2026-01-10"
tags: [Startups, Legal, Finance, Business, Other]
country: Morocco
---
# Startups at the monetization validation stage have nowhere to quickly start accepting payments without company registration to test demand for their MVP.

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/252-startups-at-the-monetization-validation-stage-have-nowh/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Build the founder dashboard: sign-up, KYC-light (name, ID, contact), payment-page creation, transaction list.
- [ ] Integrate a licensed Moroccan payment processor that handles PCI scope; do not store raw card data.
- [ ] Build the public payment page with hosted-card-fields and an unmissable merchant-of-record disclosure in French and Arabic.
- [ ] Add founder-triggered refunds from the dashboard; record refund events against the original transaction.
- [ ] Build the held-funds ledger with per-founder balance view and incorporation reminders at 60 / 90 / 120 days.
- [ ] Implement bridge closure: founder supplies a Moroccan business bank account; held funds transfer to that account; account status flips to "closed bridge."
- [ ] Confirm the regulatory path (Bank Al-Maghrib / ACAPS) for the chosen fund-holding structure before launching with real money.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 252-startups-at-the-monetization-valida MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Morocco completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
