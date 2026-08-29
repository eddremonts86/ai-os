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

## Problem

Shipping an iOS or Android app means producing screenshots at every required size — iPhone 6.9" (1320×2868), iPad 13" (2064×2752), Android phones (2160×3840), Android tablets, Apple Watch — across every locale you ship. Doing that by hand in Figma or Photoshop is the explicit pain the product frames itself against.

The landing page is direct: "Create App Store and Google Play screenshots in minutes. Design once, localize, generate every required iOS & Android size, and upload directly to the stores." The numbers on the same page make the value measurable — "149,967+ app professionals use AppScreens. 12,615,607 screenshots exported. ≈78,847 developer days saved." The footer adds the operating details — "5 app store screenshots free · No card required", "150+ fully customizable templates", and the canvas sizes listed by device class.

The product ships under the business name "Salty Bytes Pty Ltd" (Australian), and the bottom of the page lists the iOS / Android / iPad / Watch / Android Tablet size matrix. App Store screenshots is the entire product surface; this is not a generic design tool.

## Objective

Replace the Figma-or-Photoshop build of every-locale App Store screenshot set with a templated, automated pipeline — one design input, every required size, every locale, ready to upload.

## Target Users

1. **Indie iOS and Android developers** — anyone shipping an app who has to produce a full screenshot set in seven sizes for every locale, and resents doing it by hand.
2. **App studio teams and agencies** — anyone producing app-store creative for clients at scale, where consistency across an app portfolio matters more than per-app polish.
3. **Localization and ASO specialists** — anyone who has to ship a screenshot set in 10+ languages and keep the visual frame consistent.

## MVP Scope

- Templates: 150+ fully customizable templates covering the common App Store / Play Store layouts.
- One design input → every required device size (iPhone 6.9", iPad, Android phone, Android tablet, Apple Watch).
- Localisation: re-render the screenshot set in every locale the developer ships.
- Direct upload: produce a sized, named, store-ready asset bundle per device per locale.
- Free tier: 5 screenshots, no card required.
- Out of scope for MVP: video previews, app-icon generation, store metadata writing, ASO keyword research.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The free tier is the marketing surface — "5 app store screenshots free · No card required". Any friction in that funnel breaks the lead magnet.
- Output must match Apple's and Google's published dimension and aspect-ratio specs exactly; a wrong size means an App Store rejection.
- Localisation has to honour text-direction (RTL for Arabic / Hebrew) and locale-specific font rules; a template that hard-codes English fails on shipping.
- The product already has 149,967 users and 12.6M exports; the MVP cannot regress the rendering pipeline or break existing user projects.
