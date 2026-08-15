---
id: "473"
slug: i-made-a-free-list-of-100-places-where-you-can-promote-
title: i made a free list of 100 places where you can promote your app
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100_places_where_you_can/"
category: indiehackers
date: "2026-08-07"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# i made a free list of 100 places where you can promote your app

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100_places_where_you_can/)))))))

Original post:

> I recently shared this on another subreddit and it got 500 upvotes so I thought I’d share it here as well, hoping it helps more people. Every time I launch a new product, I go through the same annoying routine: Googling “SaaS directories,” digging up 5-year-old blog posts, and piecing together a messy spreadsheet of where to submit. It’s frustrating and time-consuming. For those who don’t know launch directories are websites where new products and startups get listed and showcased to an audience actively looking for new tools and solutions. They’re like curated marketplaces or hubs for discovery, not just random link dumps. It’s annoying to find a good list, so I finally sat down and built a proper list of launch directories: sites like Product Hunt, BetaList, StartupBase, etc. Ended up with 82 legit ones. I also added a way to sort them by DR (Domain Rating) basically a metric (from tools like Ahrefs) that estimates how strong a website’s backlink profile is. Higher DR usually means the site has more authority and might pass more SEO value or get more organic traffic. I turned it into a simple site: launchdirectories.com No fluff, no paywall, no signups just the list I wish I had every time I launch something. Thought it might help others here too. submitted by /u/Ok_Cartoonist2006 [link] [comments]

---

What this plan addresses: A curated, free list of 100 places to promote an app, with submission guidance and (where available) DR / traffic data.

## Objective

A curated, free list of 100 promotion channels with category, submission rules, and a personal submission tracker. When I have an app to promote and have exhausted the obvious channels, I want a curated list of 100 places with submission rules, so I stop re-Googling "where to promote my app."

## Target Users

- Indie founders looking for free promotion channels
- Solo developers who have exhausted Product Hunt / Hacker News
- Bootcamp / accelerator participants comparing distribution channels

## MVP Scope

- Curated list of 100 promotion channels with category, audience, submission rules
- Filter by category, audience size, submission effort
- Submission tracker (which channels you have submitted to)
- No auto-submission

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vi5ui8/i_made_a_free_list_of_100` follows the constraints in `473-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body is a free list of 100 promotion places the poster shared on another subreddit
- Plan keeps the curated-list framing
- Source did not name audience sizes or DR data
