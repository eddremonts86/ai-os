---
id: "761"
slug: need-a-smart-device-that-automatically-detects-pigeons-
title: Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market only works temporarily.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/hardware/xaf7mgmiy1-need-a-smart-device-that-automatically-d"
  captured: "2026-02-23"
category: hardware
date: "2026-02-23"
tags: [Hardware, Other]
country: France
wtp:
  raw: $200-$400 one-time
  currency: USD
  min: 200
  max: 400
  period: one-shot
  mrrMid: 300
tech: [ESP32-S3, PIR + camera (object detection), piezo speaker, weatherproof enclosure, Li-ion / solar, edge ML (TFLite Micro)]
---
# Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market only works temporarily.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define the 30-day efficacy protocol in DESIGN.md (7-day baseline → install → 30-day observation)
- [ ] Legal review of aversive-stimuli use against birds in France / EU
- [ ] BoM quote at 100 units from the first 3 EMS candidates; freeze at $120 target
- [ ] Industrial design brief: IP65 enclosure, French-language labelling, rail / wall mount
- [ ] Bird-detection dataset plan: collect ≥ 5,000 labelled frames from balconies in daylight, low-light, and silhouette conditions

## Phase 1: Core

- [ ] Breadboard prototype: ESP32-S3 + PIR + camera + piezo + Li-ion, classifier runs a placeholder model, manual deterrent trigger via serial
- [ ] Train and quantize a pigeon-vs-other classifier (int8, ≤ 200 KB) on the custom dataset; ≥ 90% precision at ≤ 1 false trigger per day
- [ ] Adaptive deterrent state machine: low → ultrasonic, medium → ultrasonic + predator call, high → ultrasonic + predator call + water spray
- [ ] Local event log (rolling 7-day detection histogram) in flash; BLE phone app reads it on demand
- [ ] IP65 enclosure v1; solar + 18650 power chain; ≥ 4 weeks battery in mixed sun, ≥ 2 weeks in shade
- [ ] Status LED + tactile button (mode / test / reset) — no cloud, no required app
- [ ] First 10 pilot units installed in Lyon / Paris for the 30-day efficacy study
- [ ] End-to-end pilot report: ≥ 70% reduction in return-visits per protected spot, no regression between day 14 and day 30
- [ ] CE / RED compliance package (technical file, test reports, declaration of conformity)

## Phase 2: Deploy

- [ ] 100-unit production run with the chosen EMS
- [ ] DTC site in French + English; €299 / $299 price point
- [ ] Pest-control operator partner portal (deferred SKU, $249 partner price)
- [ ] Public launch in France first; English-speaking markets in phase 3
- [ ] PIR + microphone (no-camera) SKU as the privacy-first variant
