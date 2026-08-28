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

## Phase 0: Scaffold

- [x] Capture problem + write SPEC.md skeleton
- [ ] Decide final MCU choice (ESP32-S3 vs another) and document in `docs/hw-decisions.md`
- [ ] Choose KiCad library policy: stock libs only, or vendor symlinked?
- [ ] Pick a licence (GPLv3 for firmware permissive for hardware?)
- [ ] Set up GitHub repo: `hw/` (KiCad + Gerbers), `fw/` (ESP-IDF project), `docs/` (MkDocs), `cases/` (enclosure STLs)
- [ ] Order first batch of Semtech eval kits and reference antennas

## Phase 1: Core

- [ ] Breadboard bring-up: Semtech eval board + ESP32-S3 dev kit, confirm 1090 MHz reception against a known feeder
- [ ] Add 978 MHz path on the breadboard, confirm UAT frames decode
- [ ] First KiCad schematic rev A; ERC clean, hand-routed power, RF still air-wired
- [ ] First PCB order; assemble by hand, validate with NanoVNA on each antenna port
- [ ] Firmware: dual-core demod tasks, Beast output over USB with band tag
- [ ] Ground-side: dump1090-fa reading both bands from a single USB serial stream
- [ ] tar1090 map showing aircraft from both bands with distinct markers
- [ ] 24-hour soak test: zero watchdog resets, message rate logged and compared against a reference receiver

## Phase 2: Deploy

- [ ] Publish Gerbers, BOM CSV, pick-and-place on GitHub releases
- [ ] Publish MkDocs site (build, flash, antenna, troubleshooting)
- [ ] Pre-order 25 kits for community builders (assembled + flashed) if demand warrants
- [ ] Post Show HN writeup with measured range vs a reference receiver
- [ ] Set up a simple bug-tracker label (`area:fw`, `area:hw`) and a Discord / matrix room for builders
