---
id: "641"
slug: control-your-computer-with-one-hotkey
title: Control your computer with one hotkey
status: draft
source:
  name: manual
category: other
---
## Objective

A desktop app that turns Ctrl+Space into a single command surface: user says what they want, the app does it. The system is designed around reusable Skills (e.g. `/research-ai`) that can chain multiple actions — search Google, process results, send to Gmail, and other multi-step tasks — without the user driving each step.

## Target Users

Knowledge workers who want to compress multi-step desktop workflows (search → summarise → email; open site → draft message → launch; etc.) into a single hotkey invocation. The poster is the early adopter; the user base they're recruiting is whoever wants to "try it when it's ready".

## MVP Scope

- Global hotkey overlay (Ctrl+Space on macOS/Windows).
- Voice or text input capturing the user's intent.
- Skill registry with a small built-in set (research-ai-style workflow; site-launcher; email-drafter).
- Skill execution engine that can chain search → process → send.
- Minimal skill-authoring surface so users can define new reusable commands.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Must work across the user's open apps (the founder describes launching sites/profiles, drafting messages, and "full multi-step computer tasks").
- Latency has to feel hotkey-instant; the poster's framing depends on it being faster than the multi-click status quo.
- Permissions model has to be explicit per skill (search, send, type) — the poster's roadmap explicitly lists "opening websites, drafting messages".
