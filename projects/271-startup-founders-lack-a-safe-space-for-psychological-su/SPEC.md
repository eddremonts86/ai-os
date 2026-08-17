---
id: "271"
slug: startup-founders-lack-a-safe-space-for-psychological-su
title: Startup founders lack a safe space for psychological support during moments of burnout and loneliness
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/psychology/r15v6zgeg1-startup-founders-lack-a-safe-space-for-p"
category: psychology
date: "2025-12-11"
tags: [Startups, Other]
country: Serbia
tech: [Next.js 14, TypeScript, PostgreSQL, Telegram Bot API, Stripe, Daily.co video API, OpenAI GPT-4o-mini]
---
# Startup founders lack a safe space for psychological support during moments of burnout and loneliness

## Problem

Startup founders in Serbia (and many similar ecosystems) experience burnout and loneliness that is structurally hard to address: peer founders are competitors, friends lack context, traditional therapy is expensive and not founder-fluent. The poster wants a safe space for psychological support during these moments.

## Objective

Ship a small-group, peer-led psychological support service for startup founders, structured around weekly facilitated group sessions (not 1:1 therapy), with strict confidentiality, vetted facilitators who themselves have founder experience, and a low monthly fee so founders can stay for months.

## Target Users

Serbian startup founders experiencing burnout or loneliness; founders in similar Balkan ecosystems. Facilitators who are themselves ex-founders with counselling training.

## MVP Scope

Web app with intake flow, weekly small-group video session scheduling, vetted facilitator matching, Telegram bot for between-session check-ins, and Stripe subscription. GPT-4o-mini for facilitator-note drafting (with human review before any action).

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/psychology/r15v6zgeg1-startup-founders-lack-a-safe-sp` follows the constraints in `271-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Serbia.

For Serbia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Group sessions must be small (6-8 founders) and consistent (same group weekly). Strict confidentiality — no recordings by default. Facilitators must have both counselling credentials and founder experience. Source does not state a willingness-to-pay.
