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

## Problem

Shimi Ben Haroush (France) has pigeons that have taken over his rooftops, balconies, window sills, and ledges — they make noise, build nests, and leave droppings that make daily life unbearable and unsanitary. He has tried the standard advice — vinegar, smell-based repellents, reflective discs, spikes — and observed the same pattern every time: the methods work briefly, the pigeons relocate for a few days, and then return to the same roosting spots. Pigeons habituate to static deterrents (fake owls, reflective tape, scent), the perches come back, and the hygiene / maintenance nightmare restarts. The author explicitly wants a smart device — not another passive barrier — that detects when a pigeon lands on a protected area, activates an effective deterrent, and operates autonomously without constant human intervention, without harming the birds, but reliably keeping them away from specific locations. Stated willingness to pay: $200–$400 one-time per device.

## Objective

Ship a weatherproof, solar-friendly "smart pigeon deterrent" device that detects pigeon landings via edge ML (camera + object detection or acoustic signature of wing beats), triggers a humane but aversive stimulus (variable-frequency ultrasonic, predator-call audio, brief water spray, or strobe) on landing, and learns the roost pattern over time so the deterrent escalates intelligently and adapts to pigeon habituation. The MVP is a single self-contained unit that mounts on a balcony rail, runs for weeks on battery + solar, and demonstrably reduces return visits over a 30-day pilot.

## Target Users

- **Primary:** city dwellers with a balcony, rooftop terrace, or windowsill that pigeons treat as a roost — the same persona as the author (France, urban residential).
- **Secondary:** small café / restaurant owners with outdoor seating plagued by pigeons; building managers responsible for façade maintenance; warehouse operators with loading-bay pigeon issues.

## MVP Scope

- A single weatherproof unit (~IP65) that mounts to a railing or wall.
- Edge detection: an ESP32-S3 class MCU running TFLite Micro on a low-resolution camera stream; a PIR sensor as a wake-up trigger so the camera only powers on when motion is detected.
- Deterrent stack, selectable per install: variable-frequency ultrasonic (18–25 kHz), recorded predator calls (hawk / falcon), brief water spray via a small solenoid pump, or a strobe LED. (Pigeons habituate fastest to single-mode deterrents; MVP ships at least two simultaneous modes.)
- Adaptive scheduling: the device logs detection events with a timestamp, builds a roost pattern, and escalates deterrent aggressiveness for repeat visitors.
- Power: 18650 Li-ion cell charged by a small solar panel; ≥ 4 weeks autonomy at the author's stated install density.
- A status LED and a button for manual "armed / disarmed / test"; no app required for v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Stated price ceiling is $200–$400 one-time per device — the BoM + enclosure + solar + battery must fit inside that, with margin for assembly and warranty reserves. If it doesn't, the product has no market.
- Must be humane: no traps, no poison, no projectile. The product category carries regulatory risk in the EU; legal review required before launch.
- Must not depend on a cloud account — pigeons don't pause when Wi-Fi does. All detection and deterrent logic runs on-device.
- Battery + solar only — no mains power assumption (the author is on a balcony).
- Deterrent efficacy must be measurable: the MVP must ship with a small "before / after" log so the user can see return-visit counts dropping over time.
- EU CE marking, RED directive compliance for any RF (the ultrasonic emitter is fine, but a future Wi-Fi module needs declaration).
