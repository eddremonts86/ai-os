---
id: "427"
slug: how-do-i-sell-i-will-not-promote
title: How Do I Sell? (I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vmdsf4/how_do_i_sell_i_will_not_promote/"
category: startups
date: "2026-08-12"
tech: [Next.js, TypeScript, Node.js API (Hono), PostgreSQL, Resend, Stripe, Railway]
---
# How Do I Sell? (I will not promote)

## Problem

Source: https://www.reddit.com/r/startups/comments/1vmdsf4/how_do_i_sell_i_will_not_promote/

Original post:

> I have a BI product that many people resonate with, from executive down to worker level. Unfortunately, after three years, not a single contract. How do I sell? I’ve had discussions at the worker level, the CISO, level, and with peers in the space. Everyone seems to like what I have, have no negative feedback (just additional feature requests before purchase, then that target shifts again), but no one signs. Less of a “what am I doing wrong”, and more of a “what do I do, I clearly don’t know how to do this part”. I’m bootstrapped, and running out of money. submitted by /u/bad_robot_monkey [link] [comments]

---

What this plan addresses: Sales-readiness self-audit for bootstrapped technical founders selling into enterprise (BI / data products).

## Objective

Turns "everyone likes it, nobody signs" into a checklist of the four most likely drop-off points, so the founder can stop iterating on the product and start iterating on the close. When interest keeps dying between "we like it" and "we signed," I want to know which of discovery, demo, procurement, or champion enablement is the real blocker, so I stop guessing and start measuring.

## Target Users

- Bootstrapped founders of technical B2B products with product-market resonance but zero closed contracts
- Sales coaches who want a structured intake
- Founder-cohort programs that want a shared diagnostic

## MVP Scope

- 15-question self-audit returning a one-page diagnostic covering ICP fit, demo quality, champion enablement, and procurement friction
- Anonymous by default, no account required
- Optional 30-minute expert review paid via Stripe
- No CRM integration in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vmdsf4/how_do_i_sell_i_will_not_prom` follows the constraints in `427-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Node.js API (Hono)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source describes a 3-year bootstrapped BI product with executive-level interest but zero closed deals
- Poster did not state ACV, sales motion details, or pricing
- Plan keeps assumptions conservative and flags unknowns
