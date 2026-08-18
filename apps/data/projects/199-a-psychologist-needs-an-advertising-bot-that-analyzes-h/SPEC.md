---
id: "199"
slug: a-psychologist-needs-an-advertising-bot-that-analyzes-h
title: A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/f9domkol61-a-psychologist-needs-an-advertising-bot"
category: marketing
date: "2026-07-20"
tags: [Marketing, Productivity, Other]
country: Russia
tech: [Python, FastAPI, PostgreSQL, Yandex Direct API, VK Ads API, Telegram Bot API]
---
# A psychologist needs an advertising bot that analyzes her workload and automatically adjusts her ads. She is willing to pay for a solution and is open to discussing the details.

## Problem

A solo practicing psychologist in Russia runs paid ads on Yandex Direct and VK Ads to fill her client roster. When her calendar fills up, ad spend keeps running and new bookings turn into dead time; when the calendar empties, she has to remember to manually pause and re-enable campaigns. There is no off-the-shelf bot that watches her scheduling system and adjusts ad budgets or status accordingly. She has stated willingness to pay and is open to details.

## Objective

Ship a bot that ingests her calendar load (free hours, booking rate, cancellations) and automatically adjusts Yandex Direct and VK Ads bid modifiers, daily budgets, and on/off status so spend follows demand without her having to babysit it.

## Target Users

Solo or small-practice private professionals in Russia (psychologists, coaches, dentists, tutors) who run paid acquisition on Yandex Direct or VK Ads and have a calendar whose load should drive ad spend.

## MVP Scope

Connector to one calendar (YCLIENTS, Google Calendar, or Yandex Calendar). Connector to one ad platform (Yandex Direct or VK Ads, not both in v1). Rule engine mapping free/busy to bid and budget adjustments. Daily summary message in Telegram explaining what changed and why. Manual override that pauses automation for N days.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/f9domkol61-a-psychologist-needs-an-advertis` follows the constraints in `199-.../SPEC.md` and the chosen stack (Python, FastAPI, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

All credentials stored with Russian-region data residency (Yandex Cloud or VK Cloud). Calendar data must not leave Russian infrastructure. The bot must never auto-delete historical campaigns, only adjust bids and budgets. The user must be able to fully audit every change.
