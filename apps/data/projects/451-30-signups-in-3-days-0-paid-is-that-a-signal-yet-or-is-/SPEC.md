---
id: "451"
slug: "30-signups-in-3-days-0-paid-is-that-a-signal-yet-or-is-"
title: "30 signups in 3 days, 0 paid. Is that a signal yet or is my sample too small?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnxvon/30_signups_in_3_days_0_paid_is_that_a_signal_yet/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# 30 signups in 3 days, 0 paid. Is that a signal yet or is my sample too small?

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vnxvon/30_signups_in_3_days_0_paid_is_that_a_signal_yet/

Original post:

> Built a tool for people who post on X. It parses your old posts, shows you what actually worked (hook, format, length, timing), then writes new drafts using your own past posts as the reference instead of generic AI slop. Pricing is one time credit packs, no subscription. Starter pack is $4. New users get free credits on signup. 3 days in: 30 signups, a few hundred posts parsed, $0. I messaged about half the signups for feedback. Most of it was positive. Still nobody paid. What I already suspect: Most of my audience is Indian and doesn’t pay for tools at all, so the problem isn’t the $4, it’s the act of paying The free credits might be enough to fully solve the problem once, and once might be all they need The value might land too late. They get numbers, but not a “post this right now” moment What I want help with: At 30 signups, is 0 paid actually a signal, or is the sample too small to read anything into? How much free do you give before it removes the reason to pay? For anyone who’s been here, what actually flipped your first paying users? Onboarding, pricing, or just changing who was signing up? Happy to share any numbers people want. Not linking anything, I just want the diagnosis. submitted by /u/Cold-Balance-9733 [link] [comments]

---

What this plan addresses: A signal-vs-noise calculator for early-stage SaaS founders asking "is this traction?" with inputs they actually have.

## Objective

A signal-vs-noise calculator that tells a founder whether their early numbers are meaningful, given the sample size they actually have. When I have 30 signups and 0 paying, I want a calculator that tells me whether that is a signal or noise, so I stop comparing myself to founders with 10,000 signups and 200 paying.

## Target Users

- Solo SaaS founders with 0-50 signups and 0 paying customers wondering if their sample is meaningful
- First-time founders 1-4 weeks into launch
- Founders who feel pressure from social-media success stories

## MVP Scope

- Submit signup count + timeframe + ICP size; calculator returns a confidence interval and a recommendation
- Honest about sample-size limits; never says "this is definitely traction"
- Optional 30-minute review with an experienced founder
- No growth hacking in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnxvon/30_signups_in_3_days_0_paid_is_th` follows the constraints in `451-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says "30 signups in 3 days, 0 paid" and asks whether that is a signal
- Plan is the implied calculator
- Source did not name the product niche, ICP size, or paid conversion history
