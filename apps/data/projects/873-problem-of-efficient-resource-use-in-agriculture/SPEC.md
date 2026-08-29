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

## Problem

Global agriculture needs to produce more food for a growing population without increasing water and fertilizer inputs, but existing methods are inefficient: farmers cannot accurately determine *when* and *how much* to irrigate or fertilize, which causes both waste and environmental harm. The ProblemHunt author (George Petrov, Bulgaria) has been educating farmers, running consultations, and proposing solutions to management of large international agricultural companies; his existing approaches are "not technological enough" and do not provide precise, real-time control over inputs. He observes the market is ready for a flexible payment model where small users can pay from $10/month by subscription; the author is also looking for a business co-founder.

## Objective

Ship an IoT-and-dashboard precision-agriculture subscription that tells a farmer exactly when and how much to irrigate or fertilize, based on soil-moisture and weather data from in-field sensors, with a $10/month entry tier for small users and a per-hectare or per-device tier for large operators, so a farmer can reduce water and fertilizer waste without becoming a sensor engineer.

## Target Users

- Primary: smallholder farmers in Bulgaria and similar markets who currently water and fertilize on a calendar and want sensor-driven recommendations without owning the sensors outright.
- Secondary: mid-size and large agricultural operators running multi-hectare operations who need a per-hectare or per-device tier and an API into their existing farm-management software.
- Tertiary: agricultural cooperatives and consultants who would deploy sensors across a region and resell recommendations to their members.

## MVP Scope

- A soil-moisture + weather sensor kit (LoRaWAN gateway + 5–10 field probes) that the farmer plugs in and forgets.
- A cloud ingest (MQTT) → analytics → recommendation engine that answers two questions per field per day: "irrigate now (yes/no, how much)" and "fertilize now (yes/no, how much)".
- A farmer-facing dashboard: per-field recommendation, history of decisions, water and fertilizer saved vs a calendar baseline.
- A subscription at $10/month for the small-tier kit (one gateway + up to 5 probes); a per-hectare tier for larger operators with no fixed cap.
- One launch country (Bulgaria) with one LoRaWAN network operator; English + Bulgarian UI.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Sensor hardware must be field-installable without a technician — the gateway ships with a 4G SIM, the probes ship with a battery and a stake, and onboarding is "scan a QR code, push the probe into the ground".
- The $10/month small-tier price is the author's stated willingness to pay for small users; if the unit economics don't work at $10 for one gateway + 5 probes, the tier must be re-scoped (e.g. fewer probes) rather than the price raised.
- Recommendations must be explainable in one sentence per field ("irrigate 8 mm in the south block: soil moisture dropped 18% in 24 h and no rain forecast"); a black-box "trust the model" output will not be adopted.
- The MVP must not depend on the author joining as a co-founder — the product must be buildable without that commitment, even though the author is a natural early sales channel.
