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

## Problem

The author, Romka2x, built ScriptTap because years of using Android automation tools taught him they fall into two camps: powerful but difficult to learn, or simple but too limited. ScriptTap is meant to combine both — easy to use, and capable of complex automation. The core idea is a machine-readable contract: a compatible AI (he names ChatGPT, with scripttap.com/ai as the source of truth) returns a .scripttap.json file that imports directly into the app, and coding agents such as Codex or Claude can use ScriptTap's ADB bridge to create scripts on an ADB-connected device, then inspect, run and refine them there. A stated major goal is reducing unnecessary AI usage: the AI writes or modifies a workflow once, the reviewed script is reused forever, and script logic executes deterministically while results may depend on device state. Scripts can be exposed as home-screen shortcuts and invoked via shortcut, deep link, intent or ADB, integrating with Tasker, MacroDroid, Automate and Samsung Routines. The engine is screen-aware: scripts locate images and UI elements, detect pixel-color changes, work with files and variables, and perform capture-then-analyze-then-tap or text-entry flows with detailed run logs; the author has tested workflows of roughly 5,000 commands. The capture links the Play Store listing at com.scripttap.

## Objective

Productize the contract-based loop: an on-device automation runtime plus a JSON schema that AI agents can generate, review and reuse, so complex Android automation costs one AI round-trip instead of one per run.

## Target Users

- Automation power users who hit the ceiling of simple tools but do not want a Tasker-level learning curve.
- AI-agent operators (ChatGPT, Claude Code, Codex) who want deterministic device automation from a script artifact.
- Tinkerers without root who still want screen-aware, image-based automation.

## MVP Scope

- Script runtime executing .scripttap.json files on a non-rooted device.
- Intuitive in-app editor for creating and inspecting scripts.
- ADB bridge so coding agents can push scripts to a connected device and run them.
- Screen-aware primitives: image and UI-element location, pixel-color detection, capture, analysis, taps, text entry.
- Home-screen shortcut export plus intent and deep-link invocation for Tasker, MacroDroid, Automate and Samsung Routines.
- Detailed run logs and support for large scripts (tested around 5,000 commands).

## Constraints

- No root required: the engine must stay within Android's non-root automation surfaces.
- Determinism split: script logic runs deterministically; outcomes depend on observed device state, which the author states explicitly.
- The AI contract depends on external agents honoring scripttap.com/ai as the source of truth — outside the app's control.
- Claims about 5,000-command workflows are the author's own testing, not independent benchmarks.

## Design Direction

See `DESIGN.md` for this project's design tokens.
