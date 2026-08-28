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

## Problem

The poster has been building open source embedded ADS-B receivers for a while, and the past 8 months have been spent shrinking the existing receiver tech around a new chip from Semtech. ADS-B is the 1090 MHz downlink commercial aircraft use to broadcast position; "dual-band" adds the 978 MHz uplink band used by general aviation in the US. The problem being addressed is form factor: existing dual-band DIY receivers are too large to install unobtrusively in small aircraft, drones, or weatherproof outdoor enclosures, and the Semtech chip allows the BOM to drop to a footprint that fits in a matchbox-sized enclosure. The poster is explicitly inviting AMA about ADS-B and hardware manufacturing.

## Objective

Ship a production-ready open source dual-band ADS-B receiver reference design (KiCad project + firmware) that demonstrably uses the new Semtech transceiver and is small enough to be carried as a handheld or strapped to the outside of an airframe, with enough documentation that a hobbyist can build and flash it.

## Target Users

- Primary: ADS-B hobbyists and feeders (FlightAware / FlightRadar24 feeders) who want a smaller, lower-power dual-band receiver to deploy at fixed sites or carry on trips.
- Secondary: small-UAS / drone operators who want situational awareness of nearby manned aircraft without a full ground-station setup; tinkerers who want a known-good reference design around the new Semtech part.

## MVP Scope

- KiCad schematic + PCB layout for the dual-band receiver using the new Semtech chip, with a published BOM and a target enclosure size.
- Firmware for the on-board MCU that drives the Semtech transceiver, demodulates 1090 MHz ES and 978 MHz UAT, and outputs Mode S / UAT messages over a serial or USB link.
- A documented build (Gerbers, BOM CSV, pick-and-place, assembly notes) and a flashable firmware binary.
- A short "getting started" that shows the receiver running next to a known aircraft and feeding a dump1090-style map.
- Out of scope: a hosted map service, a mobile app, network aggregation, or anything that competes with the existing FlightAware / ADSBExchange feeder networks.

## Design Direction

Visual direction is set by the physical product, not the software: a single rectangular PCB, exposed SMA connectors for the two band antennas, a single USB-C power/data jack, status LEDs for power / 1090 lock / UAT lock. The accompanying docs site is monochrome, dense, and table-driven; no marketing flourish, no animated hero. Antenna placement matters more than UI.

## Constraints

- Must use the specific Semtech chip the poster referenced (the size win comes from that part).
- Both 1090 MHz and 978 MHz reception must be functional simultaneously, not multiplexed.
- Hardware design files (KiCad + Gerbers) and firmware must be open source at a recognised licence.
- The build must be reproducible by a hobbyist with a hot-air station and a soldering iron; no BGA-only parts without a documented stencil-and-reflow path.
