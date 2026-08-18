---
id: "358"
slug: automated-submission-of-utility-meter-readings-to-multi
title: Automated submission of utility meter readings to multiple management companies
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/utilities/tp6dgyysf1-automatic-submission-of-readings-of-counters"
category: utilities
date: "2025-10-10"
tags: [Utilities]
country: Russia
---
# Automated submission of utility meter readings to multiple management companies

## Value Proposition

A single monthly intake for Russian tenants who today juggle several UK / resource-supplier portals. The user records the readings once; the system submits them to each portal, captures the confirmations, and surfaces a clear summary of what was submitted where. The user trades five two-minute web forms for one short form and the assurance that the deadline was not missed.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Russian flat owner or tenant | Five portals, one deadline window, missed deadlines turn into norm-based bills. |
| Multi-flat owner | Same chore repeated for children / rental units. |
| Older user | UK portals vary; one familiar interface simplifies it. |
| Frequent traveller | Easy to miss the deadline if the user is not at their desk. |

## Jobs To Be Done

- "I want to enter the readings once and have the system send them to every UK I report to."
- "I want to see at a glance which submissions went through and which were skipped."
- "I want a reminder three days before the deadline so I do not forget."
- "I want to read the previous reading back so I can compare and avoid a typo."
- "I want to revoke a stored credential immediately if I leave the flat."

## Success Metrics

- A user with 3 or more linked portals submitted the readings to all of them before the deadline.
- The confirmation summary shows the timestamp and the portal's confirmation page for every successful submission.
- The user returned the next month without needing to re-link the portals.
- The share of submissions that failed silently (vs. surfaced) is below 1%.

## Pricing & Monetization

_TODO: source did not name a price. A plausible candidate is a per-flat monthly fee or a free tier supported by a premium "unlimited flats" tier, but the team must pick based on the first 50 users. No number is invented here._

## Competitive Landscape

- **Per-UK portals and mobile apps** — the existing path: each user logs in to each portal and submits the readings. The pain is the multiplication of these flows.
- **Gosuslugi (Госуслуги)** — the Russian state services portal that exposes some bill-payment but does not centralise UK submissions.
- **Bank payment aggregators** — Yandex Pay, Tinkoff, etc. pay a bill but do not submit the underlying reading to the UK portal.

## Risks & Open Questions

- UK portals change their form layouts without notice; the submission service must be designed to detect a layout change and surface it to the user instead of silently submitting a wrong value.
- Storing portal credentials is a security liability; a breach exposes the user to phishing on every UK portal. The MVP must use a credential vault scoped to the user, not a shared store.
- The user's submitted reading is the user's legal responsibility; the platform must keep a clear record of "this reading was submitted by the user on this date" in case the UK disputes it.
- Some UK portals require a CAPTCHA or a phone-OTP that the user must approve; the MVP must pause and ask the user, not attempt to bypass it.
- The source did not name which UK portals, which cities, or which meters (water, heat, electricity, gas) are in scope; the first cohort must pick a small set honestly.
