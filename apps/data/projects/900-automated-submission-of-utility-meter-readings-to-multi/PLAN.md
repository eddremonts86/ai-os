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

## Tech Stack

- **Frontend intake:** Telegram bot as the primary input surface (where the audience already lives); a minimal web form as a secondary surface for users without Telegram.
- **Backend API:** Node.js (Express or Fastify); SQLite via Drizzle ORM; single Coolify instance behind Docker.
- **Submission engine:** per-management-company adapter (Playwright-driven for HTML-only portals, API-direct for those that expose one); an `MCAdapter` interface so a new company can be added without rewriting the engine.
- **Operator queue:** an internal web app that surfaces the operator-assisted fallback cases, with the user's readings, the deadline, and the per-portal runbook visible to the operator; the queue is the bottleneck and must be observable end-to-end.
- **Billing:** Russian PSP (YooMoney / SBP-supporting provider) for ₽250/apartment recurring subscriptions; Stripe is not a fit for the audience.
- **Auth:** Telegram login for the bot flow, email-link via Resend for the web flow; credentials to management-company portals stored encrypted at rest with a real rotation policy.
- **Audit trail:** every submission writes a row to a `submissions` table with timestamp, management-company adapter id, response status, and the operator id (when operator-assisted).

## Architecture

```
Telegram bot / web form
        │
        ▼
Node.js API (intake)
        │
        ├─▶ per-apartment deadline scheduler ──▶ MCAdapter (per management company)
        │                                       │
        │                                       ├─▶ API-direct (companies with an API)
        │                                       └─▶ Playwright (HTML portals, no CAPTCHA bypass)
        │
        ├─▶ Operator queue ──▶ operator-assisted fallback (CAPTCHA / unknown portals)
        │
        └─▶ submissions audit trail (SQLite) ──▶ user-visible confirmation
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + Russian PSP shortlist + initial 5–10 management-company shortlist approved. End of week 1.
2. **M1 — Telegram intake + deadline scheduler.** Telegram bot for entering readings, per-apartment management-company mapping, per-company deadline scheduler with reminder escalations. End of week 3.
3. **M2 — First MCAdapter.** End-to-end submission to one management company that exposes an API; per-submission audit trail visible to the user. End of week 5.
4. **M3 — Operator queue + Playwright path.** Internal operator app for HTML-only portals, with the per-portal runbook; coverage table on the landing page shows automated vs. operator-assisted per company. End of week 8.
5. **M4 — Billing + trial.** YooMoney / SBP recurring subscription at ₽250/apartment with a ₽1000 cap, 14-day free trial. End of week 10.
6. **M5 — Pilot.** Onboard 50 multi-apartment Russian residents; measure submission reliability, operator-queue throughput, and churn. End of week 14.

## Risks

- **Operator-staffing bottleneck.** Operator-assisted submissions scale with the number of users on the long tail of HTML-only / CAPTCHA-protected portals. At ₽250/apartment/month the per-submission labour cost is tight, and the staffing model must keep queue throughput under 24 hours even at month-end peak.
- **Management-company coverage reality.** The published coverage table is only as good as the per-company reality; if the table claims automation that turns out to be operator-assisted, the trust signal collapses the first time a user sees the operator path.
- **CAPTCHA / anti-bot changes.** Long-tail HTML portals can grow CAPTCHA or anti-bot protections overnight; automation must not pretend to bypass these, and the operator fallback has to absorb the resulting growth in the long tail.
- **Russian PSP coverage.** Stripe alone does not cover the Russian audience; the chosen PSP must support recurring subscriptions at ₽250 price points without a fee floor that destroys the unit economics.
- **Personal-data exposure.** Storing management-company account credentials and meter-reading history makes the service a personal-data controller; retention policy, credentials-storage model, and incident response have to be production-grade from day one, not bolted on after a leak.
- **First-mover competition.** Muhammad's human-operator service advertised in the comments operates at the same price point; the software-led product has to beat it on coverage, audit trail, and per-deadline reliability, not on marketing copy.
