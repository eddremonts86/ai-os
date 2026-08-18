---
id: "3007"
slug: does-anyone-else-feel-like-nothing-matters-anymore
title: Does anyone else feel like nothing matters anymore?
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340013"
category: ask-hn
date: "2026-08-18"
tags: [Ask HN, Problem]
---
# Does anyone else feel like nothing matters anymore?

## Phase 0: Scaffold

- [ ] Create project folder `apps/3007-does-anyone-else-feel-like-nothing-matters-anymore/`
- [ ] Initialize git repo and commit a clean tree
- [ ] Initialize Vite with a vanilla TS template (no React, no Vue)
- [ ] Wire design tokens from DESIGN.md into `tokens.css`
- [ ] Set up a hash-router for the three screens: capture, timeline, weekly
- [ ] Add a minimal README and a CONTRIBUTING note that the project intentionally has no server

## Phase 1: Core

- [ ] Implement IndexedDB wrapper (open, put, getAll, delete) with versioned schema migrations
- [ ] Implement the capture screen: record button, MediaRecorder start/stop, text caption input, tag picker
- [ ] Persist entries (blob + caption + tags + timestamp) to IndexedDB on capture
- [ ] Implement text-only fallback path when microphone permission is denied or unavailable
- [ ] Build the timeline screen: list entries newest-first, click to play back audio
- [ ] Add tag filter chips and a date-range picker to the timeline
- [ ] Build the weekly summary screen: count entries by tag over the last seven days, render as a hand-drawn SVG bar chart
- [ ] Add an "export all entries as JSON" button so users can leave with their data
- [ ] Add a service worker and web manifest so the app installs as a PWA
- [ ] Dogfood for two weeks, log any friction, and only then decide whether to add a feature

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Set up a static host (Netlify or personal server)
- [ ] Add CI to lint and type-check on every push
- [ ] Verify the deployed bundle works offline after first load
