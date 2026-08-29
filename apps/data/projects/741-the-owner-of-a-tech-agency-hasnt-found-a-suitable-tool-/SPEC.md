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

## Problem

The owner of a small tech agency in Colombia (the original problem statement on the source page is rendered behind a single-page-application shell, so the captured title and tags are the authoritative inputs: projects + domains + monitoring + proposals) has not been able to find one tool that covers the four everyday jobs an agency actually has to do — tracking client projects, managing the agency's portfolio of domains (renewals, DNS, WHOIS, expiry alerts), uptime / status monitoring for client sites and APIs, and writing / sending client proposals. Today they patch together a project tracker (Trello / Asana / Notion), a domain registrar UI, an external uptime service (UptimeRobot / Better Uptime), and a separate proposal tool (PandaDoc / Qwilr). The friction is not in any one of those tools but in the seam between them: nothing tells the agency owner "this client's domain expires in two weeks, the site is down, and the proposal for next quarter is still sitting in draft." The author has explicitly said they would pay $100/month for a tool that unifies these four.

## Objective

Ship a single workspace for small tech agencies (1–20 people) that combines four daily surfaces — projects, domains, monitoring, proposals — in one UI, with cross-surface alerts so an expiring domain + a down endpoint + an unsigned proposal all show up in the same "needs attention" inbox. The MVP is "one login, four tabs, one notification stream", priced at $100/month per workspace.

## Target Users

- **Primary:** owner-operators of 1–20-person tech agencies (web / app shops, dev studios) who today juggle four SaaS tools for the same workflow and want one bill and one inbox.
- **Secondary:** solo founders running a micro-agency (1–3 people) who wear every hat and would benefit from the same consolidation; pricing should still work for them.

## MVP Scope

- A workspace per agency with the four tabs: **Projects**, **Domains**, **Monitoring**, **Proposals**.
- **Projects:** lightweight project + task tracking scoped per client (no full PM suite; kanban + assignees + due dates).
- **Domains:** a domain inventory (add manually or via WHOIS lookup) with renewal date, registrar, DNS records view, and a daily cron that alerts N days before expiry.
- **Monitoring:** uptime HTTP(S) checks per project (interval 1 / 5 / 15 min), incident log, email + webhook notifications.
- **Proposals:** a templated proposal editor with line items, totals, validity period, e-sign (typed signature is enough for v1), PDF export, and an "accepted / declined / viewed" status.
- A unified inbox that surfaces: domain-renewal warnings, monitor incidents, and unsigned-proposal reminders, all in one feed.
- Single-workspace billing at $100/month via Stripe; multi-workspace deferred to v2.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated budget is $100/month per workspace — the product must remain profitable at that price (i.e. self-hostable or with very low marginal cost).
- Four surfaces must each be usable standalone, because agencies with an existing tool in one slot will adopt incrementally; no "all-or-nothing" forced migration.
- Domain lookups must respect rate limits on WHOIS servers; cache aggressively (≥ 24h) to avoid getting blocked.
- Monitoring is HTTP(S) only in v1 — no ICMP ping, no TCP probe, no synthetic browser checks.
- Proposals must produce a legally-recognizable e-signature artifact in the markets the agency serves (Colombia / LatAm) — typed signature plus a PDF hash is the floor.
- Single-currency billing in v1 (USD via Stripe); COP / MXN / BRL via local rails is a phase-2 add.
