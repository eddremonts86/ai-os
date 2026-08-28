---
id: "200"
slug: need-a-tool-that-automatically-finds-people-in-social-m
title: Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/social/6stv96yp21-need-a-tool-that-automatically-finds-peo"
category: social
date: "2026-04-28"
tags: [Social, Marketing, Business, Startups, AI, Productivity, Other]
country: USA
wtp:
  raw: $50/month
  currency: USD
  min: 50
  max: 50
  period: month
tech: [Next.js 14, TypeScript, PostgreSQL, Twitter API v2, LinkedIn API, BullMQ + Redis]
---
# Need a tool that automatically finds people in social media using deeper criteria. Willing to pay $50/month.

## Problem

The poster needs a tool that automatically finds people on social media using deeper criteria than hashtags and follower counts — for example behaviour signals, intent language, or topical expertise — but the existing search tools either limit to surface-level filters or charge enterprise prices. Willingness to pay is stated at $50/month.

## Objective

Ship a tool that crawls Twitter/X and LinkedIn, applies a behavioural and linguistic filter (e.g. 'posted about X in the last 30 days AND uses Y vocabulary'), and returns a ranked list of accounts that match.

## Target Users

B2B sales reps, recruiters, indie hackers, and growth marketers in the USA who already pay for outreach tools and want a better top-of-funnel list.

## MVP Scope

Connector to Twitter/X and LinkedIn. Rule builder for combining recency, keyword, language, follower band, and posting frequency. CSV export. A queue with rate-limit-aware workers.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/social/6stv96yp21-need-a-tool-that-automatically-find` follows the constraints in `200-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect each platform's terms of service (no scraping without API). Twitter/X and LinkedIn APIs have hard rate limits; the tool must queue and never exceed them.
