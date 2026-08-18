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

## Tech Stack

Next.js (TypeScript) for the user-facing intake and the dashboard. PostgreSQL via Prisma for the user's flats, the portal links, the submitted readings, and the audit log. BullMQ on Redis for the scheduled submission queue and the deadline reminders. Playwright hosted in a sandboxed worker for the actual portal submission (browser automation, not headless HTTP). AES-256-GCM encrypted credential vault for the user's portal credentials, with a per-user key derived from the user's password. Twilio for the SMS-OTP handoff when a portal requires a one-time code. The stack is chosen for the *form* of the problem: a small number of users, a high-trust workload, and a recurring monthly job that must survive portal breakage.

## Architecture

- **User account** — flat list, per-portal credential entry, deadline reminders.
- **Monthly intake** — a single screen that asks for the current reading of each meter, pre-fills the previous reading, and validates the new value.
- **Submission worker** — a Playwright worker that takes a (portal, credentials, reading) tuple, navigates the portal, submits the form, and captures the confirmation page screenshot.
- **Fingerprint service** — a small per-portal fingerprint that describes the form layout and the field selectors; the worker uses the fingerprint to drive the portal. When the fingerprint mismatches the live page, the worker refuses to submit and surfaces the error.
- **Audit log** — every submission is recorded with the user, the portal, the submitted reading, the timestamp, and the link to the captured confirmation page.
- **Reminder service** — three-day-prior SMS / push to the user with a deep link to the intake screen.

## Milestones

1. **Phase 0 — Scaffold**: Next.js + Prisma + BullMQ skeleton, design tokens, intake route, encrypted credential vault.
2. **Phase 1 — Core**: monthly intake, per-portal fingerprint system, Playwright submission worker, audit log, reminder service.
3. **Phase 2 — Pilot**: onboard 20 users in one Russian city, each with 2–3 portals, run one full monthly cycle, measure on-time submission rate.
4. **Phase 3 — Coverage**: add support for the next 5 portals based on the most common fingerprint failures in the pilot.

## Risks

- A UK portal redesign that replaces the form layout will break the submission silently; the fingerprint service must detect the mismatch and refuse to submit.
- Credential storage is a security liability; the encryption must be per-user, and the platform must support immediate credential revocation.
- A submitted wrong reading is harder to detect than a failed submission; the platform must require the user to confirm the reading before each monthly cycle.
- Some portals require a phone-OTP that blocks automated submission; the MVP must pause and ask the user, not bypass the OTP.
- The source did not name which UK portals, which cities, or which meters are in scope; the first cohort must pick a small set honestly.
