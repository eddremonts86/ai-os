---
id: "478"
slug: "2-times-top-10-and-featured-on-product-hunt-heres-how-y"
title: "2 times Top 10 and featured on Product Hunt - here's how you too can do it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vgix9n/2_times_top_10_and_featured_on_product_hunt_heres/"
category: indiehackers
date: "2026-08-05"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# 2 times Top 10 and featured on Product Hunt - here's how you too can do it

## Problem

Source: [reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vgix9n/2_times_top_10_and_featured_on_product_hunt_heres/)

Original post:

> here are 2 launches i recently did: - Nuvio PH Launch - ranked 9th on VERCEL day and got featured. - Dashi PH Launch - ranked 5th just yesterday. How? I built and used LaunchPact, where i streamline the process of finding support, which most of you should be doing and currently do in one way or another. From what i've observed, most folks post on launch day itself without any prep work ahead of time, they post on reddit, X, linkedin etc.. and say something like hey i just launched pls support me pls take a look, and mostly they end up with no support and no visibility and no validation or feedback because their launch went invisible, i was in the exact same situation myself, and that's where the idea came from, i launched LaunchPact 2 months ago, i used it for both of these launches, i'm prepping for one more product launch to go in a month or so, i've heard alot of positive feedback from my users about their own launches...this shit works, and i've never had to make a single post about either launch in any channel whatsoever, i didn't have it really.. Thanks and good luck with your launches. submitted by /u/Competitive_Tune_590 [link] [comments]

---

What this plan addresses: A Product Hunt playbook based on 2 top-10 launches, with day-of-launch checklist and hunter-outreach templates.

## Objective

A Product Hunt playbook based on 2 top-10 launches, with a day-of-launch checklist, hunter outreach templates, and comment-response scripts. When I am planning a Product Hunt launch, I want a checklist and templates from someone who has done it twice, so I do not show up on launch day without a plan.

## Target Users

- Solo founders planning a Product Hunt launch
- Indie hackers who want a structured day-of plan
- Bootcamp / accelerator participants running cohort launches

## MVP Scope

- Day-of-launch checklist (T-7, T-1, T-0, T+1, T+7)
- Hunter outreach templates
- Comment-response scripts
- No "auto-launch" tool in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vgix9n/2_times_top_10_and_featur` follows the constraints in `478-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions 2 Product Hunt launches that were top-10 and featured
- Plan keeps the playbook framing
- Source did not name the products or hunters
