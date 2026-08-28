---
id: "331"
slug: problem-of-efficient-resource-use-in-agriculture
title: Problem of efficient resource use in agriculture
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/agtech/5gr3p49mg1-problem-of-efficient-resource-use-in-agr"
category: agtech
date: "2025-10-29"
tags: [AgTech, Hardware, Other]
country: Bulgaria
tech: [Raspberry Pi firmware (C), LoRaWAN stack, InfluxDB on a NAS, Grafana, MQTT broker (Mosquitto)]
---
# Problem of efficient resource use in agriculture

## Problem

A Bulgarian smallholder with 50-200 hectares is doing soil-moisture, fertilizer and irrigation decisions by walking the field and trusting visual cues, then applying water or inputs across the whole plot uniformly. The waste shows up in two line items: over-irrigation in already-wet corners and under-application in pockets the operator did not visit that week. A second pattern is pesticides applied on calendar schedule rather than pest-pressure signal, which adds cost and raises the chance of resistance.

## Objective

Ship a low-cost, retrofit field-sensor and decision kit for Bulgarian smallholders that measures soil moisture, soil temperature and basic weather variables per zone, and produces a daily variable-rate irrigation and input recommendation a farmer can follow without agronomy training.

## Target Users

- Bulgarian smallholders running 50-200 hectares of mixed crops without an in-house agronomist.
- Cooperative members who share one kit across several holdings and want a printable daily plan.
- Agri-extension officers who need a fleet view of multiple farms for subsidy reporting.

## MVP Scope

- Outdoor sensor node: soil moisture (2 depths), soil temperature, air temperature/humidity, leaf wetness; battery + solar; LoRaWAN uplink.
- Gateway: single Raspberry Pi class device on the farm with a Mosquitto MQTT broker and InfluxDB.
- Local dashboard (Grafana) showing per-zone last-24h moisture and a daily irrigation recommendation per zone.
- Variable-rate output as a printable CSV keyed to the farmer's existing pivot / drip zones.
- Fleet dashboard for agri-extension officers viewing 10-50 farms.
- No precision application hardware in v1 - the farmer still drives the system; we deliver the recommendation.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/agtech/5gr3p49mg1-problem-of-efficient-resource-use-i` follows the constraints in `331-.../SPEC.md` and the chosen stack (Raspberry Pi firmware (C), LoRaWAN stack, InfluxDB on a NAS). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Bulgaria.

For Bulgaria, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Hardware bill of materials per node under EUR 120 to keep the kit viable on subsidy programmes.
- All on-farm data stays on the gateway by default; cloud sync is opt-in.
- Bulgarian language UI; Cyrillic input on the gateway touchscreen.
