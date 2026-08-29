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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Stand up the Next.js + Go API skeleton, Postgres with versioning for staffing tables and contracts
- [ ] 1C:Enterprise adapter scaffolded, import-only first, against a sandbox 1C instance
- [ ] Legal-data feed integration scoped (Garant vs ConsultantPlus, contract terms, scope of permitted template rendering)
- [ ] Per-company subscription billing set up with a Russian-friendly processor
- [ ] Inspection-ready export schema drafted so the trust asset is in mind from day one

## Phase 1: Core

- [ ] Staffing-table editor with versioning (every change is a new version, not a destructive update)
- [ ] 1C bidirectional sync of staffing table and payroll metadata; the platform reads 1C as the authoritative source for payroll
- [ ] Contract and order generation: template renderer parameterized by the legal-data feed, audit log per document recording the law-version-in-force
- [ ] Tariff-grid editor with payroll-fund recalculation on change and side-by-side scenario comparison
- [ ] Education and professional-standards tracker: per-role requirement library, expiry alerts, coverage dashboard
- [ ] Labor-protection logs: instruction log entries, medical-check-up schedules, reminders
- [ ] Inspection-ready export: single-click documentation bundle, audit log per export, inspection-readiness score with a self-audit checklist
- [ ] End-to-end test: a 100-person Russian company imports its staffing table from 1C, edits the tariff grid, models two FOT scenarios, generates the documentation bundle, and a synthetic labor inspection accepts the export with no missing items

## Phase 2: Deploy

- [ ] Move billing to live mode and complete the company-entity KYC in Russia
- [ ] Public launch post with the per-company pricing band published and a per-industry inspection-readiness case study
- [ ] Onboard 10 Russian companies across at least 3 industries, weekly inspection-readiness review, monthly legal-data-feed audit
- [ ] Publish a quarterly update log of which Russian Labor Code amendments were absorbed and on what date, so customers can verify the platform stays current
- [ ] Quarterly review of whether to add adjacent compliance surfaces (industry-specific safety regulations, sanitary-epidemiological requirements) and a published roadmap
