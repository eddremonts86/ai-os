---
id: "482"
slug: i-built-an-app-to-filter-noise-from-tech-blogs-and-surf
title: I built an app to filter noise from tech blogs and surface 6 quality engineering reads every day. How do I get more users?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vfju24/i_built_an_app_to_filter_noise_from_tech_blogs/"
category: indiehackers
date: "2026-08-04"
tech: [Next.js, TypeScript, RSS aggregation, PostgreSQL, Resend, Stripe, Vercel]
---
# I built an app to filter noise from tech blogs and surface 6 quality engineering reads every day. How do I get more users?

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vfju24/i_built_an_app_to_filter_noise_from_tech_blogs/)))))))

Original post:

> I recently built Hexbrief, an app for software engineers who want to read good engineering blogs but do not want to keep checking dozens of company blogs manually. The idea is simple: instead of showing every tech/news post, Hexbrief filters engineering blogs and gives 6 quality reads every day, with a short breakdown of what was built, why it mattered, and what happened. So far, I have around 35 users from Reddit, X, and a few college/work friends. The product is live, and early feedback has been useful. The difficult part is distribution. I tried 1:1 reachouts, but that has been a hard channel so far. Most messages get almost no replies, even when the app is directly relevant to engineers who read technical blogs. For people who have built niche dev/productivity/reading tools: Where did your first serious users come from? Are there specific communities where engineers are more open to trying tools like this? Does this kind of app need content-led distribution instead of direct outreach? Any suggestions on positioning it better so it does not sound like just another news app? Not trying to spam the app here. I am mainly trying to understand how to reach the right readers and get useful feedback. App: https://play.google.com/store/apps/details?id=com.hexbrief.app submitted by /u/JuneHust [link] [comments]

---

What this plan addresses: A tech-blog noise filter that surfaces 6 quality engineering posts per day (Hexbrief).

## Objective

A tech-blog noise filter that surfaces 6 quality engineering posts per day, with a 1-line summary each. When I am tired of a full RSS feed of tech blogs, I want a daily digest of 6 posts with summaries, so I can stay current without spending an hour a day.

## Target Users

- Software engineers tired of full RSS feeds
- Tech leads who want a daily digest for their team
- CTOs who want a curated engineering signal

## MVP Scope

- RSS ingestion from a curated list of engineering blogs
- Daily digest of 6 posts with 1-line summary each
- Email + web delivery
- No "AI ranking" in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vfju24/i_built_an_app_to_filter_` follows the constraints in `482-.../SPEC.md` and the chosen stack (Next.js, TypeScript, RSS aggregation). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions Hexbrief and 6 quality engineering posts
- Plan keeps the curated + capped format
- Source did not name a price or specific blogs
