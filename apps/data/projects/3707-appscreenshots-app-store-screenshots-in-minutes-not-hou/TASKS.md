---
id: "3707"
slug: appscreenshots-app-store-screenshots-in-minutes-not-hou
title: "AppScreenshots – App Store screenshots in minutes, not hours"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49486667"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
country: Australia
tech: [Astro, TypeScript, Postgres, image-rendering pipeline]
---
# AppScreenshots – App Store screenshots in minutes, not hours

## Phase 0: Scaffold

- [x] Marketing site at `appscreens.com` with template catalog.
- [x] Editor live with drag-and-drop text, image, and device-frame placement.
- [x] 149,967+ users, 12,615,607 exports to date.
- [x] Free tier: 5 screenshots, no card required.
- [ ] Decide on the rendering pipeline shape: a single render service vs per-locale / per-device worker pool.
- [ ] Decide on the storage backend for source uploads and rendered outputs.

## Phase 1: Core

- [ ] Per-device matrix versioned by spec date (iPhone 6.9" 1320×2868, iPad 13" 2064×2752, Android phone 16:9 2160×3840, Apple Watch, Android tablet) — every render checks the current spec version.
- [ ] RTL-aware template engine: text slots must respect direction; layout must mirror for Arabic / Hebrew.
- [ ] CJK font fallback: at least one CJK font available per project, with fallbacks named.
- [ ] Per-locale render: one design input → every locale in the project's locale set, with font and direction resolved per locale.
- [ ] Store-direct export bundle: per-device, per-locale asset bundle named for direct upload to App Store Connect and Google Play Console.
- [ ] Free-tier rate limit: per-email and per-IP cap on the 5-screenshot tier.
- [ ] Tests:
 - Spec regression: assert every rendered output matches the current canvas matrix.
 - RTL regression: assert Arabic / Hebrew layouts mirror correctly.
 - CJK regression: assert CJK characters render with the configured font, not a fallback `?` box.
 - Migration regression: assert a project from the previous editor version loads cleanly in the new editor with all rendered outputs intact.

## Phase 2: Deploy

- [ ] Postgres in production for users, projects, and template metadata.
- [ ] Object storage in production for source uploads and rendered outputs.
- [ ] Render service in production, with a queue for batch renders (one project at 10 locales × 7 devices is 70 renders).
- [ ] Smoke test in production: take a sample project, render every locale × every device, verify the bundle uploads cleanly to a sandbox App Store Connect and Google Play Console.
- [ ] Free-tier funnel test: confirm the 5-screenshot path works without a card and the upgrade path surfaces paid templates cleanly.
