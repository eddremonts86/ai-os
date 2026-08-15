---
id: "469"
slug: after-months-of-averaging-1-2-users-per-day-we-suddenly
title: "After months of averaging 1-2 users per day, we suddenly got 400+ users"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vkfimr/after_months_of_averaging_12_users_per_day_we/"
category: indiehackers
date: "2026-08-10"
tech: [Next.js, TypeScript, PostgreSQL, PostHog, Stripe, Resend, Vercel]
---
# After months of averaging 1-2 users per day, we suddenly got 400+ users

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vkfimr/after_months_of_averaging_12_users_per_day_we/)))))

Original post:

> My husband and I launched Glance (a full year calendar app, synced with Google) back in April 2025. Growth has been a lot slower than we had hoped, but we haven't spent any money on ads and are only able to dedicate a few hours per week as it's "only" a side project and we're working full-time jobs. Over the past few months we finally got to the point where we were consistently picking up around 1-2 new users a day organically. It wasn't exactly something to write home about, but after starting from zero it felt like real progress, and we were genuinely happy with it. A week ago we pushed a small update to the app in the Google Play Store. Nothing major, just another incremental improvement like we've done many times before. No marketing around it at all and no changes to the text or graphics of the store listing (in fact, I haven't done much marketing in the last month as we've been very busy). Then something unexpected (& exciting) happened. Within the first hour, we had around 20 new users. By the end of the day it was about 60. Within 5 days we've gained over 400 new users (and yes, we've checked and it's definitely not bot traffic). It's starting to slow down again now, but it was honestly surreal watching the numbers climb. After spending well over a year building the app and slowly trying to grow it, this felt like our first real "wow, maybe this can actually work" moment. Google Play Store analytics are still inconclusive, but it looks like it may have been a combination of a push from Google in the Play Store plus randomly at the same time getting mentioned in a Flipboard article we still can’t find (only know of it due to feedback from 1 user who said that’s how they found us). Still not 100% conclusive, but we're not complaining! (Note to self: work on improved analytics) Just pushed a new update to the app, so let’s see if we can get a repeat 🤞 Has anyone else had a moment like this? It doesn't have to be with Google Play, but where one tiny, seemingly insignificant change unexpectedly became a turning point for your side project. Would love to hear about it and possibly test it out for ourselves - addicted to watching the numbers now lol. submitted by /u/SeasonedTravelr [link] [comments]

---

What this plan addresses: A spike-analysis tool for solo founders: capture what changed the day traffic spiked from 1-2/day to 400+.

## Objective

A spike-analysis tool for solo founders: capture what changed the day traffic spiked, with a what-changed journal to support post-hoc attribution. When my app's traffic suddenly spikes from 1-2/day to 400+, I want a tool that captures what changed that day (post, update, link, feature) so I can attribute the spike and decide whether to repeat it.

## Target Users

- Solo founders who have seen unexplained traffic spikes
- Indie hackers trying to learn from their own spikes
- Bootcamp / accelerator participants comparing "what worked" stories

## MVP Scope

- Daily traffic log + spike detector
- Side-by-side comparison of spike day vs. baseline
- What-changed journal: posts, updates, links
- No auto-attribution in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vkfimr/after_months_of_averaging` follows the constraints in `469-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes Glance (a calendar app) and 400+ users after months of 1-2/day
- Plan keeps the spike-analysis framing
- Source did not name a price or attribution source
