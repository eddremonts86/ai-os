---
id: "219"
slug: need-a-smart-device-that-automatically-detects-pigeons-
title: Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market is one-shot or habituation-prone.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: iot
date: "2026-02-23"
tags: [IoT, Hardware, Environment]
country: France
tech: [Python, YOLOv8, Raspberry Pi, LoRa, ESP32, Next.js]
---
# Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market is one-shot or habituation-prone.

## Problem

A user in France has a pigeon problem on a balcony, courtyard, or rooftop. Existing deterrents (scarecrows, spikes, ultrasonic devices, recorded predator calls) are either one-shot (the pigeons learn they are inert) or habituation-prone (the pigeons get used to the noise). Netting and wires work but require installation and ongoing maintenance. What is missing is a small, weatherproof device that detects a pigeon in real time, applies a deterrent that is randomised across multiple modalities (sound, light, water, motion), and learns which modality works at which times of day for that specific location. None of the mainstream IoT deterrents (Bird-X, Bird-B-Gone) combine detection with adaptive multi-modal deterrence.

## Objective

A small, weatherproof device that detects a pigeon on the spot, applies a randomised deterrent (sound, light, motion, water), and adapts to the location's actual pigeon pattern over time.

## Target Users

French and European homeowners, restaurants with outdoor seating, building managers, and small-scale agricultural sites with recurring pigeon problems. Secondarily: industrial facilities (warehouses, distribution centres) with rooftop access.

## MVP Scope

Outdoor device: Pi-class CPU + camera + speaker + LED array + water sprayer (optional). Detection at 10-20m range. Multi-modal deterrent with randomised selection. Per-day learning loop. Solar or mains power. Web app to see the events and tune the schedule. No cloud dependency for the core loop.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `219-.../SPEC.md` and the chosen stack (Python, YOLOv8, Raspberry Pi). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in France.

For France, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must not be audible above legal nuisance limits. Must not affect other birds (the model must distinguish pigeons from other small birds). Must function in rain and below 0C. Power budget must be enough for solar deployment. Settable re-arm time so the pigeons do not get a free morning.
