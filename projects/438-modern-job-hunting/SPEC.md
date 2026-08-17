---
id: "438"
slug: modern-job-hunting
title: Modern job hunting
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, Resend, Vercel]
---
# Modern job hunting

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/

Original post:

> submitted by /u/Expensive_Spare821 [link] [comments]

---

What this plan addresses: A modern job-hunting tracker and signal feed for technical job seekers tired of spreadsheet + bookmark chaos.

## Objective

A tracker + signal feed for technical job seekers who are tired of "where did I apply?" chaos. When I am interviewing, I want a single tracker and a public signal feed so I stop losing applications to bookmark soup, so I can prioritise the roles most likely to respond.

## Target Users

- Technical job seekers (engineers, designers, PMs) actively interviewing
- Career switchers moving from one technical role to another
- Returning-to-work candidates after a break

## MVP Scope

- Single-page tracker for application status (applied, screen, onsite, offer, closed)
- Public job-signal feed (e.g. "Company X just opened 3 senior roles") sourced from public posts
- Notes field per application that survives the next interview round
- No auto-apply; this is a tracker, not a bot

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vo0nvl/modern_job_hunting/` follows the constraints in `438-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body is just Reddit boilerplate; only the title "Modern job hunting" is real
- No industry, level, geography, or salary stated
- Plan reframes the title into the implied product
