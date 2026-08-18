---
id: "350"
slug: the-absence-of-a-single-trusted-service-for-solving-eve
title: The absence of a single trusted service for solving everyday tasks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-service"
category: freelance
date: "2025-10-29"
tags: [Freelance]
country: Russia
tech: [Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa, Telegram Bot API, Identity verification via Gosuslugi integration]
---
# The absence of a single trusted service for solving everyday tasks

## Problem

A Russian household or small business with a one-off everyday task - pick up a package, walk a dog, queue at a state office, water plants while away, deliver a small item across town - has two non-trivial problems: no single trusted place to find a vetted person for the task, and no insurance that the person will turn up. Today they ask a relative, post in a neighbourhood chat, or pay a flat-fee service that conflates gig economy and trust.

## Objective

Ship a Russian everyday-tasks marketplace where vetted local task-doers (identity verified via Gosuslugi-style integration) take on small, time-boxed tasks posted by households and small businesses, with insurance and escrow binding both sides of the transaction.

## Target Users

- Russian urban households with one-off errands and time-pressure tasks.
- Russian small businesses needing a part-time, vetted runner or assistant.
- Russian seniors and their adult children who want a known, ID-checked person for recurring small tasks.

## MVP Scope

- Task posting flow: title, location, time window, price, tasker permission flags (home entry yes/no).
- Tasker profile: Gosuslugi-linked identity check, rating history, area of operation.
- Matching: nearest vetted tasker within the time window; first-accept wins.
- Escrow: tasker paid on completion acknowledgement; dispute opens a moderator review.
- Insurance: per-task liability cap of RUB 100k included in escrow flow.
- Telegram bot for posting and accepting tasks.
- No long-form freelance contract work, no negotiation loop, no in-app messaging longer than the task brief.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-` follows the constraints in `350-.../SPEC.md` and the chosen stack (Next.js + mobile (React Native), Postgres, Stripe Connect / YuKassa). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Identity verification must succeed before a tasker can accept paid tasks; manual fallback is a photographed passport under a moderator.
- All payments flow through YuKassa; cash settlement is explicitly disallowed in T&Cs.
- Per-task liability cap is on the platform's master policy, sold through a Russian insurer partner.
