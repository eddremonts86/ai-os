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

## Tech Stack

- **Language:** TypeScript (strict) compiled to per-browser ES bundles.
- **Chromium browsers (Chrome, Edge):** Manifest V3 with a service worker for `chrome.action` toggling + a content script that mutates the live Search Results Page DOM. Permissions: `activeTab`, `scripting`, `storage`; no host permissions beyond `google.com/*`.
- **Firefox:** WebExtension API; uses `browser.*` namespace with Chrome-compatible fallbacks. Distribution: signed package via Mozilla AMO.
- **Safari:** WebExtension API on macOS; signed and notarized via Apple Developer ID.
- **Build:** a small TypeScript + esbuild pipeline that emits four browser-specific bundles plus a shared content-script bundle; CI runs a smoke test against a saved Google results HTML fixture.
- **Distribution:** Chrome Web Store, Edge Add-ons, Mozilla AMO, Safari Gallery (or direct signed download if Gallery is not feasible).
- **Release:** GitHub Releases with signed packages and SHA-256 checksums for direct download.

## Architecture

The extension has three logical pieces: (1) a content script injected on Google Search results pages that scans for `a[href*="google.com/goto?url="]`, resolves each via Google's own `/goto` endpoint, and replaces the anchor's `href` with the resolved real URL; (2) a service worker / background script that owns the on/off state and exposes a `browser.action` click handler to flip the state; (3) a popup or toolbar badge that surfaces the current state to the user (blue "ON" badge when rewriting is active). No server component; the only network call the extension makes is to Google's own `google.com/goto?url=…` to resolve.

```
Browser toolbar click ──▶ service worker toggles state (chrome.storage.local)
                                  │
                                  ▼
Content script reads state ──▶ on Google Search page
                                  │
                                  ▼
                  scan a[href*="google.com/goto?url="]
                                  │
                                  ▼
                  fetch Google /goto ──▶ real destination
                                  │
                                  ▼
                  anchor.href = real destination
                                  │
                                  ▼
                  hover, copy, middle-click all show real URL
```

## Milestones

1. **M0 — Core rewrite.** Content script that detects `/goto` anchors, resolves them, and rewrites `href`. End of week 1.
2. **M1 — Chrome MV3 packaging.** Manifest V3, service worker toggle, toolbar badge, load-unpacked install path; first Chrome Web Store submission. End of week 3.
3. **M2 — Firefox signed build.** WebExtension build for Firefox, signed via Mozilla AMO, listed in AMO. End of week 4.
4. **M3 — Safari notarized build.** WebExtension build for Safari, signed and notarized; Safari Gallery submission (or signed direct download if Gallery is not feasible). End of week 6.
5. **M4 — Edge Add-ons.** Submit the same MV3 build to Edge Add-ons. End of week 7.
6. **M5 — Hardening.** Automated fixture-based regression test (Google results HTML snapshot), telemetry-free verification, README updates, GitHub Releases with checksums. End of week 8.

## Risks

- **Manifest V3 service-worker lifecycle.** Chrome can suspend the service worker at any time; the toggle state must persist in `chrome.storage.local` and the content script must read state synchronously, not assume a running background page.
- **Google layout changes.** Google Search DOM mutates frequently (class names, result containers, ad placements); the rewrite must run on a MutationObserver in addition to the initial scan, or new results appended below the fold will leak the `/goto` form.
- **Safari distribution friction.** Safari notarization and the Safari Gallery have historically been slow or opaque for new publishers; if Gallery is not feasible, the plan falls back to signed direct downloads with checksums, documented in the README.
- **Google rate-limiting `/goto` resolutions.** If Google rate-limits or adds a no-rewrite header to extension-issued `/goto` requests, the extension needs a fallback: cache resolved URLs in `chrome.storage.local` keyed by the `/goto` URL with a TTL.
- **Firefox / Safari API drift.** `browser.*` and `chrome.*` diverge on `scripting.executeScript` and on `tabs` permissions; the build pipeline must emit per-browser shims, not a single cross-browser polyfill.
- **Show HN credibility window.** The thread will be judged on whether the extension demonstrably rewrites links in a screenshot or short clip; the GitHub repo must ship the v1.0 build (or a loadable unpacked build) on day one of the post.
