---
id: "210"
slug: risk-of-a-linkedin-ban-due-to-false-positive-bot-detect
title: Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that produces human-readable audit trails and warning signals before the ban.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: productivity
date: "2026-03-26"
tags: [Productivity, Risk, LinkedIn]
country: UK
tech: [Python, Playwright, SQLite, Next.js, Webhook]
---
# Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that produces human-readable audit trails and warning signals before the ban.

## Problem

A UK-based user runs personal LinkedIn activity (posts, comments, DMs) that occasionally triggers LinkedIn's bot detection. The actual activity is human but the timing pattern looks automated to their classifier. The user has no way to predict when the next restriction will hit, no audit trail to defend themselves with, and no escalation channel that responds.

LinkedIn's official support either ignores the appeal or sends a generic template. The user is not running automation — they are running a normal high-volume networker activity that happens to trip a heuristic. The result is a working account that can be cut off at any moment without recourse.

## Objective

A browser-side companion that logs every LinkedIn action with rate-of-fire, session length, and heuristic risk indicators, and produces a defensible audit trail the user can rely on if they need to contest a false-positive ban.

## Target Users

UK and US professionals who post on LinkedIn daily, send high volumes of connection requests or DMs as part of legitimate sales, recruiting, or fundraising work, and have either been restricted or are worried about being restricted.

## MVP Scope

Browser extension that records LinkedIn actions (post, comment, DM, connection request) with timestamps and rate-of-fire. Risk score updated live. Daily summary email showing the risk trend. Exportable audit log (CSV, signed JSON). No automation in v1 — purely observational.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `210-.../SPEC.md` and the chosen stack (Python, Playwright, SQLite). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in UK.

For UK, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must NOT perform any automated actions on LinkedIn. Must store audit logs locally or in a user-controlled location. Must not bypass LinkedIn's terms of service. Must not interact with login forms in any way that would create a security risk.
