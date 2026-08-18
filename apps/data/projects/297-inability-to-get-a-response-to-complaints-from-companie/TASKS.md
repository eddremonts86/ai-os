---
id: "297"
slug: inability-to-get-a-response-to-complaints-from-companie
title: Inability to get a response to complaints from companies
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/avqi69p261-inability-to-get-a-response-to-complaints-from-"
category: legal
date: "2025-10-29"
tags: [Legal, Consumer, Communication]
country: Argentina
tech: [Next.js 14, TypeScript, Postgres, MercadoPago, WhatsApp Business API, PRO Argentina consumer-protection API, Hetzner]
---
# Inability to get a response to complaints from companies

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/inability-to-get-a-response-to-complaints-from-companie/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] WhatsApp bot onboarding: motive capture, company identification, evidence checklist.
- [ ] Sector-specific email templates: telecom, bank, retail, utility, airline, delivery (6 sectors in v1).
- [ ] Email relay with SPF + DKIM + DMARC; bounce and reply-to handling.
- [ ] 10-business-day response tracker with daily status check.
- [ ] Evidence upload: PDF, photo, screenshot — stored encrypted per consumer.
- [ ] Escalation decision: missed SLA → user confirms → pre-fill regulator form.
- [ ] PRO Argentina form pre-fill: ENACOM, CNDC, SSN, SRT, SSC, ENARGAS (6 superintendOS in v1).
- [ ] Operator console: case load, response rates per company, escalation history.
- [ ] Aggregate-feedback report to PRO Argentina per quarter, anonymised.
- [ ] Ley 25.326 compliance: explicit consent, 24-month retention max, right to erasure.
- [ ] Pilot in Buenos Aires with 1,000 consumers across telecom + bank sectors; measure outcome at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 297-inability-to-get-a-response-to-comp MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Argentina completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
