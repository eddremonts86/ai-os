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

## Value Proposition

An open source dual-band ADS-B receiver built around a new Semtech transceiver that fits in a much smaller enclosure than the existing DIY designs, with full KiCad source, firmware, and a known-good build so a hobbyist can stop hand-routing RF and just assemble, flash, and feed.

## Target Users

| Stakeholder | Why they care |
|---|---|
| ADS-B feeder hobbyists | Want a smaller / lower-power dual-band receiver to deploy at fixed sites or carry. |
| Drone / small-UAS operators | Need situational awareness of nearby manned traffic without a ground-station stack. |
| Hardware tinkerers | Want a reference design around the new Semtech part rather than reverse-engineering from a datasheet. |

## Jobs To Be Done

1. **Functional job** — Receive Mode S (1090 MHz) and UAT (978 MHz) messages from nearby aircraft and feed them into an existing aggregator.
2. **Emotional job** — Feel that a hand-built receiver can sit in an enclosure the size of a matchbox without sacrificing the second band.
3. **Social job** — Contribute to the feeder community with a documented, reproducible build others can copy.

## Success Metrics

- **Hardware reproduction:** at least 10 community-built units flashed with the published firmware, with photos and RSSI reports posted.
- **Reception parity:** the new design matches or beats a known-good reference receiver on 1090 MHz message rate within ±10% in the same antenna environment.
- **Dual-band lock:** the firmware demonstrably decodes UAT frames on 978 MHz alongside Mode S on 1090 MHz concurrently.
- **Time-to-first-message:** a first-time builder gets aircraft on a map within 2 hours of starting the assembly.

## Competitive Landscape

- **Existing dual-band DIY kits (e.g. Airspy R2, FlightAware dual-band Pro Stick + filter set)** — proven, but bulkier and built around older tuner ICs (RTL-SDR lineage).
- **Pre-built commercial dual-band receivers (uAvionix pingStation, etc.)** — closed hardware, much higher price point, no room to modify.
- **Single-band (1090 only) DIY feeders** — the smallest form factor today, but lose the GA / UAT half of the airspace picture.

## Risks & Open Questions

- [ ] New Semtech chip driver maturity — risk of errata that surfaces only in dense RF environments.
- [ ] 978 MHz antenna in the smaller enclosure may need a different feedline length to keep VSWR down.
- [ ] Open source licence choice — what is compatible with downstream firmware (e.g. GPLv3 vs permissive)?
- [ ] Community appetite for assembling a BGA or QFN variant of the Semtech part is unknown until first build reports land.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49455557) · **Category:** show-hn · **Tags:** Show HN,Hardware,ADS-B,Avionics,Open Source
