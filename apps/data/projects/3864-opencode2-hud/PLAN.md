---
id: "3864"
slug: opencode2-hud
title: OpenCode2 HUD
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500245"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Terminal overlay, OpenCode session hooks, Agent telemetry display, tmux-aware placement, Read-only sidecar, Status-line widgets]
---
# OpenCode2 HUD

## Tech Stack

Chosen for a sidecar overlay that must stay out of the agent's way; the capture names no libraries.

- **Terminal UI library:** compact overlay and status-line rendering.
- **OpenCode session hooks:** subscription to live session events.
- **Low-overhead status polling:** refresh without stealing the terminal.
- **tmux-aware placement:** pane or status-line targeting.
- **Read-only event subscription:** observation only, no commands issued.

## Architecture

- **Sidecar process:** subscribes to opencode session events out of band.
- **Renderer:** draws the compact HUD (model, activity, elapsed).
- **Placement layer:** overlay or status line, tmux-aware.
- **Read-only boundary:** no command path from HUD to agent exists.

## Milestones

1. **M0 — Attach and print.** A sidecar attaches to an opencode session and prints its state to stdout.
2. **M1 — Real overlay.** Compact HUD rendering with model and current activity.
3. **M2 — Placement modes.** tmux-aware overlay and plain-terminal status line both work.
4. **M3 — Public release.** Docs and an install path for opencode users ship.

## Risks

- **Fragile integration:** opencode session APIs may change and break the subscription.
- **Rendering collisions:** the HUD and the agent's own TUI share one terminal.
- **Small audience:** value is tied to opencode adoption.
