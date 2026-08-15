---
id: "468"
slug: "5-months-in-49-downloads-0-paying-customers-heres-what-"
title: "5 months in, 49 downloads, 0 paying customers. Here's what changed since the last update."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vlig4g/5_months_in_49_downloads_0_paying_customers_heres/"
category: indiehackers
date: "2026-08-11"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# 5 months in, 49 downloads, 0 paying customers. Here's what changed since the last update.

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vlig4g/5_months_in_49_downloads_0_paying_customers_heres/)))))

Original post:

> In July I posted about 3 months, 40 downloads, and zero conversions. This is the follow-up. The numbers today: 49 downloads, 5 App Store ratings with the score now publicly visible, still ranking first on "freelance" in the Mac App Store. Still zero Pro conversions. The thread that post generated was the most useful product research I've done. 150+ comments from people who've shipped their own tools. A few things that solidified: The paywall is in the wrong place. The feature users mention first is always time tracked flowing directly into an invoice. That's free. Pro unlocks Gantt, recurring invoices, iCloud sync, AI assistant, full reports. Several people in the thread made the same point: I described the core job and then put it in the free tier. The things behind Pro solve problems users haven't hit yet at month three. I'm not touching the free tier. The consensus from the thread pushed toward usage-based gating over feature gating, project count or invoice count rather than hiding specific features. But with 49 downloads I don't have enough signal to make that call responsibly. September is the date I set to revisit it. What I did ship instead. Windows version is launching next week on the Windows Store. Same local-first architecture, no cloud, no account. Paddle Billing for payments since Apple IAP isn't an option there. The distribution insight that keeps proving true. Reddit comments in the right thread outperform launch posts every time. The HarvestApp sub just had a meltdown over a 700% price increase. One comment mentioning Flowara there generated more clicks than most posts I've written. The intent is already in the room. What zero revenue actually means at this stage. I've stopped reading it as a pricing signal. 49 downloads is too small a sample. The retention is real, people are updating through multiple releases. The question I'm sitting with is whether the people who found it have gone through enough billing cycles to hit the ceiling. Most probably haven't. Windows next week. September for the pricing review. Still building. submitted by /u/TimelyRepeat4517 [link] [comments]

---

What this plan addresses: A "what changed" post-mortem tool for indie founders with stalled downloads, focused on the experiments that actually moved numbers.

## Objective

A structured post-mortem tool for indie founders with stalled downloads, focused on the experiments that actually moved numbers. When my app is stalled at <100 downloads and <10 paying, I want a structured post-mortem template that compares what changed between periods, so I stop guessing which experiment mattered.

## Target Users

- Indie founders with a stalled app (3-6 months in, <100 downloads, <10 paying)
- Solo developers who have read launch advice without traction
- Bootcamp / accelerator participants comparing notes

## MVP Scope

- Structured post-mortem template (downloads, paying, traffic sources, experiments)
- Side-by-side comparison vs. previous period
- Public log (opt-in) of post-mortems
- No auto-generated "growth hacks" in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vlig4g/5_months_in_49_downloads_` follows the constraints in `468-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes 5 months in, 49 downloads, 0 paying, and what changed since a prior post
- Plan keeps the post-mortem framing
- Source did not name a price or category
