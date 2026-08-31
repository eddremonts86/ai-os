---
id: "3810"
slug: scripttap-no-root-android-automation-with-an-ai-script-
title: ScriptTap – no-root Android automation with an AI script contract
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496001"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Android automation engine, JSON script contract, AI agent integration, ADB bridge, image and pixel screen matching, Tasker intent interop]
---
# ScriptTap – no-root Android automation with an AI script contract

## Value Proposition

Automation that is easy to create and cheap to repeat. ScriptTap splits the work the way the author wishes AI agents worked: an AI (ChatGPT, Claude, Codex) writes a .scripttap.json once against a documented contract, the user reviews it once, and the deterministic script then runs on the phone as many times as needed — no tokens burned per execution and no fresh mistakes per run. The runtime is screen-aware, so scripts can find images and UI elements, watch for pixel-color changes, and drive capture-analyze-tap-text-entry loops, and scripts surface as home-screen shortcuts callable from Tasker, MacroDroid, Automate and Samsung Routines. The author's own stress test is a workflow with roughly 5,000 commands.

**One-liner:** No-root Android automation where AI writes a reviewed JSON script once and the phone runs it deterministically forever.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Automation power users | Complex flows without the learning curve the author says simple tools lack. |
| AI agent operators | A script artifact the agent can push over ADB, inspect, run and refine. |
| Non-rooted tinkerers | Screen-aware image and pixel automation on stock Android. |
| Tasker and MacroDroid users | ScriptTap scripts as invokable shortcuts inside their existing automation graphs. |

The post describes the tool's design rather than a commercial market.

## Jobs To Be Done

1. **Functional job** — Let an AI generate a valid automation script from a natural-language request.
2. **Functional job** — Import, inspect and edit that script in the app, then run it against the real device state.
3. **Functional job** — Expose reviewed scripts as home-screen shortcuts callable via deep link, intent or ADB.
4. **Emotional job** — Trust the automation: one reviewed script beats a fresh AI guess on every run.

## Success Metrics

- **Script reuse:** runs per script across sessions — the core claim is write-once, run-many.
- **AI round-trips saved:** token spend avoided by reusing reviewed scripts instead of re-delegating to an agent per run.
- **Large-script headroom:** workflows at the author's tested scale (around 5,000 commands) complete within run-log limits.
- **Interop breadth:** successful invocations from each named partner tool (Tasker, MacroDroid, Automate, Samsung Routines).
- **Determinism rate:** share of runs whose only variance is observed device state, matching the author's stated design.

## Pricing & Monetization

None stated in the post. The capture describes the contract and the runtime, not a business model.

## Competitive Landscape

The author does not name competitors directly, but describes the two categories he is positioning between: powerful-but-hard tools (the Tasker class) and simple-but-limited ones. He explicitly names Tasker, MacroDroid, Automate and Samsung Routines as integration partners rather than rivals. The differentiator is the AI script contract itself: a JSON schema plus ADB bridge that makes the automation machine-writable by coding agents.

## Risks & Open Questions

- [ ] Scripts are deterministic but their outcomes depend on device state; flaky UI timing could still break reviewed scripts.
- [ ] The contract's authority rests on external agents respecting scripttap.com/ai as source of truth, which ScriptTap cannot enforce.
- [ ] Screen-aware primitives (image matching, pixel detection) are sensitive to theme changes, resolution and Android version updates.
- [ ] Large-script support is claimed from a single author's testing; no community results exist in the capture.
- [ ] No pricing or distribution story beyond the Play Store link is stated.
