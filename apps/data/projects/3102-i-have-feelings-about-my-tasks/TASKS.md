---
id: "3102"
slug: i-have-feelings-about-my-tasks
title: I have feelings about my tasks
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49446769"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Productivity, B2C]
tech: [TypeScript, browser-only drag-and-drop, Google OAuth, serverless persistence]
---
# I have feelings about my tasks

## Phase 0: Scaffold

- [ ] Stand up the single-page app with the chosen framework (Svelte or Solid).
- [ ] Write SPEC.md (this document).
- [ ] Set up the static host (Cloudflare Pages or the founder's own domain).
- [ ] Decide on the cardboard-box visual: a small SVG library or hand-rolled SVG with a CSS-based shadow.

## Phase 1: Core

- [ ] Implement the room view: floor + desk + boxes, rendered from a single state object.
- [ ] Implement drag-and-drop on desktop (HTML5 native).
- [ ] Implement the per-box clock: `startedAt` / `stoppedAt` timestamps, compute the total on render, update every second.
- [ ] Implement localStorage persistence keyed by a room id in the URL hash.
- [ ] Implement Google sign-in via Google Identity Services.
- [ ] Implement the server-side persistence layer (Cloudflare Worker + Turso).
- [ ] Implement the anonymous-to-signed-in room migration.
- [ ] Add the "exactly one box on the desk" default with a settings toggle.
- [ ] Write tests: clock-rendering tests across timezone changes; persistence tests across reloads; migration tests.

## Phase 2: Deploy

- [ ] Ship to the static host and verify the no-sign-up path works in under 10 seconds.
- [ ] Verify Google sign-in works end-to-end on macOS, Windows, Linux, iOS Safari, Android Chrome.
- [ ] Add basic mobile touch support for drag-and-drop if time permits (else document the v2 plan).
- [ ] Watch HN for the response to "should the desk hold exactly one box?" and update the default if needed.
