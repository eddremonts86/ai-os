---
id: "229"
slug: a-telegram-channel-owner-is-losing-their-audience-witho
title: A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. No analytics service explains what content is turning subscribers away.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: analytics
date: "2026-01-29"
tags: [Analytics, Telegram, Creator]
country: Georgia
tech: [Python, FastAPI, PostgreSQL, Redis, Telegram Bot API, Next.js]
---
# A Telegram channel owner is losing their audience without understanding the reasons for unsubscriptions. No analytics service explains what content is turning subscribers away.

## Problem

A Telegram channel owner in Georgia (and across the post-Soviet market) sees the subscriber count fluctuate but has no analytics to explain why a post triggered a wave of unsubscribes, why a particular topic is losing readers, or which posts are quietly retaining the audience. Telegram's own analytics are surface-level (view counts, growth). No mainstream service correlates the actual post content with the unsubscribes-per-post and produces an actionable diagnosis. What is missing is a per-post retention analytics service that tells the channel owner what kind of post is causing the unsubscribe, not just the count.

## Objective

A Telegram analytics service that tracks per-post retention and shows the channel owner which content patterns are retaining and which are losing subscribers, with a diagnosis the owner can act on.

## Target Users

Telegram channel owners in the post-Soviet market (Georgia, Russia, Ukraine, Belarus, Kazakhstan) running channels of 1k-1m subscribers. Secondarily: Telegram group admins and bot developers.

## MVP Scope

Telegram bot opt-in. Per-post retention analytics. Topic-level diagnosis (which topics retain, which lose). Weekly report via the bot. Web dashboard for the deep view. No automated posting or scheduling in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `229-.../SPEC.md` and the chosen stack (Python, FastAPI, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Georgia.

For Georgia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect Telegram's terms of service. No scraping of member lists. Opt-in only — the channel owner must explicitly add the bot. Daily analytics refresh, not real-time, to stay within API quotas. Russian-language UI in v1.
