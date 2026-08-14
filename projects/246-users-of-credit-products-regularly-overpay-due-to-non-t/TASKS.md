---
id: "246"
slug: users-of-credit-products-regularly-overpay-due-to-non-t
title: Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/jtv11ju831-users-of-credit-products-regularly-overp"
category: finance
date: "2026-01-18"
tags: [Finance, Legal, Other]
country: Russia
---
# Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/246-users-of-credit-products-regularly-overpay-due-to-non-t/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Build FastAPI service with `/upload` accepting statement (PDF/CSV/XLS) and optional credit-agreement PDF, encrypted at rest with a documented 30-day retention policy.
- [ ] Implement statement parser for the three most common Russian online-banking export formats (Sberbank, Tinkoff, Alfa-Bank), producing a normalized transactions table.
- [ ] Implement credit-agreement parser that extracts headline rate, effective annual rate, tariff items, and additional-fee clauses by section.
- [ ] Build fee-pattern catalogue as a JSON-defined rule set covering cash-advance commissions, SMS-banking fees, insurance add-ons, currency-markup spreads, penalty interest, and account-maintenance fees.
- [ ] Implement transaction tagger that matches each line against the catalogue and records the matched pattern for auditability.
- [ ] Build Advocate Report generator that groups findings into a Russian-language PDF with line citations, plain-language explanations, and trailing-12-month ruble totals.
- [ ] Add deletion-on-request endpoint and a retention-policy banner on the upload screen.
- [ ] Add five Russian credit-product users as validation testers for the MVP report.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 246-users-of-credit-products-regularly- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
