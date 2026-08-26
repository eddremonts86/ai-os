---
id: "2808"
slug: dashi-a-214kb-chrome-new-tab-dashboard-with-no-servers-
title: Dashi – a 214KB Chrome new tab dashboard with no servers or analytics
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49419837"
category: show-hn
date: "2026-08-24"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Dashi – a 214KB Chrome new tab dashboard with no servers or analytics

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built out this dashboard for my own use since I was getting sick and tired of constantly checking multiple apps when all I really need is a quick glance. As more and more use-cases sprung up, I kept adding new features and it grew to what it is now. I find it very useful and thought I should share it.dashi is a widget dashboard on your new tab. Currently 17 widgets... notes, to-dos, history, weather, world clocks, countdowns, pomodoro, and much more. Drag wherever you want across as many pages as you like, with a separate layout remembered for each screen size you use.Three things I actually cared about:Size. The whole extension is 560KB unpacked, ~240KB compressed. Opening a new tab runs about 87KB of JS and 31KB of CSS, uncompressed. Every widget is its own lazy chunk, 69 of them, so a board with three tiles doesn't pay for the other fourteen. Preact instead of React did most of that work... React was around 90% of the initial bundle.Privacy. No account, no backend, no analytics, no telemetry, not even anonymous counters. Nothing to opt out of, because nothing is collecting. Permission asked for features when you use it. If you don't add the history widget, dashi never has history access.Theme. There are currently 7 themes now, with many more themes being worked on. 4 more should be released by next week. dashi is something I open up multiple times throughout the day. So it should look good and be personalized to how you like it.Some other features:Volume boost on the toolbar, with a limiter and a soft-clip stage after the gain.Off the record stops history being written without having to go on incognito.History auto-delete rules delete anything that matches a rule you set.Focus mode to block sites you set for a certain duration.Keep awake to keep your computer screen on for a certain duration.And so much more...It's free and stays free.
I hope you find it useful as much as I do.Try it out! The demo you see on the page is essentially 95% of what you'll get.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49419837) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
