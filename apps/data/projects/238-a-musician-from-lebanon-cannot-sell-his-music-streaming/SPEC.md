---
id: "238"
slug: a-musician-from-lebanon-cannot-sell-his-music-streaming
title: "A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-his"
category: media
date: "2026-01-21"
tags: [Other]
country: Lebanon
tech: [Next.js 14, TypeScript, PostgreSQL, Stripe Connect (Stripe Atlas), S3-compatible storage, Icecast streaming server, Telegram Bot API]
---
# A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales

## Problem

A musician in Lebanon cannot monetise his music effectively: streaming platforms pay fractions of a cent per play, and Bandcamp — the dominant direct-sales platform for independent musicians — does not support payouts to Lebanese bank accounts or cards. The poster wants a fair radio-style platform that supports direct sales and reaches Lebanese listeners.

## Objective

Ship a curated internet-radio platform that streams independent music from artists in countries where mainstream payout platforms do not work, lets listeners buy tracks or albums directly (with payouts routed through a payment partner that actually settles in Lebanon), and pays artists a per-play rate above what mainstream streaming pays.

## Target Users

Independent musicians in Lebanon and similar countries with limited payout-rail coverage. Independent music listeners worldwide who want to support artists directly. Curators and small radio DJs.

## MVP Scope

Web radio with three channels (one curated by genre, one by region, one artist-rotated). Per-track and per-album purchase via Stripe Connect routed through a Lebanese-friendly payout partner. Per-play micro-payment to artists on a monthly settlement. Artist onboarding with audio hosting on S3-compatible storage and Icecast for the live stream.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-` follows the constraints in `238-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Lebanon.

For Lebanon, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Payouts to Lebanon must go through a partner that actually settles (research needed during build — Whish Money, OMT, or a USD-crypto off-ramp). Streaming rights must be cleared at upload (artist affirms ownership). No DRM in MVP.
