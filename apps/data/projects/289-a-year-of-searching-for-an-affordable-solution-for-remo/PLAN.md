---
id: "289"
slug: a-year-of-searching-for-an-affordable-solution-for-remo
title: A year of searching for an affordable solution for remote US business opening wi
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/xnzvy42z31-a-year-of-searching-for-an-affordable-solution"
category: business
date: "2025-10-29"
tags: [Business, Legal, Finance]
country: USA
tech: [Next.js 14, TypeScript, Postgres, Stripe Connect, dLocal (payment for non-US cards), DocuSign API, Clerky compliance workflow, Hetzner]
---
# A year of searching for an affordable solution for remote US business opening wi

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the consumer-facing guided flow.
- Postgres on Hetzner for entity records, filings, reminders, audit trail.
- Stripe Connect + dLocal for international card payments from non-US founders.
- DocuSign API for operating-agreement and banking-doc e-sign.
- Registered-agent partner API for filings + annual report.
- IRS EIN application via the official fax-back path (no SSN/ITIN line) — handled by ops team, surfaced as a status page in the dashboard.
- Mercury / Relay / Brex partner APIs for US bank-account setup.
- Stripe Atlas partner API for the Stripe Atlas path.

## Architecture

Next.js app drives a state-machine formation flow. Each step writes an entity record to Postgres and triggers a partner API call (registered agent, bank, Stripe Atlas). Long-running steps (IRS EIN fax-back) are reflected as status badges with ops-team notes. The dashboard shows timeline + cost + next action. All legal/regulatory disclosures are versioned and rendered at the right step; users cannot advance past a disclosure without acknowledging it.

## Milestones

1. **M0** — Spec freeze, Wyoming + Delaware formation flow with single registered-agent partner. End of week 1.
2. **M1** — Eligibility quiz + state picker + articles-of-organisation flow. End of week 4.
3. **M2** — EIN application path with status tracking + operating agreement via DocuSign. End of week 7.
4. **M3** — Bank-account partner integrations (Mercury + Relay). End of week 10.
5. **M4** — Stripe Atlas path + international card payments. End of week 13.
6. **M5** — First-year compliance reminders + year-2 renewal automation. End of week 16.

## Risks

- **Partner API instability** — Mitigation: contract tests in CI; nightly canary to production partner APIs.
- **State filing rejection** — Mitigation: pre-submission validation checklist; manual review for any non-standard entity name.
- **Bank-account partner policy change** — Mitigation: dual-partner routing, automated failover, explicit SLA in partner contract.
