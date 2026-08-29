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

## Problem

Sergey, a long-time industry insider in Russia, has surveyed 1,000 companies in his region and reports 90% of them are in acute need of a service that automates HR and legal processes in compliance with the Russian Labor Code and applicable industry agreements. The pain surface is broad: managing the staffing table and automatically calculating the payroll fund (FOT), creating a tariff grid and salaries, modeling payroll-fund change scenarios, automatically generating employment contracts, orders, and company policies, tracking employee education and monitoring professional standards, organizing labor protection (instruction logs, medical check-ups, reminders), and preparing reporting for inspections and integrating with 1C. His current workaround is breaking the task into several smaller services, which he calls out as "not a systemic solution." He references industry tender pricing: the documentation portion alone (policies and orders) is valued at 900,000 RUB (~$9,800 at the post's implied FX) for a 100-person company, which is the per-company upper bound for the documentation module alone.

The implicit problem the post is naming is that compliance with the Russian Labor Code is a multi-domain, frequently-updated requirement (staffing tables, payroll math, contracts, instruction logs, education tracking, inspection reporting, 1C integration) and no single product covers the whole surface; companies either pay consultants on each update cycle or absorb compliance risk.

## Objective

Ship an integrated HR-and-legal automation platform that addresses the Russian Labor Code and industry-agreements compliance surface end-to-end: staffing tables, payroll math, contracts and orders generation, education and professional-standards tracking, labor-protection logs, and inspection reporting, with first-class 1C integration. The MVP must prove the loop end-to-end on at least the documentation module (the one Sergey names a market price for), with the other modules following in milestones.

## Target Users

- Primary: HR directors and legal/compliance officers at Russian companies of 50–500 employees, who currently manage the documentation cycle manually or via a consultant.
- Secondary: CFO / finance directors at the same companies who need payroll-fund modeling and 1C integration.
- Tertiary: outsourcing companies and BPO providers serving multiple Russian SMB clients, who need a single platform that consolidates the per-client compliance work.

## MVP Scope

- Staffing-table management with versioning and the ability to model payroll-fund (FOT) change scenarios.
- Tariff grid and salary modeling; the grid is editable and the FOT recalculates on change.
- Automatic generation of employment contracts, internal orders, and company policies, parameterized by the staffing table and tariff grid.
- Education and professional-standards tracker: per-role requirements, expiry dates, alerts before lapse.
- Labor-protection logs: instruction logs, medical-check-up schedules, reminders.
- Inspection-report generation: state-of-the-package export for the documentation a labor inspector would request.
- 1C integration: bidirectional sync of staffing table, payroll, and contract metadata to 1C:Enterprise.
- Legal-data feed: Garant or ConsultantPlus integration for the up-to-date Russian Labor Code text, so the platform's templates track the current law.

## Design Direction

See `DESIGN.md` for this project's design tokens. The product is an internal tool that an HR director lives in daily; the visual language should signal "this is the system of record," not "this is a workflow product." Tables, forms, and exports are first-class; collaboration features are secondary.

## Constraints

- The Russian Labor Code is the binding constraint. Every automated output (contracts, orders, policies, reports) must reflect the current law; the legal-data feed is the source of truth, not a hardcoded template.
- 1C is the system of record for payroll at most Russian companies. The platform cannot displace 1C and must integrate with it cleanly; the integration layer is load-bearing, not optional.
- The market price Sergey names is for the documentation module only (900,000 RUB ≈ $9,800 per 100-person company). The platform's documentation module must be worth that price on its own, before the broader feature set is layered on.
- The legal-data feed (Garant / ConsultantPlus) is paid and has redistribution terms. Templates generated from the feed must respect those terms and not expose raw feed content.
- Labor inspection readiness is the trust asset. The platform must produce an inspection-ready export (the exact documentation an inspector would request) in a single click, not a stitched-together PDF assembled by the HR director.
