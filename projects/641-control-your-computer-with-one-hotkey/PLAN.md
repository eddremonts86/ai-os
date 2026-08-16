---
id: "641"
slug: control-your-computer-with-one-hotkey
title: Control your computer with one hotkey
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Electron or Tauri for cross-platform desktop; a local agent runtime that drives the OS through documented APIs (Accessibility/UI Automation) plus LLM orchestration; skill storage in a local SQLite/JSON; cloud backend for any LLM calls (no on-device model requirement stated).

## Architecture

Global hotkey listener → overlay UI → intent parser → skill registry → execution engine → OS automation + LLM calls → result toast or follow-up prompt. Skills are pure functions the engine composes at runtime.

## Milestones

- [ ] Hotkey overlay + intent capture (text-first)
- [ ] Skill registry with 3 built-in skills (search-summarise-email, site-launcher, message-drafter)
- [ ] Permission prompt UI per skill
- [ ] Skill-authoring format and runtime loader
- [ ] Telemetry for skill-run success / cancellation
- [ ] macOS + Windows packaging

## Risks

- Cross-platform permission and accessibility-API differences are the biggest technical risk.
- Scope creep into "general computer-use agent" can balloon the build — keep the MVP three skills.
- Onboarding depends on the user trusting the permission UI; under-explain and adoption stalls.
