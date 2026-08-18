---
id: "347"
slug: search-for-personal-business-niche-considering-psycholo
title: Search for personal business niche considering psychological barriers
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-niche-consi"
category: psychology
date: "2025-10-29"
tags: [Psychology]
country: Russia
tech: [Next.js, OpenAI API, Postgres, Stripe / YuKassa, PDF export (react-pdf)]
---
# Search for personal business niche considering psychological barriers

## Problem

A Russian-speaking would-be founder has cycled through two or three niche ideas and stopped at the 'starting' step each time. The blocker is not strategy, it is psychological - impostor syndrome, fear of judgment, decision paralysis, perfectionism. Generic business-niche tools ignore that and present another scorecard. The poster wants a tool that treats the psychological barrier as the primary variable.

## Objective

Ship a personal-niche decision tool for Russian-speaking founders that maps a candidate niche against the user's psychological profile, surfaces the specific barrier most likely to derail the start, and pairs it with one structured micro-action for the first 7 days - not a 10-step plan.

## Target Users

- Russian-speaking solo founders who have considered 2-4 niches and not started any.
- Career-changers in Russia/CIS in their 30s who want a niche that fits their life, not a YC deck.
- Russian-speaking creators and consultants who have moved from idea to 'almost started' repeatedly.

## MVP Scope

- Psychological profile intake: 12-question instrument covering impostor syndrome, perfectionism, fear of judgment, decision paralysis, energy patterns.
- Niche candidates: 1-3 free-text entries per session.
- Niche x profile mapping: per niche, the top 1 psychological barrier the user is most likely to hit at week 1.
- 7-day micro-action: one concrete 15-minute action per day, calibrated to the user's barrier.
- Weekly check-in: 3-question pulse; nudge if missed.
- Privacy: data never sold, never used as training, deletable from the account.
- No clinical-psychology claims; the tool self-describes as a 'decision aid'.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/psychology/u4o11i24f1-search-for-personal-business-ni` follows the constraints in `347-.../SPEC.md` and the chosen stack (Next.js, OpenAI API, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Psychological profile is a non-clinical decision aid; the disclaimer is on the intake screen.
- Micro-actions are short, specific and verifiable in the same session they are performed.
- All data handling follows 152-FZ (RU personal-data law); consent text on signup.
