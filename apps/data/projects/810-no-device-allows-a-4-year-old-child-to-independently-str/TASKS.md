---
id: "810"
slug: no-device-allows-a-4-year-old-child-to-independently-str
title: "No device allows a 4-year-old child to independently stream music to a speaker over Wi-Fi without using a phone, tablet, or increasing screen time"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/hardware/r1t8dnh8n1-no-device-allows-a-4-year-old-child-to-"
  captured: "2026-01-03"
category: hardware
date: "2026-01-03"
tags: [Hardware, Kids, Music, Other]
country: Norway
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# No device allows a 4-year-old child to independently stream music to a speaker over Wi-Fi without using a phone, tablet, or increasing screen time

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] ESP32-S3 dev board + FreeRTOS toolchain
- [ ] Spotify Connect playback prototype
- [ ] Parent-side app scaffold (React Native, iOS + Android)
- [ ] Cloud-side: TanStack Start + Drizzle migrations for device-activation + OTA metadata

## Phase 1: Core

- [ ] Firmware: 4-button handler, Wi-Fi join on first power-up
- [ ] Firmware: Spotify Connect playback target with < 3s press-to-playback latency
- [ ] Wi-Fi provisioning via BLE (parent-side app exchanges creds once)
- [ ] Parent-side app: device setup + speaker pairing + playlist binding (Spotify + Apple Music)
- [ ] Battery target: ≥ 1 week standby, ≥ 24 hours continuous playback
- [ ] Enclosure: injection-moulded ABS + silicone button caps
- [ ] Sanitization test: 1000 isopropyl-alcohol wipes without detachment or paint loss
- [ ] End-to-end test: unbox → parent provisions → child presses → music plays in < 3 seconds

## Phase 2: Deploy

- [ ] Contract-manufacturer run (5K units), 2-week lead time
- [ ] Retail packaging + shipping (EU + UK + Norway)
- [ ] Pre-order at €49, retail at €59
- [ ] OTA update mechanism (cloud-side metadata, firmware image hosting)
- [ ] Institutional invoicing flow (PO + net-30) for preschools + clinics
- [ ] AirPlay 2 + DLNA targets (post-MVP, if licensing is feasible)
- [ ] Post-mortem at week 28: did the 1-week standby target actually hold in the field?