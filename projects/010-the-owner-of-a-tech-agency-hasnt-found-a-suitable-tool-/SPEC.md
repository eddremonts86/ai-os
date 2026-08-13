---
id: "010"
slug: the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-
title: "The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/24mf80ltt1-the-owner-of-a-tech-agency-hasnt-found-a"
  captured: "2026-07-17"
category: business
date: "2026-07-17"
tags: [Business, Dev, Productivity, No-Code, Other]
country: Colombia
wtp:
  raw: "$100/month"
  currency: USD
  min: 100
  max: 100
  period: month
  mrrMid: 100
tech: [Next.js, Postgres, Porkbun API, UptimeRobot API, Resend]
---

# The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month.

## Problem

A Colombian tech agency owner runs the operation in five different tools: a project tracker (Linear / Asana), a domain registrar with separate logins per client, a status-page or uptime monitor, a CRM for proposals, and a Notion or Google Doc template library for the proposals themselves. The friction is in the seams: a new client means data entry in four places, and the agency owner has no single view of "which clients are healthy, which need a proposal, and which are about to lose a domain."

## Objective

Ship a single pane for an agency owner: a client list with per-client domains (with auto-renew reminders), uptime status, project status, and a proposal template engine that produces a polished PDF and tracks the proposal lifecycle.

## Target Users

- Primary: owners of 5–30-person tech agencies in Latin America with 10–50 active clients.
- Secondary: agency operations managers who run day-to-day and report to the owner.

## MVP Scope

- Client list with per-client domains (pulled from the registrar via API), expiry warnings, and renewal reminders.
- Per-client project status pulled from Linear or Asana via OAuth.
- Per-client uptime status from UptimeRobot or BetterStack via API.
- Proposal template engine with reusable blocks (scope, pricing, timeline, terms); output to PDF with the agency's branding.
- Single dashboard view: which clients need attention this week.
- No time tracking, no invoicing, no team-wide resource planning in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The product must not lock the agency into a single registrar; if the registrar API is not supported, the agency enters renewals manually and gets the same reminders.
- Proposal PDFs must include the agency's logo, colours, and a signed line — the output must look hand-crafted, not templated.
- All third-party integrations are read-only on the agency side; we never write to the agency's Linear / Asana / UptimeRobot / registrar.
- Pricing must stay at or below the stated $100/month for the first 100 customers.