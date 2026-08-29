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

## Tech Stack

- **Language:** TypeScript (strict) compiled to per-browser ES bundles.
- **Chrome / Edge:** Manifest V3 with a service worker for cross-tab state and a content script injected on the LinkedIn routes (`/feed`, `/notifications`, `/messaging`, `/search`).
- **Firefox:** WebExtension build with `browser.*` namespace; signed and submitted to Mozilla AMO.
- **Local storage:** IndexedDB (via a thin wrapper like `idb`) for activity counters and history; the encryption layer for sync uses WebCrypto `AES-GCM` with a key derived from the user's passphrase via `PBKDF2`.
- **Cloud sync (Pro):** a small Node.js + TanStack Start server holding only ciphertext blobs keyed by user ID; passphrase never reaches the server; the recovery story is "no passphrase = no recovery" by design.
- **Risk engine:** a deterministic rule scorer (no LLM call required) running entirely in the content script; the patterns are a curated TypeScript module maintained alongside the extension.
- **Build:** TypeScript + esbuild for per-browser bundles, Vitest for unit tests, Playwright for the LinkedIn-feed fixture regression test.
- **Distribution:** Chrome Web Store, Edge Add-ons, Mozilla AMO (Firefox), GitHub Releases with signed packages and checksums.

## Architecture

The content script injects a small HUD into the LinkedIn top bar (semantic-anchored, not class-anchored) and observes LinkedIn DOM events via a single `MutationObserver` per page. Each observed event increments a counter in IndexedDB; a per-day rollup is computed at session end and the risk engine scores the current session against the curated patterns. The HUD updates green → yellow → red; the user can click to see which counter triggered the warning. Cloud sync (Pro) is opt-in and end-to-end encrypted: the content script encrypts locally before upload, the server stores ciphertext only.

```
LinkedIn page DOM event ─▶ MutationObserver (content script)
                                       │
                                       ├─▶ classify (comment / post / view / connect / search / message)
                                       │
                                       └─▶ IndexedDB counter++  (per-day, per-action)
                                                       │
                                                       ▼
                                          Risk engine (rule scorer, in-process)
                                                       │
                                                       ├─▶ green   (under thresholds)
                                                       ├─▶ yellow  (approaching thresholds)
                                                       └─▶ red     (likely to trigger lock)
                                                       │
                                                       ▼
                                          HUD top-bar indicator ─▶ click ─▶ detail panel

End of session ─▶ daily summary toast (opt-in)
                          │
                          └─▶ if Pro + opt-in ─▶ encrypt ─▶ cloud sync (ciphertext only)
```

## Milestones

1. **M0 — Counter MVP.** Content script counts comments, posts, profile views, connection requests, searches, message sends, all to IndexedDB; HUD shows green by default. End of week 2.
2. **M1 — Risk engine.** Curated pattern library, rule scorer, green/yellow/red HUD transitions, click-to-detail. End of week 4.
3. **M2 — Chrome Web Store.** Manifest V3 packaging, store listing with screenshots and a "this is a radar, not a bot" explainer. End of week 5.
4. **M3 — Firefox + Edge.** WebExtension builds for Firefox (signed) and Edge Add-ons. End of week 7.
5. **M4 — Pro + sync.** Stripe Subscriptions, WebCrypto passphrase flow, ciphertext-only cloud sync, opt-in calibration against the user's prior lock history. End of week 10.
6. **M5 — Pilot.** 25 PR / founder workspaces onboarded; weekly calibration review for 6 weeks. End of week 16.

## Risks

- **LinkedIn UI churn.** LinkedIn ships class-name and route changes weekly; selectors that work today break tomorrow. Mitigation: semantic selectors + a saved LinkedIn feed fixture under Playwright regression; any selector change must be reflected in the fixture before merge.
- **ToS misclassification.** The extension must not be marketed or perceived as automation; if LinkedIn's store-review or anti-abuse team classifies it as a bot tool, the Chrome Web Store listing can be removed. The store listing must lead with "warning system / radar" and the README must explicitly say "no automation."
- **Calibration drift.** The curated pattern library can become stale if LinkedIn changes its anti-abuse heuristics; opt-in user feedback ("did this red session result in a lock?") must feed a quarterly pattern review, or the meter's predictive value decays.
- **Sync passphrase loss.** End-to-end encryption means a forgotten passphrase = lost history; this is the correct security posture but must be communicated clearly during signup or the first support ticket will be a refund request.
- **Cross-tab counting.** Multiple LinkedIn tabs (feed + notifications + search) must count as one session, not three; the content script needs a shared counter via the service worker, not per-tab local state.
- **Show HN credibility.** If the launch lands before M2, the meter must demonstrably turn yellow / red on a recorded LinkedIn session, or the credibility claim falls apart.
