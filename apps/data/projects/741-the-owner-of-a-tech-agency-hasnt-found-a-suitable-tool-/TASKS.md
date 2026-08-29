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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md for the four-tab workspace chrome and unified inbox
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Resend email-link auth (single workspace per account)
- [ ] Decide the `Client` entity shape (it is the join key for the inbox)
- [ ] Pick the WHOIS strategy: RDAP-first, whois fallback, with a 24h content cache

## Phase 1: Core

- [ ] Projects tab: client + project + task CRUD, kanban view, assignee + due date
- [ ] Domains tab: domain inventory, WHOIS lookup, expiry cron (alerts at 30 / 14 / 7 / 1 days), DNS records view
- [ ] Monitoring tab: HTTP(S) checks per project (1 / 5 / 15 min), incident log, email notifications
- [ ] Proposals tab: block-based editor, line items + totals + validity, typed e-sign + content hash, PDF render via Playwright, status (draft / sent / viewed / accepted / declined)
- [ ] Unified inbox: JOIN over (renewal_warnings, incidents, unsigned_proposals) per workspace, with quick actions
- [ ] Stripe Checkout at $100/month, 14-day free trial, webhook updates `subscriptionStatus`
- [ ] Trial gating: read-only after trial expiry without subscription
- [ ] End-to-end test: create a client, add a project, attach a domain + a monitor, send a proposal, accept it, and see the unified inbox behave

## Phase 2: Deploy

- [ ] Slack / Discord / Telegram notification adapters behind the same webhook interface
- [ ] Multi-region monitoring (paid add-on)
- [ ] Multi-workspace per account (agencies with separate client-facing portals)
- [ ] Pilot with 3 small tech agencies (Colombia / LatAm) for 60 days
