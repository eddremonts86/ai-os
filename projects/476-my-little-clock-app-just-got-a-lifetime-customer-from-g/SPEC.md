---
id: "476"
slug: my-little-clock-app-just-got-a-lifetime-customer-from-g
title: my little clock app just got a lifetime customer from Germany 🇩🇪
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vhsfej/my_little_clock_app_just_got_a_lifetime_customer/"
category: indiehackers
date: "2026-08-07"
tech: [Swift, SwiftUI, StoreKit, TestFlight]
---
# my little clock app just got a lifetime customer from Germany 🇩🇪

## Problem

Source: [reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vhsfej/my_little_clock_app_just_got_a_lifetime_customer/)

Original post:

> [preview.redd.it/ddfsvw779whh1.jpg…]([preview.redd.it/ddfsvw779whh1.jpg…](https://preview.redd.it/ddfsvw779whh1.jpg?width=1179&format=pjpg&auto=webp&s=a20fc5690a35a4f85d7857095a512cd74ec3f0bd)) Solo dev here 👋 I've been quietly building Tempus Fugit, a pendulum clock app that turns an iPhone into a calm desk clock (real swinging pendulum, ticks, hourly chimes, widgets, StandBy Mode). Today someone in Germany bought the lifetime plan. 🇩🇪 I know it's a small thing in the grand scheme, but building alone can feel like shouting into the void, and a stranger halfway across the world deciding your work is worth paying for... that hits different. Just wanted to share the win with people who get it. Back to building. submitted by /u/suniltarge [link] [comments]

---

What this plan addresses: A "lifetime customer" celebration tool: a tiny macOS/iOS clock app with built-in customer-story capture.

## Objective

A minimal clock app with a built-in "thank-you" flow that captures customer stories (opt-in) for the founder. When a customer buys my clock app, I want a built-in thank-you flow that captures their story (opt-in), so I can build a public wall of customer moments.

## Target Users

- Indie developers with a niche clock / utility app
- Solo founders who want to celebrate a paying customer publicly
- Bootcamp / accelerator participants sharing first-customer wins

## MVP Scope

- A minimal clock / timer app
- Built-in "thank-you" flow after purchase
- Public wall (opt-in) of customer stories
- No ads, no subscription

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vhsfej/my_little_clock_app_just_` follows the constraints in `476-.../SPEC.md` and the chosen stack (Swift, SwiftUI, StoreKit). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions a "little clock app" that got a lifetime customer from Germany
- Plan keeps the clock-app + celebration framing
- Source did not name a clock feature set
