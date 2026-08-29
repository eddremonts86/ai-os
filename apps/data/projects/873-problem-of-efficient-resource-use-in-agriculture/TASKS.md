---
id: "873"
slug: problem-of-efficient-resource-use-in-agriculture
title: Problem of efficient resource use in agriculture
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/agtech/5gr3p49mg1-problem-of-efficient-resource-use-in-agr"
  captured: "2025-10-28"
category: agtech
date: "2025-10-28"
tags: [AgTech, Hardware, Other]
country: Bulgaria
wtp:
  raw: $10/month for small users
  currency: USD
  period: month
  min: 10
  max: 10
  mrrMid: 10
tech: [IoT sensors (soil moisture, weather), LoRaWAN gateway, MQTT ingest, Node.js + TanStack Start API, SQLite with Drizzle ORM, React dashboard for farmers]
---
# Problem of efficient resource use in agriculture

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (dashboard tokens, per-field card, recommendation "why" copy)
- [ ] Lock the smallholder kit BOM (one 4G gateway + up to 5 LoRaWAN soil-moisture probes, battery + stake)
- [ ] Sign the LoRaWAN network operator contract in Bulgaria and the weather-data provider contract
- [ ] Validate the $10/month unit-economics model (gateway + probes + connectivity + ingest + support) before the first kit ships
- [ ] Provision the ingest: MQTT broker → Node.js consumer → Drizzle schema

## Phase 1: Core

- [ ] QR-coded onboarding: farmer scans, gateway auto-joins LoRaWAN, probes auto-register
- [ ] Rule-based recommendation engine: "irrigate yes/no + how much", "fertilize yes/no + how much", with a one-sentence "why" per recommendation
- [ ] Daily cron that emits one recommendation per field per day, with the explanation visible in the dashboard
- [ ] React dashboard (mobile-first): per-field recommendation card, decision history, water / fertilizer saved vs a self-reported calendar baseline
- [ ] English + Bulgarian UI; one launch region (Bulgaria)
- [ ] Stripe-backed $10/month smallholder tier with hardware leased, not sold (kit returns on cancel)
- [ ] Per-field history view that compares recommended vs actual irrigation (when the farmer reports it back through the dashboard)
- [ ] End-to-end test: install a kit in a test field → 24 h of data → first daily recommendation → dashboard renders "why" explanation → farmer logs actual irrigation → saved-vs-baseline metric populates

## Phase 2: Deploy

- [ ] Pilot 20 smallholder kits in Bulgaria with the author (George Petrov) as regional sales channel
- [ ] Weekly input-saving review with the pilot cohort; measure water and fertilizer saved vs calendar baseline by month 3
- [ ] Per-hectare tier: wholesale hardware purchase option + multi-hectare dashboard; mid-size tier live
- [ ] Cooperative / consultant partner tier for resellers
- [ ] Post-pilot retrospective at week 20: revisit $10/month unit economics, LoRaWAN coverage gaps, recommendation accuracy, co-founder conversation with the author
