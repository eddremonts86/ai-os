---
id: "293"
slug: search-for-an-effective-cleaning-business-management-so
title: Search for an effective cleaning business management solution
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/bh5ylhzh51-search-for-an-effective-cleaning-business-ma"
category: business
date: "2025-10-29"
tags: [Business, Productivity, Other]
country: USA
tech: [Next.js 14, TypeScript, Postgres, Stripe, Twilio SMS, Google Maps Routes API, Hetzner]
---
# Search for an effective cleaning business management solution

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/search-for-an-effective-cleaning-business-management-so/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Recurring scheduler: RRULE + job materialisation worker (14-day window).
- [ ] Operator console: calendar, customer list, job detail, mark-complete with photo.
- [ ] Customer self-booking page: deposit via Stripe, address capture, service-type selector.
- [ ] Stripe Billing: recurring card + ACH, proration on skip/reschedule, dunning.
- [ ] Twilio SMS: 24-hour + 2-hour reminders, opt-in capture, opt-out keyword handling, quiet hours.
- [ ] Google Maps Routes API integration: multi-stop day plan with drive-time estimates.
- [ ] Cleaner mobile-web view: today's jobs, mark-complete, photo upload, contact-customer link.
- [ ] Payroll CSV export: hours per cleaner per period, ready for Gusto/QuickBooks import.
- [ ] Multi-cleaner team support: assign jobs, split teams, per-cleaner reporting.
- [ ] TCPA compliance: opt-in flow, opt-out keyword handling, audit log per customer.
- [ ] Pilot onboarding kit: 20 operators, week 12 NPS + time-saved self-report.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 293-search-for-an-effective-cleaning-bu MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in USA completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
