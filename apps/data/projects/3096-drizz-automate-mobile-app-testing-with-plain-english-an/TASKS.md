---
id: "3096"
slug: drizz-automate-mobile-app-testing-with-plain-english-an
title: Drizz – Automate mobile app testing with plain English and Vision AI
status: draft
source:
  name: BetaList
  url: "https://betalist.com/startups/drizz?utm_campaign=startup-184122&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Drizz – Automate mobile app testing with plain English and Vision AI

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3096-drizz-automate-mobile-app-testing-with-plain-english-an/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Desktop app (TanStack Start + React): plain-English test editor + local app upload + single-device local run
- [ ] Vision AI layer: plain-English step + screenshot → device action (tap / swipe / type / scroll). Validate against 50 UI patterns.
- [ ] Device driver bridge: iOS + Android (WebDriver / Appium-style). Plain-English round-trips through vision → driver → device.
- [ ] Self-healing: compare past successful action against current UI, re-locate when shifted. Heal-audit row per recovery.
- [ ] Cloud device fleet: real iOS + Android, parallel run scheduling, run history + artifact storage
- [ ] Workspace + suite + run management API (TanStack Start + SQLite/Drizzle)
- [ ] Debuggable failure reports: step-by-step trace with screenshots + interpreted action + actual UI element + heal audit
- [ ] CI/CD integration: GitHub Actions + GitLab CI surfaces, status reports + run artifact links

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
