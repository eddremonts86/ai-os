---
id: "470"
slug: i-analyzed-979-product-hunt-launches-from-the-last-3-mo
title: I analyzed 979 Product Hunt launches from the last 3 months. Launching on a weekday might be a mistake.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vjirh5/i_analyzed_979_product_hunt_launches_from_the/"
category: indiehackers
date: "2026-08-09"
tech: [Next.js, TypeScript, PostgreSQL, Meilisearch, Resend, Vercel]
---
# I analyzed 979 Product Hunt launches from the last 3 months. Launching on a weekday might be a mistake.

## Problem

Source: [reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vjirh5/i_analyzed_979_product_hunt_launches_from_the/)

Original post:

> We track every featured Product Hunt launch daily for LaunchPact — 979 of them, May 1 – Jul 14. I pulled the numbers on launch day-of-week expecting to confirm the usual advice — "launch Tuesday for maximum traffic." The data says something more interesting. Day Avg launches competing % that hit daily top 5 Median votes for #1 Mon 12 32.8% 552 Tue 20 18.6% 700 Wed 18 21.7% 685 Thu 19 21.8% 741 Fri 14 27.3% 516 Sat 6 65.5% 439 Sun 4 78.3% 482 78% of Sunday launches finish top 5. On Tuesday it's 19%. Before you all move your launches to Sunday — the catch: weekend PH traffic is lower, so you're winning a quieter room. #1 on Sunday still costs ~482 votes, which tells you real voters are around, there's just way less competition for their attention (4 launches vs 20). The way I read it: if the "Top 5 Product of the Day" badge is what you're after (for the landing page, the credibility, the newsletter mention), weekends are heavily underpriced. If you want maximum raw eyeballs and you have the support to fight for it, weekday still makes sense. Caveat: featured launches only, ~3-month window, and correlation isn't destiny. Anyone here launched on a weekend deliberately? Did the lower traffic show up in your signups, or is the badge worth the same either way? submitted by /u/Competitive_Tune_590 [link] [comments]

---

What this plan addresses: A Product Hunt launch-day-of-week analyser based on 979 launches, surfacing the weekday with the best historical odds.

## Objective

A Product Hunt launch-day-of-week analyser based on a sourced 979-launch dataset, with explicit caveats about what "best day" actually means. When I am planning a Product Hunt launch, I want a tool that shows the historical day-of-week odds, so I do not pick a launch day on vibes.

## Target Users

- Solo founders planning a Product Hunt launch
- Indie hackers wanting to pick the best day-of-week
- Agencies launching products on behalf of clients

## MVP Scope

- Day-of-week distribution chart from a sourced 979-launch dataset
- Category filter (e.g. "developer tools", "AI")
- Caveat panel: dataset limits, survivorship bias, what "best day" means
- No auto-launch tool in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vjirh5/i_analyzed_979_product_hu` follows the constraints in `470-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body explicitly says "I analysed 979 Product Hunt launches from the last 3 months"
- Plan uses the same dataset and framing
- Source did not name the analysis cutoff or category split
