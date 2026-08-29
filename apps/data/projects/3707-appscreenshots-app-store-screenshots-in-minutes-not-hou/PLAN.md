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

## Tech Stack

- **Front end:** Astro + TypeScript for the marketing site, React + TypeScript for the editor (drag-and-drop text, image, device-frame placement). The editor is where state is heavy; the marketing site is where rendering should be static.
- **Rendering pipeline:** A separate service that takes a template + design input + locale and produces a sized asset bundle. The pipeline needs to honour every device spec the stores publish (iPhone 6.9" 1320×2868, iPad 13" 2064×2752, Android phone 16:9 2160×3840, Apple Watch, Android tablet).
- **Templates:** 150+ customisable templates authored as JSON descriptors (frame, text slots, image slots, font choices) — not hard-coded HTML, so a new device spec or a new template is one config change.
- **DB:** Postgres for users, projects, and template metadata; object storage for source uploads and rendered outputs.
- **Localisation:** A locale pack system that resolves font + direction (LTR/RTL) + numeric format per locale at render time, with CJK and Arabic fallbacks named explicitly.

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) is not used. The product is editor + rendering service + marketing site; the build target is a SPA-style editor + a worker-rendered asset pipeline, not a self-hosted VM.

## Architecture

```
                    ┌────────────────────────┐
                    │  appscreens.com        │
                    │  - marketing           │
                    │  - templates catalog   │
                    │  - editor (React)      │
                    └──────────┬─────────────┘
                               │ render request
                               ▼
                    ┌────────────────────────┐
                    │  Render service        │
                    │  - template + input    │
                    │  - locale pack         │
                    │  - per-device sizes    │
                    │  - PNG output          │
                    └──────────┬─────────────┘
                               │
                               ▼
                    ┌────────────────────────┐
                    │  Object storage        │
                    │  - source uploads      │
                    │  - rendered outputs    │
                    │  - per-locale bundles  │
                    └────────────────────────┘
```

The editor is the user-facing surface; the render service is the heavy work. A render request returns a sized bundle per device per locale, named and organised for direct upload to App Store Connect and Google Play Console.

## Milestones

1. **M0 — Marketing site + template catalog** (already live at `appscreens.com`) — "150+ fully customizable templates", 5-screenshot free tier, no card required.
2. **M1 — Editor and core render pipeline** (already live) — drag-and-drop placement, one design input → every required device size.
3. **M2 — Localisation** — re-render the same project in every locale, with RTL and CJK font fallbacks honoured.
4. **M3 — Store-direct export bundle** — per-locale, per-device asset bundle ready for App Store Connect / Google Play Console upload.
5. **M4 — Template marketplace** (implied by 150+ templates) — paid templates and a creator revenue split, if the team chooses to ship a marketplace.

## Risks

- **Apple and Google spec drift.** The canvas-size matrix changes. The MVP needs a published spec-versioned device matrix and a regression test that asserts each render matches the current spec.
- **RTL and locale font failure.** A template that hard-codes English silently breaks Arabic and Hebrew layouts. The MVP needs an RTL-aware template engine and a CJK font fallback before claiming "every locale" support.
- **Free-tier abuse.** 5 free screenshots is a marketing number; per-email and per-IP rate limits are required to keep the funnel economics honest.
- **12.6M existing exports.** A migration that breaks existing projects is the worst-case regression. The MVP needs a project-format version and a migration path that loads every existing project into the new editor without losing the rendered outputs.
- **Pricing unstated.** No paid tier is named in the source. The pricing shape is an open question the post leaves for the team.
