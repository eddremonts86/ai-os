---
id: "251"
slug: no-way-for-city-residents-to-order-delivery-from-local-
title: No way for city residents to order delivery from local stores to their elderly relatives in remote villages
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/logistics/kos2aznku1-no-way-for-city-residents-to-order-deliv"
category: logistics
date: "2026-01-13"
tags: [Logistics, Retail, Other]
country: Russia
---
# No way for city residents to order delivery from local stores to their elderly relatives in remote villages

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/251-no-way-for-city-residents-to-order-delivery-from-local-/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Build the operator console used to onboard villages, register stores (with a printed catalogue), and register one courier per village.
- [ ] Build the buyer order form (recipient, village, goods category, budget) with mobile-first, low-bandwidth-tolerant layout; wire payment via YooKassa.
- [ ] Wire SMSC.ru for courier SMS notifications with pickup details and a single-tap delivery-confirmation link.
- [ ] Build the courier confirmation page (mobile, single tap) that uploads a delivery photo and marks the order delivered; notify the buyer.
- [ ] Add object storage (S3-compatible MinIO) for delivery-confirmation photos.
- [ ] Build the buyer dashboard with order history and a "send the same basket again" shortcut for recurring needs.
- [ ] Print a Russian-language courtesy note template the courier hands to the recipient explaining the order and the buyer's name.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 251-no-way-for-city-residents-to-order- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
