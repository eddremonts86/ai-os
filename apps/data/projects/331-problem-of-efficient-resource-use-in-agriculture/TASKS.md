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

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/agtech/5gr3p49mg1-problem-of-efficient-resource-use-in-agr` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/331-problem-of-efficient-resource-use-in-agr/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Raspberry Pi firmware (C), LoRaWAN stack, InfluxDB on a NAS, and confirm versions resolve in CI.
- [ ] Implement the smallest slice from MVP Scope that proves the Raspberry Pi firmware (C), LoRaWAN stack, InfluxDB on a NAS integration in production.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Bulgaria`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Bulgaria.
## Phase 1: Core

- [ ] Sensor node BOM: capacitive moisture (2 depths), SHT temp/humidity, leaf-wetness, LoRa radio, 18650 + 6V solar
- [ ] Firmware (C) on the node: 5-min sample, hourly uplink, duty-cycled radio, OTA update path
- [ ] Gateway: Raspberry Pi OS image with Mosquitto, InfluxDB, Grafana, one Wi-Fi AP for the farmer's phone
- [ ] Per-zone irrigation recommendation: baseline + soil-moisture deficit + simple ET0 estimate (no API call)
- [ ] Variable-rate CSV export keyed to the farmer's pivot/drip zone labels
- [ ] Fleet view (opt-in cloud) for up to 50 farms: last-24h moisture map, weekly summary email
- [ ] Pilot on 3 farms (50, 120, 200 ha) through one irrigation season; weekly on-site review for the first month

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Raspberry Pi firmware (C), LoRaWAN stack, InfluxDB on a NAS) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 331-problem-of-efficient-resource-use-i MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Bulgaria completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Raspberry Pi firmware (C), LoRaWAN stack, InfluxDB on a NAS errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
