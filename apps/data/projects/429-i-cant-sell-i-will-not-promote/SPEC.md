---
id: "429"
slug: i-cant-sell-i-will-not-promote
title: I can’t sell. (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmdpnf/i_cant_sell_i_will_not_promote/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, Node.js API (Hono), PostgreSQL, Stripe, Loom embed, Vercel]
---
# I can’t sell. (I will not promote)

## Problem

Source: https://www.reddit.com/r/startups/comments/1vmdpnf/i_cant_sell_i_will_not_promote/

Original post:

> I have a BI product that many people resonate with, from executive down to worker level. Unfortunately, after three years, not a single contract. How do I sell? I’ve had discussions at the worker level, the CISO, level, and with peers in the space. Everyone seems to like what I have, have no negative feedback (just additional feature requests before purchase, then that target shifts again), but no one signs. Less of a “what am I doing wrong”, and more of a “what do I do, I clearly don’t know how to do this part”. I’m bootstrapped, and running out of money. submitted by /u/bad_robot_monkey [link] [comments]

---

What this plan addresses: Async sales-critique product for technical founders who can build but cannot close.

## Objective

Replaces "ask Reddit how to sell" with an async, recorded critique a real person (or AI) annotates and the founder can replay. When I keep failing to close, I want a recorded breakdown of my actual sales call, so I can see exactly where I lose the buyer instead of being told to "ask better questions."

## Target Users

- Solo technical founders 3-18 months into launch
- Bootstrapped SaaS founders with product shipped but no revenue
- Indie devs trying to land B2B

## MVP Scope

- Async critique flow: founder uploads a 5-minute demo recording
- Annotated critique within 48 hours covering ICP, opening, objection handling, and close
- Single paid tier at a public price
- No live coaching in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vmdpnf/i_cant_sell_i_will_not_promot` follows the constraints in `429-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Node.js API (Hono)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body matches plan 427 in shape ("BI product, 3 years, no contracts, can't sell")
- Plan is the "DIY video critique" sibling: cheaper than the audit, more actionable than a forum reply
- No country or pricing in source
