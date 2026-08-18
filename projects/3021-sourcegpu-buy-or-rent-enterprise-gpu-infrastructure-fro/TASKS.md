---
id: "3021"
slug: sourcegpu-buy-or-rent-enterprise-gpu-infrastructure-fro
title: SourceGPU – Buy or rent enterprise GPU infrastructure from vetted providers
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/sourcegpu?utm_campaign=startup-182581&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-17"
tags: [BetaList, Beta, Product]
---
# SourceGPU – Buy or rent enterprise GPU infrastructure from vetted providers

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/3021-sourcegpu-buy-or-rent-enterprise-gpu-infrastructure-fro/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Build the supplier verification pipeline with encrypted document storage (business registration, tax ID, reference-customer letters) and an admin review queue where a human verifier approves or returns the application within a documented SLA.
- [ ] Build the supplier dashboard for uploading inventory across the four listing categories — servers, clusters, workstations, and standalone GPUs — with H100 and H200 as the headline inventory and Blackwell as a forward-looking category.
- [ ] Build the public catalogue backed by Postgres with filters for SKU, generation, region, and price band, and a staleness signal so listings older than the freshness SLA are flagged in the UI.
- [ ] Wire the buyer purchase flow to the external escrow provider with the funds-held, delivery-confirmed, and buyer-accepted lifecycle, plus a documented dispute path that surfaces in both buyer and supplier dashboards.
- [ ] Build the rental-agent install guide (Go or Rust binary the supplier installs on the rental host) and a reservation flow with hourly pricing so a buyer can reserve capacity for a training or fine-tuning run.
- [ ] Implement the uptime-billed invoice generator that consumes the rental agent's per-GPU uptime feed and produces an invoice with the actual billable hours, so the contract is provably uptime-based and dispute-resolvable.
- [ ] Build the buyer dashboard for active rentals, past purchases, escrow status, and saved-search alerts that notify the buyer when new inventory matches a category they care about.
- [ ] Build the supplier dashboard for inventory upload, pricing controls, the reservation calendar, and a payout history with a per-transaction ledger and a payout-schedule summary.
- [ ] Add cross-check probes (cloud-monitor pings, SSH liveness) that independently validate the rental agent's uptime feed and trigger a dispute review when the two diverge.
- [ ] Ship an end-to-end demo: a verified supplier lists H100 inventory, a buyer reserves rental capacity, the rental agent reports uptime, and the resulting invoice and escrow trail match the lifecycle events in the dashboards.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-18_
