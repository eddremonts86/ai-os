---
id: "2991"
slug: i-built-a-search-engine-for-800-niche-job-boards
title: I built a search engine for 800 niche job boards
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49432568"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I built a search engine for 800 niche job boards

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I started JobBoardSearch about four years ago as a simple directory of niche job boards (A static HTML file with a dozen job boards)One particular think I'm proud of: I didn't scrape these niche job boards and add them to a dabatabase. The 800+ job boards currently listed were submitted organically by their ownres.Lots of their job boards provide a job feed (API, XML or RSS), I fetch those feeds and use the data in serveral different ways.Each job board has its own page in JBS, where I show jobs from that board. I call this the "meta" part of the site.The same feed powers a few other things I built:- A subreddit bot that automatically post jobs every hour to the /r/jobboardsearch subreddit, which has grown to 26k memebers.- A free telegram bot that sends personalized job alerts based on custom settings: keywords, locations, industry, candence, etc. The Telegram community passed 6k members.- The main job search itself.The interesting part is that the same data creates several distribution channels (Including AI citations that keeps growing).Over time, I turned it into much more than a simple directory. I've add

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49432568) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
