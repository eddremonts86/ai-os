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

## Phase 0: Scaffold

- [x] Capture problem + write SPEC.md skeleton
- [ ] Decide licence (CERN-OHL for hardware, GPLv2+ for firmware is the conventional pairing)
- [ ] Repo layout: `hw/` (KiCad + Gerbers), `fw/` (QMK keymaps), `agent/` (the research loop), `docs/runbook.md`, `configurator/` (static site)
- [ ] Pick the MCU (RP2040 vs equivalent) and confirm QMK support is current
- [ ] Order first batch of touch disc samples (Azoteq IQS or equivalent)
- [ ] Set up the configurator static site on GitHub Pages

## Phase 1: Core

- [ ] KiCad schematic rev A: 13-key matrix, encoder, joystick, touch disc, LED driver, USB-C
- [ ] First PCB order at JLCPCB; BOM CSV checked against the in-cart total (target ±$5 of $40)
- [ ] Hand-assembly of the first board; bring-up with a stock QMK keymap
- [ ] Per-key RGB working; encoder / joystick / touch disc inputs visible to QMK
- [ ] Configurator: drag-to-bind keys, live preview, export to `keymap.c` snippet
- [ ] Runbook: document the agent loop — what docs were ingested, what experiments, what backtracking, what worked
- [ ] Five-unit beta: five community builders flash the firmware and report results
- [ ] Errata doc updated with first-build feedback

## Phase 2: Deploy

- [ ] Publish Gerbers + BOM + assembly notes as a GitHub release
- [ ] Show HN writeup with the build photo, BOM receipt, and the runbook link
- [ ] Open GitHub issues for the future work the post mentions (OLED, Bluetooth base, cross-coding-agent compatibility) so contributors can pick up
- [ ] Coordinate with the codex-native firmware contributor (shouted out in the post) to land the fork in the repo
- [ ] Post-launch review: how many community builds in 30 / 60 / 90 days, and what the next round of design improvements should be
