---
id: "002"
slug: need-a-super-simple-ai-agent-that-learns-by-watching-yo
title: "Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/0jcnxkipi1-need-a-super-simple-ai-agent-that-learns"
  captured: "2026-07-17"
category: ai
date: "2026-07-17"
tags: [AI, Productivity, Other]
country: USA
---

# Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (recorder dot, procedure library grid)
- [ ] Tauri project skeleton with code-signing config
- [ ] Rust↔Python IPC bridge using a Unix domain socket
- [ ] Decide on installer: signed .dmg via Sparkle vs. Mac App Store

## Phase 1: Core

- [ ] Event capture: clicks, keys, focus changes, clipboard snapshots — to `trace.json`
- [ ] Trace→Procedure: send trace to Claude, get 3–7 step proposal back
- [ ] Edit-steps UI: each step expandable, parameter slots highlighted
- [ ] Runner: replay a saved procedure with parameter slot fill-in
- [ ] Per-run log: success/fail per step, screenshot at each step, replay in app
- [ ] Procedure library: list, search, duplicate, delete, export-as-JSON
- [ ] Onboarding flow: permission pre-flight, one guided demo recording
- [ ] Telemetry (opt-in): procedure count, replay success rate, anonymized

## Phase 2: Deploy

- [ ] Notarize + sign the .dmg; ship Sparkle update channel
- [ ] Cloud sync (E2EE) for Pro tier; passphrase-derived key, no recovery
- [ ] Landing page + onboarding video
- [ ] Recruit 200 macOS users for beta (IndieHackers, HN, r/macapps)
- [ ] Set up billing via Stripe (Pro + Team tiers)
- [ ] Post-mortem at week 20