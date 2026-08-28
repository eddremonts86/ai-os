---
id: "3169"
slug: we-built-the-smallest-dual-band-aircraft-tracker
title: We built the smallest dual-band aircraft tracker
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49455557"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Hardware, ADS-B, Avionics, Open Source]
tech: [KiCad, Semtech SX126x driver (C), ESP32 firmware (C/Rust), OpenStreetMap tile server, Pi-hosted dump1090 derivative]
---
# We built the smallest dual-band aircraft tracker

## Tech Stack

- **Schematic + layout:** KiCad 8.x with a hierarchical sheet for the Semtech transceiver, MCU, and dual-band filter / LNA chain.
- **MCU firmware:** ESP32-S3 (chosen for USB-Serial, enough flash for two demodulator paths, and cheap dev boards) in C with a thin abstraction over the Semtech SX126x driver.
- **Demod pipelines:** two independent demodulator tasks on the ESP32 — Mode S (1090 MHz PPM) and UAT (978 MHz DFE-style frames) — each writing Beast-format output frames to a shared serial channel.
- **Ground-side decoder:** stock `dump1090-fa` (or a maintained fork) running on a Raspberry Pi over USB, serving a self-hosted map.
- **Map front-end:** `dump1090-fa` web package (tar1090) with OpenStreetMap tiles, no custom map code.
- **Docs site:** plain Markdown + MkDocs, hosted on GitHub Pages.

## Architecture

```
[1090 MHz ant] ──▶ SAW filter ──▶ LNA ──▶ Semtech RX path A ──┐
                                                                ├─▶ ESP32 demod ──▶ USB ──▶ dump1090-fa ──▶ tar1090 map
[978 MHz ant]  ──▶ SAW filter ──▶ LNA ──▶ Semtech RX path B ──┘
```

The PCB is a 4-layer board with split RF / digital ground, the two band paths laid out symmetrically to keep the BOM small. Firmware runs both demodulator tasks on separate cores; the serial link multiplexes Beast frames with a 1-byte band tag so the ground-side decoder can split them.

## Milestones

1. **M0 — Reference bring-up.** Semtech eval kit + ESP32 dev board wired on a breadboard, demodulating both bands off the air. End of week 2.
2. **M1 — Rev A schematic + PCB.** KiCad project checked in, first PCB ordered from a low-volume fab (JLCPCB / PCBWay), BOM under $80 in singles. End of week 6.
3. **M2 — Firmware freeze.** Both demod paths stable over a 24-hour soak test with no watchdog resets, documented register settings committed. End of week 9.
4. **M3 — Rev B (if needed).** Any RF issues from the M1 build patched, antenna matching verified with a NanoVNA. End of week 12.
5. **M4 — Docs + community kit.** MkDocs site with build guide, BOM CSV, Gerbers published; first 10 community builds reported. End of week 16.

## Risks

- **Semtech part availability.** If the new transceiver is sampling-only at launch, retail availability for community builders will gate the project's reach.
- **Dual-band antenna isolation.** Two small antennas in one enclosure can couple; risk of reduced effective range on one band if filtering is inadequate.
- **FCC / regulatory.** A transmitting chip variant near ADS-B bands needs the builder's regulator in mind even if the receiver side is passive.
- **Firmware complexity.** Concurrent dual demod on a single ESP32 leaves little headroom; a future port to ESP32-C6 with two cores is plausible but not promised.
