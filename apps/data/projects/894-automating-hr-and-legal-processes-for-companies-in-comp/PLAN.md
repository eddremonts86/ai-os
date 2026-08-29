---
id: "894"
slug: automating-hr-and-legal-processes-for-companies-in-comp
title: "Automating HR and legal processes for companies, in compliance with the Russian Labor Code"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/cdysjhl381-automating-hr-and-legal-processes-for-co"
  captured: "2025-10-16"
category: career
date: "2025-10-16"
tags: [Career, Finance, Legal]
country: Russia
wtp:
  raw: "documentation portion alone valued at 900,000 RUB (~$9,800) per 100-employee company"
  currency: RUB
  min: 900000
  max: 900000
  period: one-shot
  mrrMid: 0
tech: [Next.js, TypeScript, Go (API), PostgreSQL, "1C:Enterprise integration", Garant / ConsultantPlus legal-data feed]
---
# Automating HR and legal processes for companies, in compliance with the Russian Labor Code

## Tech Stack

- **Front-end:** Next.js (App Router) for the company workspace, the staffing table editor, and the inspection-report export surface.
- **API:** Go for the high-throughput staffing-table and contract-generation paths; Next.js route handlers for the lighter CRUD endpoints.
- **Persistence:** PostgreSQL with versioning for staffing tables, contracts, orders, and policies (every change is a new version, not a destructive update).
- **1C integration:** 1C:Enterprise web-services adapter with bidirectional sync of staffing tables and payroll metadata; the platform treats 1C as the system of record for payroll and reads from it as the authoritative source.
- **Legal-data feed:** Garant or ConsultantPlus integration for the current Russian Labor Code text; the platform's contract and order templates are parameterized by the feed so they track the current law without manual template maintenance.
- **Document generation:** a server-side rendering pipeline (Go template engine + a PDF generator) for inspection-ready exports, with the rendering auditable per export.
- **Auth:** email-link + 1C:Enterprise SSO option for companies already running 1C as their identity layer.
- **Billing:** per-company subscription via a Russian-friendly processor, sized to the documentation module's market value.

## Architecture

```
Browser ─▶ Next.js (workspace + staffing-table editor + exports)
                │
                ├──▶ /api/staffing/* ──▶ Go API ──▶ Postgres (versioned)
                │
                ├──▶ /api/contracts/* ──▶ Go API
                │                          │
                │                          ├─▶ Garant / ConsultantPlus
                │                          │     (current law text)
                │                          │
                │                          └─▶ template render ──▶ PDF
                │
                ├──▶ /api/1c/*  ──▶ 1C adapter
                │                          │
                │                          └─▶ 1C:Enterprise web services
                │
                └──▶ /api/exports/* ──▶ inspection-ready bundle
                                            │
                                            └─▶ audit log per export
```

The legal-data feed is the trust asset. Every contract and order generation pulls the current law text at render time and records the version that was in force when the document was generated, so an audit trail years later can confirm what the document was based on. The 1C integration is the second trust asset — the platform never overrides 1C's payroll math, it sources from it.

## Milestones

1. **M0 — Staffing-table editor + 1C import.** Staffing-table editor, 1C adapter for import, versioned storage. End of week 4.
2. **M1 — Contract and order generation.** Template renderer parameterized by the legal-data feed, first batch of contracts and orders generated from a real staffing table. End of week 8.
3. **M2 — Tariff grid + FOT modeling.** Editable tariff grid, payroll-fund recalculation on change, scenario comparison. End of week 12.
4. **M3 — Education and professional-standards tracker.** Per-role requirements, expiry alerts, coverage dashboard. End of week 15.
5. **M4 — Labor-protection logs.** Instruction logs, medical-check-up schedules, reminders. End of week 18.
6. **M5 — Inspection-ready export.** Single-click documentation bundle export, audit log per export, inspection-readiness score surfaced. End of week 22.
7. **M6 — Pilot cohort.** 10 Russian companies across at least 3 industries, weekly inspection-readiness review, monthly legal-data-feed audit. End of week 32.

## Risks

- **Legal-data feed terms.** Garant and ConsultantPlus have redistribution terms that constrain how their content can be surfaced or stored. The integration must respect those terms and not expose raw feed content; the templates reference the law without copying it. The commercial terms are the most material decision in v1.
- **1C version drift.** 1C:Enterprise upgrades regularly, and the integration must be re-tested on each version. M0 must establish a regression-test suite that runs against the latest 1C version on a continuous-integration schedule.
- **Inspection readiness under scrutiny.** The inspection-readiness score is a self-audit metric. If a labor inspector asks for the underlying documents, the platform must produce them in seconds, not minutes. The export path is the trust asset, and slow exports undermine the score's credibility.
- **Russian-Labor-Code update frequency.** The Russian Labor Code is amended regularly; a missed amendment produces outdated templates. The legal-data feed must trigger a re-render alert, and the platform must surface "this template references law as of [date]" on every generated document.
- **Pricing model alignment with the post's market reference.** Sergey names 900,000 RUB as the documentation-only tender value. If the platform's monthly subscription is priced below that, the value comparison is hard to communicate; if priced at or above it, the procurement decision takes longer. M5 must publish the unit-economics comparison before public pricing is locked.
