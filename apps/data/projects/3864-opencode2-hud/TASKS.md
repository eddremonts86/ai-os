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

## Phase 0: Scaffold

- [x] Read the capture and confirm it is a bare GitHub link plus a title-only claim
- [x] Write SPEC.md (this document)
- [x] Scaffold the sidecar repo and attach to a test opencode session
- [x] Enumerate the session events the HUD can observe

## Phase 1: Core

- [ ] Render model, current activity and elapsed time in a compact overlay
- [ ] Add tmux-aware placement (pane or status line)
- [ ] Verify the sidecar stays read-only and never disturbs the agent session

## Phase 2: Deploy

- [ ] Package an install path for opencode users
- [ ] Document supported terminals and session APIs
- [ ] Publish the repo with a demo recording
