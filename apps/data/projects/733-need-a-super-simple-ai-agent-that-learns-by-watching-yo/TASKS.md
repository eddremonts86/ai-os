---
id: "733"
slug: need-a-super-simple-ai-agent-that-learns-by-watching-yo
title: Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/0jcnxkipi1-need-a-super-simple-ai-agent-that-learns"
  captured: "2026-07-17"
category: ai
date: "2026-07-17"
tags: [AI, Productivity, Other]
country: USA
wtp:
  raw: $10–30/month
  currency: USD
  min: 10
  max: 30
  period: month
  mrrMid: 20
tech: [Electron, Node.js, OS-level screen capture (DXGI on Windows, CoreGraphics on macOS), screenpipe-style local frame+audio pipeline, OpenAI/Anthropic vision LLMs, local-only SQLite history]
---
# Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/733-need-a-super-simple-ai-agent-that-learns-by-watching-yo/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Electron app boots on Windows and macOS with a single "Record a routine" button on the home screen
- [ ] Capture service subscribes to OS-level screen frames (DXGI / CoreGraphics) and accessibility events (UIA / AXUI); rolling 24h SQLite index of timestamped frames and events
- [ ] Click-to-stop recording produces a routine with a step list derived from accessibility events (not pixels)
- [ ] Replay engine runs the recorded routine against the same accessibility hooks; first three runs of a new routine require per-step confirmation
- [ ] LLM adapter behind an internal interface, with a vision model for routine-step labelling and a smaller text model for "fix it" corrections
- [ ] Natural-language "fix it" prompt on a failed step: user describes what they wanted, the LLM proposes a re-segmentation, the user approves before the change is saved
- [ ] Cloud-opt-in toggle per routine; the default for new installs is local-only
- [ ] Real "install and forget" smoke: a non-technical pilot user records a routine, closes the app, reopens the next day, replays the routine without opening settings
- [ ] End-to-end test: record a routine across two apps (browser + spreadsheet), replay it twice, force one app update between replays, measure which steps still work

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 30 non-technical pilot users
- [ ] Set up status page + crash reporter for the desktop app
- [ ] Privacy policy and screen-recording consent copy reviewed by counsel
- [ ] Post-mortem after week 13 with pilot cohort
