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

## Problem

This Show HN capture is a bare link to github.com/ndom91/opencode-hud; the product claim comes from the title, "OpenCode2 HUD". The project is a heads-up display for the opencode coding agent: an overlay that surfaces live session state — the current task, the model in use, activity and elapsed time — while the agent runs in the terminal, without the developer scrolling the transcript or switching panes. Everything beyond that premise (which events the HUD shows, how it attaches, which terminals it supports) is unstated in the capture.

## Objective

Build the HUD the title claims: a terminal overlay that renders opencode session status at a glance. The MVP attaches to a running opencode session and shows the essential state — model, current activity, elapsed time — in a compact overlay, without disturbing the agent.

## Target Users

- opencode users who want session status at a glance instead of transcript scrolling.
- Terminal-heavy developers running long agent sessions while working elsewhere.
- Tooling tinkerers who extend opencode with sidecar utilities.

## MVP Scope

- Session attachment: connect to a running opencode session.
- HUD rendering: compact status with model, current activity and elapsed time.
- Terminal placement: overlay or status-line mode, tmux-aware.
- Read-only observation: the HUD watches but never steers the agent.

## Constraints

- The capture is a bare repo link; the HUD's exact feature set is unstated.
- Read-only observation is the safe scope; steering or editing the agent is out of the MVP.
- The HUD must coexist with opencode's own terminal UI without fighting for the screen.

## Design Direction

See `DESIGN.md` for this project's design tokens.
