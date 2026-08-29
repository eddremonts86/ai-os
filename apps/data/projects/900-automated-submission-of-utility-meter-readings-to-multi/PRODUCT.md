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

## Value Proposition

A Russian resident with one or more apartments serviced by different utility management companies enters the meter readings once per month through a Telegram bot (or a web form), and the service submits them to each management company's personal account on the correct date — automated end-to-end where the company has an API, operator-assisted where it does not — so the user never misses a deadline, never absorbs an estimated bill, and never has to remember which date applies to which company.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Multi-apartment Russian resident | Currently remembers and submits readings on several different dates every month across different management companies; will pay a small subscription to never think about it again. |
| Single-apartment Russian resident on a non-GIS management company | Still needs a third-party submission path because the unified state service does not cover their company; the same bot serves them. |
| Property manager / landlord handling readings for tenants | Wants one intake form that submits to each management company; saves time across multiple units. |
| Operator-assisted submission staff (internal) | Work a queue of HTML-only / CAPTCHA-protected portals on behalf of users; the service cannot scale without this labour pool for the long tail of management companies. |

## Jobs To Be Done

1. **Functional job** — Submit monthly meter readings to each management company on the correct date, without the user having to remember the dates or log into each portal.
2. **Emotional job** — Stop being afraid that a missed deadline will trigger an estimated bill or a fine; feel that the monthly chore is genuinely off the user's plate.
3. **Social job** — Be the resident whose utility bills are always based on actual readings rather than estimates, and who recommends the service to other multi-apartment owners.

## Success Metrics

- **Activation:** a user account configures at least one apartment with a supported management company and submits one successful reading within 7 days of signup.
- **Submission reliability:** ≥ 99% of scheduled submissions land on the management company's portal on the correct date and receive a confirmed acknowledgement within the same submission window.
- **Operator-queue throughput:** the operator-assisted queue maintains a median end-to-end time from user entry to portal submission of under 24 hours, even at month-end peak load.
- **Retention:** ≥ 80% of subscribers stay on the plan into month 3, indicating the service is genuinely off-loading the chore rather than being a temporary reminder.
- **Coverage growth:** the published coverage table grows by at least 2 automated-end-to-end management companies per quarter, shrinking the operator-assisted fallback ratio.

## Pricing & Monetization

₽250 per apartment per month, with a ₽500–₽1000 monthly cap for multi-apartment users per Dmitry's stated willingness-to-pay. Free 14-day trial so a user can validate the workflow on a real monthly cycle. Coverage of automated-end-to-end management companies is free for any user; the operator-assisted fallback is the value the subscription pays for.

## Competitive Landscape

- **GIS Housing and Communal Services** — the unified state service; does not cover every management company, so users on non-GIS companies still need a third-party path.
- **Per-company reminder bots** — what Dmitry tried; addresses the "remember the date" half of the problem but not the "submit the readings" half.
- **Concierge / personal-assistant services** — generic human operators; expensive and not specialised in utility-company portals.
- **The human-operator service advertised in the comments** (Muhammad) — direct competition at the same price point; first-mover risk is real, and a software-led product with operator fallback must beat it on coverage and audit trail.
- **No incumbent for the combined "remember + submit + audit" workflow.** The closest existing service is "reminder-only", and the gap Dmitry names is the end-to-end submission path.

## Risks & Open Questions

- [ ] Confirm which Russian management companies expose an API or a stable, automation-friendly portal; the v1 coverage table is only as good as the per-company reality, and the operator fallback is honest only if the table says so.
- [ ] Decide the operator-staffing model: in-house, contractor, or both; per-submission labour cost at ₽250/apartment/month is tight, and the staffing model has to keep the operator-queue throughput target achievable at scale.
- [ ] Validate the Russian PSP and SBP / YooMoney payment-method path; Stripe alone does not cover the Russian audience, and the chosen PSP must support recurring subscriptions at ₽250 price points without a fee floor that destroys the margin.
- [ ] Watch for CAPTCHA / anti-bot changes at the long tail of HTML-only management-company portals; automation that pretends to bypass these protections is a legal and reliability risk, and the operator fallback must be sized to absorb growth in this tail.
- [ ] Decide whether the operator-assisted submissions create a personal-data controller relationship with the user (account credentials, meter-reading history); the data-retention policy and the credentials-storage model have to be production-grade from day one.
