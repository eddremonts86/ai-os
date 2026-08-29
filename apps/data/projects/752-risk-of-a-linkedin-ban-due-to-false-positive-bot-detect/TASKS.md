---
id: "752"
slug: risk-of-a-linkedin-ban-due-to-false-positive-bot-detect
title: "Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that warns about suspicious activity to avoid losing 11,500 followers."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/p1ecr48041-risk-of-a-linkedin-ban-due-to-false-posi"
category: marketing
date: "2026-03-26"
tags: [Marketing, Security, Productivity, AI, Other]
country: UK
tech: [TypeScript browser extension (Chrome MV3, Edge, Firefox), Manifest V3, LinkedIn DOM observers, IndexedDB local storage, optional cloud sync with end-to-end encryption]
---
# Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that warns about suspicious activity to avoid losing 11,500 followers.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (HUD states green/yellow/red, detail panel, daily summary toast, store-listing screenshots)
- [ ] Set up TypeScript + esbuild + Vitest + ESLint
- [ ] Wire three browser-target build pipeline (chrome, edge, firefox)
- [ ] Add a saved LinkedIn feed HTML fixture for Playwright regression
- [ ] Curate the initial pattern library from public post-mortems (LinkedIn help forums, community write-ups); document the source for each pattern in `patterns.ts`

## Phase 1: Core

- [ ] Content script: `MutationObserver` on LinkedIn `/feed`, `/notifications`, `/messaging`, `/search`; semantic selectors only
- [ ] Classify events into comments, posts, profile views, connection requests, searches, message sends
- [ ] IndexedDB counters (per-day, per-action) with cross-tab coordination via the MV3 service worker
- [ ] Risk engine: deterministic rule scorer over the curated patterns; outputs a level (green / yellow / red) and the triggering counters
- [ ] HUD overlay in the LinkedIn top bar; green / yellow / red indicator; click-to-detail panel
- [ ] Daily summary toast at end of LinkedIn session (opt-in)
- [ ] Manifest V3 packaging + Chrome Web Store submission with "warning system / radar" lead
- [ ] WebExtension builds for Edge (Add-ons) and Firefox (signed, AMO)
- [ ] Playwright regression test: load saved LinkedIn feed fixture, simulate events, assert counters + HUD transitions
- [ ] Pro track: Stripe Subscriptions ($19/month or $129 one-time) + 14-day trial
- [ ] Passphrase-derived encryption (PBKDF2 + AES-GCM via WebCrypto) for opt-in cross-device sync
- [ ] Ciphertext-only cloud sync against a small Node.js + TanStack Start backend
- [ ] Opt-in calibration against the user's prior lock history ("did this red session result in a lock?") — feeds a quarterly pattern review
- [ ] End-to-end test: install extension, run a high-volume LinkedIn session, observe yellow → red transition, confirm no LinkedIn-side automation fires

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 25 pilot workspaces (PR builders, founders, devRel)
- [ ] Weekly calibration review with the pilot cohort for 6 weeks
- [ ] Quarterly pattern-library review based on opt-in lock-history feedback
- [ ] Set up status page + LinkedIn-DOM-change monitoring (community trackers, LinkedIn dev forums)
- [ ] Post-mortem after week 16; decide v2 scope (Agency tier, additional platforms beyond LinkedIn)
