---
id: "3693"
slug: restore-real-urls-in-google-search-results
title: Restore real URLs in Google Search results
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484118"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [JavaScript browser extension (Chrome MV3, Edge, Firefox WebExtension, Safari), Manifest V3 service worker, TypeScript]
---
# Restore real URLs in Google Search results

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Define DESIGN.md (toolbar icon states, popup chrome, badge color, GitHub Pages hero)
- [ ] Set up TypeScript + esbuild + Vitest + ESLint
- [ ] Wire four browser-target build pipeline (chrome, edge, firefox, safari) with shared content-script bundle
- [ ] Add a saved Google results HTML fixture for regression tests
- [ ] Confirm permission set is `activeTab`, `scripting`, `storage`, `host_permissions: ["https://www.google.com/*"]`

## Phase 1: Core

- [ ] Content script: scan `a[href*="google.com/goto?url="]` on Google Search pages; resolve via `fetch` to Google's own `/goto`; replace anchor `href` with the resolved URL
- [ ] MutationObserver on the results container so newly appended results are rewritten in place
- [ ] Service worker (MV3) owns on/off state in `chrome.storage.local`; `chrome.action.onClicked` flips state
- [ ] Toolbar badge: blue "ON" when rewriting is active, no badge when off; icon swap on click
- [ ] Firefox build with `browser.*` namespace + Chrome-compatible fallbacks; signed and submitted to Mozilla AMO
- [ ] Safari build signed + notarized via Apple Developer ID; Safari Gallery submission (or signed direct download)
- [ ] Edge build submitted to Edge Add-ons (same MV3 bundle as Chrome)
- [ ] Chrome Web Store submission with screenshots and a 30-second demo clip
- [ ] GitHub Releases page with four signed packages and SHA-256 checksums
- [ ] Automated regression test: load the saved fixture, run the content script, assert ≥ 95% of `/goto` anchors are rewritten
- [ ] End-to-end smoke test: load a real Google results page in a headless Chromium, install the unpacked extension, and verify the clipboard receives the real destination URL on copy

## Phase 2: Deploy

- [ ] Post Show HN follow-up linking the v1.0 release with the GitHub Release URL and the Chrome Web Store listing
- [ ] Triage store reviews and GitHub issues for the first 4 weeks; publish a weekly status note
- [ ] Decide v1.1 scope (multi-engine coverage beyond Google; cached-resolved-URL store) based on install telemetry and issue volume
- [ ] Collect at least 3 independent reviews / mentions (HN comments, blog posts, store reviews) within 12 weeks
