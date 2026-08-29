---
id: "900"
slug: automated-submission-of-utility-meter-readings-to-multi
title: Automated submission of utility meter readings to multiple management companies
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/nn38cp51u1-automated-submission-of-utility-meter-re"
  captured: "2025-10-09"
category: other
date: "2025-10-09"
tags: [Other]
country: Russia
wtp:
  raw: ₽500–₽1000/month ($6–12) for all apartments or ₽250 ($3) per apartment
  currency: RUB
  min: 250
  max: 1000
  period: month
  mrrMid: 500
tech: [Telegram bot + simple web form, Node.js API, headless-browser automation (Playwright) for legacy management-company portals, SQLite with Drizzle ORM, Coolify + Docker]
---
# Automated submission of utility meter readings to multiple management companies

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Choose Russian PSP (YooMoney / SBP-supporting) for ₽250 recurring subscriptions
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Telegram bot + Resend email-link auth (web form surface)
- [ ] Define Drizzle schema: users, apartments, management-company mappings, deadlines, submissions, operator_queue
- [ ] Publish the v1 management-company coverage table on the landing page (automated vs. operator-assisted per company)

## Phase 1: Core

- [ ] Telegram bot: enter meter readings for each apartment; per-apartment management-company mapping configured at signup
- [ ] Per-company deadline scheduler with reminder escalations (e.g., 5 days out, 1 day out, day-of)
- [ ] MCAdapter interface so a new management company can be added without rewriting the engine
- [ ] First MCAdapter: end-to-end submission to one management company that exposes an API
- [ ] Playwright-driven path for HTML-only portals, with the per-portal runbook visible to the operator
- [ ] Operator queue: internal web app that surfaces the operator-assisted fallback cases with readings, deadline, and per-portal runbook
- [ ] Per-submission audit trail visible to the user: timestamp, management company, response status, operator id when applicable
- [ ] Billing via Russian PSP: ₽250/apartment recurring with a ₽1000 cap; 14-day free trial
- [ ] Credentials storage encrypted at rest with a rotation policy; data-retention policy published
- [ ] End-to-end test: configure one apartment on an API-direct management company, enter readings, observe submission on the correct date, see the audit trail

## Phase 2: Deploy

- [ ] Onboard 50 multi-apartment Russian residents as the pilot cohort; weekly submission-reliability and operator-queue review
- [ ] Move billing to live mode (YooMoney / SBP)
- [ ] Status page + MCAdapter health monitoring + operator-queue SLA dashboard
- [ ] Coverage-table review at the end of week 14: convert at least 2 HTML-only portals to API-direct or fully automated submission if possible
- [ ] Decide the operator-staffing model for the long tail (in-house vs. contractor) based on pilot-queue data
