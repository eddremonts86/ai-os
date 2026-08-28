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

## Problem

OpenAI × Work Louder's Codex Micro macropad sold out, and the team wanted a cost-effective but full-featured alternative that captures the same I/O surface: 13 assignable keys with individual LEDs, a rotary encoder, a joystick, a touch disc, and an optional edge-lit LED band. Other agentic skills, tools, and even commercial platforms failed to produce a fully routed board under a tight cost constraint. The team's "agentic scientist" Marvin was pointed at the problem as a research task — synthesising vast technical docs and best-practice guidelines, testing placement and routing strategies as experiments, and selectively backtracking and combining learnings. The result is a working open-source design plus a reusable runbook that demonstrates an agent entering an unfamiliar domain, learning, and unlocking novel capabilities.

## Objective

Publish a reproducible open-source Codex Micro macropad (KiCad sources, Gerbers, BOM, firmware) that hits the same I/O surface as the original at a ~$40 BOM, with a runbook showing the agentic research workflow so others can apply the same approach to other EE problems.

## Target Users

- Primary: macropad hobbyists and streamers who want a Codex-Micro-equivalent without depending on the sold-out commercial unit.
- Secondary: agent / tool builders interested in a documented "research-as-exploration" loop that worked on a hard electrical-engineering problem; EE students who want a known-good reference design for a 13-key + encoder + joystick + touch disc macropad.

## MVP Scope

- KiCad schematic + PCB layout for the 13-key + rotary encoder + joystick + touch disc + LED-band macropad.
- A QMK (or QMK-derived) firmware with per-key RGB control and the encoder / joystick / touch disc inputs mapped.
- A reproducible BOM under $40 in single-unit quantities.
- A configurator web app (linked in the post) for mapping keys and LED colours.
- A "runbook" Markdown that documents the agentic research workflow: what docs were ingested, what experiments were tried, what backtracking happened.
- Out of scope: a wireless / battery / OLED variant (those are explicitly future work in the post).

## Design Direction

The hardware is the design language: the same 13-key grid + encoder + joystick + touch disc layout as the original Codex Micro, with the LED band as the visual signature. The configurator is a small browser app (already linked) with a live preview of the board and drag-to-bind keys. The runbook is dense Markdown with diagrams, not a polished whitepaper.

## Constraints

- Must hit the I/O surface the post states: 13 keys, encoder, joystick, touch disc, optional LED band.
- BOM in single-unit quantities must stay around $40 as claimed.
- Hardware (KiCad + Gerbers) and firmware must be open source at a recognised licence.
- The runbook must be honest about what worked and what didn't, so it can be used as a template for similar agentic-EE problems.
