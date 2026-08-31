---
id: "4139"
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

## Tech Stack

- **Device firmware:** ESP32-S3 (Wi-Fi + Bluetooth LE) running FreeRTOS, with power-management tuned for the 1-week standby target.
- **Parent-side app:** React Native (iOS + Android) with the Wi-Fi provisioning + speaker pairing + playlist binding flows.
- **Speaker-protocol layer:** A small protocol-agnostic abstraction supporting AirPlay 2, Spotify Connect, and DLNA — start with Spotify Connect for the MVP if AirPlay 2 licensing is gated.
- **Cloud-side (minimal):** TanStack Start (Node.js) + SQLite/Drizzle for device-activation records, support tickets, and firmware OTA metadata.
- **Enclosure:** Injection-moulded ABS + silicone button caps, designed for isopropyl-alcohol wipe-down.
- **Manufacturing:** Contract manufacturer in Shenzhen with a 2-week lead time on 5K-unit batches.

## Architecture

```
[Device] ESP32-S3 + Wi-Fi + 4 buttons + battery
   │   Wi-Fi provisioning (one-time, via BLE from parent's phone)
   │   Press → speaker-protocol command over Wi-Fi
   ▼
[Home Wi-Fi] AirPlay 2 / Spotify Connect / DLNA target speaker
   ▲
[Parent-side app] React Native, iOS + Android
   │   Wi-Fi provisioning, speaker pairing, playlist binding
   ▼
[Cloud] TanStack Start + SQLite (Drizzle) — device-activation, OTA metadata, support
```

The device is intentionally dumb: no cloud round-trip on press, no telemetry, no always-listening. The parent-side app is the only surface that touches the cloud, and only during setup or OTA updates.

## Milestones

1. **M0 — Firmware prototype.** ESP32-S3 + 4 buttons + Wi-Fi provisioning via BLE. Spotify Connect target playback. End of week 4.
2. **M1 — Parent-side app.** Wi-Fi provisioning, speaker pairing, playlist binding (Spotify + Apple Music). End of week 8.
3. **M2 — Enclosure design + DFM.** Injection-moulded ABS + silicone caps, isopropyl-alcohol wipe test. End of week 14.
4. **M3 — First 5K-unit batch.** Contract-manufacturer run, retail-packaging + shipping. End of week 22.
5. **M4 — Pre-order + retail launch.** Pre-order at €49, retail at €59, EU + UK + Norway first. End of week 28.
6. **M5 — Multi-protocol support.** AirPlay 2 + DLNA targets in addition to Spotify Connect. End of week 36.

## Risks

- **AirPlay 2 licensing** — Apple requires MFi licensing for AirPlay 2 in third-party hardware. Mitigation: ship Spotify Connect + DLNA first; only add AirPlay 2 if licensing is feasible or fall back to a generic HTTP playback primitive.
- **Battery target miss** — 1-week standby with always-on Wi-Fi is aggressive. Mitigation: Wi-Fi power-save mode (802.11 PS-Poll), aggressive deep-sleep between button presses, BOM cost cap that excludes a larger battery.
- **Sanitization wear** — silicone button caps detach or paint fades after repeated isopropyl wipes. Mitigation: pre-launch wipe-test of 1000 cycles; replace silicone compound if test fails.
- **Retail-channel friction** — preschool + clinic channels need procurement-grade invoicing, not Stripe. Mitigation: a parallel invoicing flow for institutional buyers (PO + net-30), no marketing to individuals if it conflicts with the institutional story.
