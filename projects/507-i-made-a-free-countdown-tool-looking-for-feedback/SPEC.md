---
id: "507"
slug: i-made-a-free-countdown-tool-looking-for-feedback
title: I made a free countdown tool - looking for feedback
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vny9r9/i_made_a_free_countdown_tool_looking_for_feedback/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# I made a free countdown tool - looking for feedback

## Problem

Source: [reddit.com/r/SideProject/comments/…](https://www.reddit.com/r/SideProject/comments/1vny9r9/i_made_a_free_countdown_tool_looking_for_feedback/)

Original post:

> There are many countdowns, but I wanted my own for various reasons. As artists, we can only understand the creation and sharing side of joy. A simple countdown for events that is shareable. countdown creator Do share your thoughts; appreciated! submitted by /u/webfuelcode [link] [comments]

---

What this plan addresses: A free, shareable countdown tool focused on creator-driven events (releases, drops, premieres).

## Objective

A free, shareable countdown tool focused on creator-driven events (releases, drops, premieres) with email reminders. When I have an event (release, drop, premiere) coming up, I want a clean, shareable countdown I can post, so my audience knows when to show up.

## Target Users

- Artists preparing releases, drops, or premieres
- Creators launching products on a specific date
- Anyone who wants a clean, shareable countdown

## MVP Scope

- Custom countdown with event name + date
- Shareable link + embed code
- Optional email reminder at T-24h
- No ads, no account

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vny9r9/i_made_a_free_countdown_to` follows the constraints in `507-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions a free countdown tool for events
- Plan keeps the creator-event framing
- Source did not name a price (free implied)
