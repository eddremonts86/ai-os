---
id: "741"
slug: the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-
title: "The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/24mf80ltt1-the-owner-of-a-tech-agency-hasnt-found-a"
  captured: "2026-04-29"
category: business
date: "2026-04-29"
tags: [Business, Dev, Productivity, No-Code, Other]
country: Colombia
wtp:
  raw: $100/month
  currency: USD
  min: 100
  max: 100
  period: month
  mrrMid: 100
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month.

## Tech Stack

- **Frontend / dashboard:** React + TypeScript SPA served by TanStack Start, with four top-level tabs (Projects / Domains / Monitoring / Proposals) and a unified inbox.
- **Backend API:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, single Coolify instance behind Docker.
- **WHOIS / RDAP:** a small `whois` adapter layer that talks RDAP first (where the TLD supports it) and falls back to `whois` + parsing; a 24h content-cache avoids rate-limit pain.
- **Monitoring engine:** an in-process cron runner that ticks every minute; HTTP(S) checks via `undici` with configurable timeout, retry, and a "regions" stub (single-region in v1).
- **Proposals:** a templated editor (block-based) with a server-side PDF render via headless Chromium (`@playwright/test` runner or `puppeteer-core`); e-sign is typed signature + content hash + signed PDF copy.
- **Auth:** email-link (passwordless) via Resend; single workspace per account in v1.
- **Billing:** Stripe Checkout at $100/month; webhook updates `Workspace.subscriptionStatus`.
- **Notifications:** email (Resend) + an outbound webhook stub; Slack / Discord / Telegram in phase 2.

## Architecture

A single TanStack Start app serves both the marketing page and the authenticated workspace. The four feature tabs share a common `Client` entity — every project, domain, monitoring check, and proposal belongs to a client — so the inbox can join across them. The monitoring engine lives in the same Node process and writes incident rows to SQLite; the WHOIS cache and the monitoring engine share the same background-runner pattern (a single cron loop with named tasks and per-task intervals).

```
Browser ─▶ TanStack Start (marketing + workspace)
              │
              ├─▶ /api/projects   ──▶ Drizzle/SQLite (client, project, task)
              ├─▶ /api/domains    ──▶ WHOIS adapter (RDAP / whois)  ──▶ cache ──▶ SQLite
              ├─▶ /api/monitoring ──▶ undici HTTP checks (cron 1 min) ──▶ incidents ──▶ SQLite
              ├─▶ /api/proposals  ──▶ block editor ──▶ Playwright PDF render ──▶ S3-ish blob
              │
              ├─▶ /api/inbox      ──▶ JOIN(renewal_warnings, incidents, unsigned_proposals)
              │
              └─▶ Stripe webhook ──▶ Drizzle/SQLite (subscription)
```

## Milestones

1. **M0 — Spec freeze + workspace shell.** SPEC.md + DESIGN.md approved; the four tabs render empty states. End of week 1.
2. **M1 — Projects tab.** Client + project + task CRUD with kanban view; assignment and due dates. End of week 3.
3. **M2 — Domains tab.** Domain CRUD, WHOIS lookup, expiry alerts, DNS records view. End of week 5.
4. **M3 — Monitoring tab.** HTTP(S) checks per project, incident log, email notifications. End of week 7.
5. **M4 — Proposals tab.** Templated editor, PDF export, typed e-sign, status tracking. End of week 9.
6. **M5 — Unified inbox + billing.** Inbox aggregation; Stripe $100/month plan; trial flow. End of week 11.
7. **M6 — Pilot.** 3 agency workspaces onboarded for 60 days; weekly feedback on cross-surface alerts. End of week 15.

## Risks

- **WHOIS rate limits and per-TLD coverage.** RDAP is available for many TLDs but not all; the fallback parser is fragile and TLD-specific. The 24h cache mitigates but does not eliminate; if a TLD requires a special registry API (e.g. `.co` for Colombia), it needs a dedicated adapter.
- **Monitoring at $100/month.** A 50-endpoint workspace with 1-minute checks is 72,000 checks/day. The in-process runner on a single Coolify box must be cheap; if load grows, the engine needs to move to a queue (BullMQ + Redis) without the workspace contract changing.
- **E-signature legal weight.** Typed signature + PDF hash + email-confirmation trail is the v1 floor. Confirm with a Colombia-based lawyer that this satisfies commercial-contract requirements, or layer in ClickSign for the LatAm market.
- **Four-tab fragmentation risk.** Each tab risks being "the worse version of the dedicated tool". The MVP must keep each tab minimal and explicitly cross-link to the others rather than try to match Trello / UptimeRobot feature-for-feature.
- **Single-region monitoring.** Synthetic checks from one region look great to local users and terrible to clients in other continents. Document the limitation in v1 and add multi-region as a paid phase-2 add-on.
