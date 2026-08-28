---
id: "3182"
slug: ai-scientist-builds-an-open-source-codex-micro-from-scr
title: AI scientist builds an open-source Codex Micro from scratch for $40
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49453466"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Hardware, AI, Agent, Open Source]
tech: [KiCad, PCB manufacturing (JLCPCB), QMK firmware, agentic research loop (Python), runbook Markdown]
---
# AI scientist builds an open-source Codex Micro from scratch for $40

## Tech Stack

- **Schematic + PCB:** KiCad 8.x with a hierarchical sheet (MCU, key matrix, encoder, joystick, touch disc, LED driver, USB-C).
- **MCU:** a QMK-supported microcontroller (e.g. RP2040 or equivalent) chosen for native USB, enough GPIO for the matrix + encoder + joystick + touch disc, and on-board QMK support.
- **Firmware:** QMK (or a maintained fork with codex-native firmware contributed in the post).
- **Touch disc:** off-the-shelf capacitive touch controller (e.g. an Azoteq IQS series or similar) wired over I²C.
- **LEDs:** per-key SK6812-MINI-E or similar; LED-band is a WS2812 strip header on the PCB.
- **Configurator:** the existing static-site configurator at the linked GitHub Pages URL (no backend; keymap is exported as a QMK keymap.c snippet).
- **Agent runbook:** Python orchestrator that calls into an LLM, reads docs, drives KiCad CLI for placement / routing experiments, and writes a Markdown log.

## Architecture

```
USB-C ─▶ MCU (RP2040) ─┬─▶ 13-key matrix (per-key SK6812 LEDs)
                       ├─▶ rotary encoder (A/B pins)
                       ├─▶ joystick (X/Y analogue)
                       ├─▶ touch disc (I²C controller)
                       └─▶ LED band header (WS2812 data out)
```

The PCB is a 2- or 4-layer board with the key matrix on the top side, the touch disc on the left, the encoder top-right, and the joystick bottom-right; the LED band traces run along the inner edge. The configurator is purely client-side: the user binds keys, hits Export, and pastes the resulting `keymap.c` block into QMK.

## Milestones

1. **M0 — Schematic + first PCB order.** KiCad schematic rev A, hand-routed power, gerbers to JLCPCB / PCBWay, single-unit BOM CSV under $40. End of week 4.
2. **M1 — Rev B (if needed).** Any routing / EMI issues from the M0 build patched. End of week 6.
3. **M2 — QMK firmware.** All inputs mapped, per-key RGB working, configurator export produces a valid `keymap.c`. End of week 8.
4. **M3 — Runbook published.** Markdown runbook that explains the agent loop, the docs ingested, the experiments, and the backtracking. End of week 10.
5. **M4 — 5 community builds.** First 5 reported builds with photos, keymap exports, and any errata. End of week 14.

## Risks

- **Component sourcing.** Capacitive touch disc and the specific LED part may have lead-time surprises; a second-source on the touch controller is wise.
- **BOM drift.** The $40 number is a claim, not a guarantee; if the LED band or encoder pushes it over, the BOM must be re-costed honestly before the Show HN writeup.
- **QMK upstream drift.** A QMK fork risks falling behind the upstream; staying close to upstream (or contributing back) is the long-term play.
- **Runbook honesty.** The runbook's value depends on recording what didn't work; an overly tidy write-up defeats the point.
