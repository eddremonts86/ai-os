---
id: "456"
slug: my-first-screen-recording-app-just-hit-50-in-revenue
title: My first screen recording app just hit $50 in revenue.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnwsiu/my_first_screen_recording_app_just_hit_50_in/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, Tauri, Rust, PostgreSQL, Lemon Squeezy, Vercel]
---
# My first screen recording app just hit $50 in revenue.

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vnwsiu/my_first_screen_recording_app_just_hit_50_in/

Original post:

> It’s not life-changing money, but knowing that real people paid for something I built feels pretty damn good. I launched Verismo Screen Studio one month ago, and that's really upset that no one is buying. [preview.redd.it/smy3v7gjl9jh1.png…]([preview.redd.it/smy3v7gjl9jh1.png…]([preview.redd.it/smy3v7gjl9jh1.png…]([preview.redd.it/smy3v7gjl9jh1.png…]([preview.redd.it/smy3v7gjl9jh1.png…]([preview.redd.it/smy3v7gjl9jh1.png…]([preview.redd.it/smy3v7gjl9jh1.png…]([preview.redd.it/smy3v7gjl9jh1.png…](https://preview.redd.it/smy3v7gjl9jh1.png?width=2934&format=png&auto=webp&s=08bd68c960285cdca6fdeee78198876da3486e40)))))))) submitted by /u/phenix_dance_ninesky [link] [comments]

---

What this plan addresses: A focused screen-recording desktop app with built-in editing and one-click export.

## Objective

A focused screen-recording desktop app with built-in editing, one-click export, and a lifetime license instead of a subscription. When I want to record my screen and share a polished result, I want a desktop app that records, edits, and exports without a subscription, so I do not pay monthly for a tool I use twice a month.

## Target Users

- Solo developers who want a screen-recording app that does not require a subscription
- Designers making product demos without opening a video editor
- Founders recording Loom-style walkthroughs

## MVP Scope

- Native desktop app with system-audio capture
- Built-in trim + zoom-pan + annotation
- One-click export to MP4 / GIF / share link
- Lifetime license via Lemon Squeezy

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnwsiu/my_first_screen_recording_app_jus` follows the constraints in `456-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Tauri). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says "Verismo Screen Studio just hit $50 in revenue"
- Plan keeps the desktop-first framing
- Source did not name an OS or feature comparison
