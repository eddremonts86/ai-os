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

## Tech Stack

- **Sensor kit (hardware partner or contract manufacturer):** LoRaWAN soil-moisture probes (battery, stake, QR-coded onboarding) + a 4G gateway with a Bulgarian SIM.
- **LoRaWAN network:** one national operator in Bulgaria; gateway serial is registered on provisioning so the first power-on auto-joins.
- **Ingest:** MQTT broker (managed or self-hosted) → Node.js consumer → Drizzle/SQLite → recommendation engine.
- **Recommendation engine:** rule-based layer for the MVP ("soil moisture dropped > X% in 24 h + no rain forecast → irrigate Y mm"), with a slot for an ML model later; every recommendation is paired with a one-sentence explanation.
- **Dashboard:** React SPA, mobile-first responsive, per-field recommendation, history of decisions, water / fertilizer saved vs a calendar baseline.
- **Weather data:** third-party API (OpenWeather or the Bulgarian national meteorological service) for short-horizon forecasts.
- **Billing:** Stripe-backed $10/month smallholder tier; per-hectare and per-device tiers for larger operators.

## Architecture

```
Field
 ┌──────────────┐   LoRaWAN   ┌────────────────┐
 │ Soil probes  │────────────▶│  4G gateway    │
 └──────────────┘             └────────────────┘
                                       │ MQTT
                                       ▼
                              ┌─────────────────────┐
                              │ MQTT broker         │
                              └─────────────────────┘
                                       │
                                       ▼
                              ┌─────────────────────┐
                              │ Node.js ingest      │
                              │  • Rule engine       │
                              │  • One-sentence "why"│
                              └─────────────────────┘
                                       │
                                       ▼
                              Drizzle/SQLite
                                       │
                                       ▼
                              ┌─────────────────────┐
                              │ React dashboard     │
                              │  (farmer's phone)    │
                              └─────────────────────┘
```

## Milestones

1. **M0 — Spec freeze.** Sensor-kit BOM, LoRaWAN operator contract, $10/month unit-economics model, weather-data provider. End of week 3.
2. **M1 — Ingest + storage.** MQTT ingest → Node.js consumer → Drizzle schema for probes, gateways, recommendations, decisions. End of week 6.
3. **M2 — Recommendation engine.** Rule-based layer with one-sentence "why" per recommendation; daily cron. End of week 9.
4. **M3 — Dashboard.** Per-field recommendation, decision history, water / fertilizer saved vs a calendar baseline. End of week 12.
5. **M4 — Pilot.** 20 smallholder kits deployed in Bulgaria with the author as the regional sales channel; weekly input-saving review. End of week 20.
6. **M5 — Per-hectare tier.** Wholesale hardware purchase option + multi-hectare dashboard; mid-size tier live. End of week 28.

## Risks

- **$10/month unit economics.** One gateway + 5 probes + LoRaWAN connectivity + cloud ingest + support may not close at $10. Decide up front whether the small tier caps at fewer probes, a monthly data cap, or a hardware-deposit model — do not raise the price above the author's ceiling after launch.
- **LoRaWAN coverage gaps.** Smallholder fields can sit outside the launch network's coverage; a dead-on-arrival kit is the worst possible onboarding experience. Validate the launch region's coverage before the first kit ships, and ship a cellular-probe fallback SKU even if it breaks $10 economics for that one customer.
- **Recommendation explainability.** A black-box "trust the model" output will not be adopted by farmers who have irrigated on Tuesdays for 20 years. Every recommendation must carry a one-sentence "why" (soil moisture dropped X%, no rain forecast, etc.) or adoption will stall.
- **Author dependency.** The author is a natural co-founder / regional sales channel but is not committed. The product must be buildable and shippable without his full-time involvement; treat his interest as a distribution win, not a milestone blocker.
