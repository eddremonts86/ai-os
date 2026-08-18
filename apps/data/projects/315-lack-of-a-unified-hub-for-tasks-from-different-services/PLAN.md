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

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the web app and admin console.
- Postgres on Hetzner Falkenstein (EU) for tasks, integrations, priority rules.
- OAuth integrations: Gmail, Outlook, Slack, Linear, Jira, Trello, Notion, GitHub.
- Background worker (BullMQ on Redis) for periodic task pulls per user.
- Stripe for EU billing (EUR).
- Cloudflare for ingress and DDoS.
- Sentry + Logtail for monitoring.

## Architecture

Single Next.js app. Each integration is an isolated adapter that polls the source API on a per-user schedule and writes normalised task records to Postgres. The priority engine is a configurable per-user rule that re-ranks tasks on each fetch. Daily digest is a server-rendered email + push notification. All data lives in EU Hetzner; right-to-erasure flows per integration.

## Milestones

1. **M0** — Spec freeze, Gmail + Slack + Linear integrations, single-user MVP. End of week 1.
2. **M1** — Outlook + Jira + Trello + Notion + GitHub integrations. End of week 4.
3. **M2** — Priority engine with per-user rule editor. End of week 7.
4. **M3** — Daily digest + team-wide 'today' view. End of week 10.
5. **M4** — Pilot with 50 Serbian knowledge workers and 10 small agencies. End of week 14.

## Risks

- **OAuth scope creep** — Mitigation: minimal scopes per integration; transparent permission UI.
- **Source API drift** — Mitigation: per-integration adapter isolation; nightly canary ping.
- **Priority engine subjectivity** — Mitigation: per-user rule editor; explicit override; weekly rule-tuning prompt.
