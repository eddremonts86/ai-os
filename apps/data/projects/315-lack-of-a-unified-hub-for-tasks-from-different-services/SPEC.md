---
id: "315"
slug: lack-of-a-unified-hub-for-tasks-from-different-services
title: Lack of a unified hub for tasks from different services
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/3bwf3l7wh1-lack-of-a-unified-hub-for-tasks-from-differen"
category: productivity
date: "2025-10-29"
tags: [Productivity, Communication, Other]
country: Serbia
tech: [Next.js 14, TypeScript, Postgres, OAuth integrations (Google, Microsoft, Slack, Linear, GitHub, Jira, Trello), Stripe, Hetzner]
---
# Lack of a unified hub for tasks from different services

## Problem

Serbian knowledge workers — and increasingly the global remote workforce that employs them — juggle tasks across Gmail, Outlook, Slack, Linear, Jira, Trello, Notion, and GitHub. There is no single inbox that surfaces the next action across all of them. The title frames the gap as a hub: not another task app, but a unified layer that pulls 'tasks from different services' into one place, with the right priority rule per source.

## Objective

Ship a unified-task hub that connects to the top productivity tools a Serbian knowledge worker uses, pulls the actionable items out of each, applies a source-aware priority rule, and shows a single 'what's next' list per day. Outcome: the user stops switching between 6 apps to find the next thing to do.

## Target Users

Serbian knowledge workers — engineers, designers, PMs, marketers, agency operators — who routinely use 3+ productivity tools. Adults 24–45, comfortable with SaaS, often working for a US/EU remote employer. Secondary: small Serbian agencies and remote-first teams that want a team-wide 'today' view across tools.

## MVP Scope

OAuth integrations with Gmail, Outlook, Slack, Linear, Jira, Trello, Notion, GitHub. Per-source task extractor: emails flagged with 'to-do' labels, Slack mentions and DMs, Linear/Jira/Trello issues assigned to the user, Notion tasks due today, GitHub PR review requests. Priority engine: explicit per-source rule (e.g. 'Slack DMs beat GitHub notifications beat email newsletters'). Daily digest via email + push notification. Web app + mobile web.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/productivity/3bwf3l7wh1-lack-of-a-unified-hub-for-tas` follows the constraints in `315-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Serbia.

For Serbia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Read-only access by default; tasks are linked back to the source app for the actual completion action. No data leaves the EU (Hetzner Falkenstein). GDPR-compliant: per-integration disconnect, data export, right-to-erasure. Serbian-language + English UI in v1.
