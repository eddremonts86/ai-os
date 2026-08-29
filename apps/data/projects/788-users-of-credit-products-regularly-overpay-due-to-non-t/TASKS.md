---
id: "788"
slug: users-of-credit-products-regularly-overpay-due-to-non-t
title: Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/jtv11ju831-users-of-credit-products-regularly-overp"
category: finance
date: "2026-01-18"
tags: [Finance, Legal, Other]
country: Russia
tech: [Bun, Hono, Postgres, Tinkoff/YooMoney Open Banking sandbox, pdfplumber (Python sidecar), Resend, Fly.io (Frankfurt region)]
---
# Users of credit products regularly overpay due to non-transparent bank terms. There is no advocate service that would analyze their spending and find hidden fees.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/788-users-of-credit-products-regularly-overpay-due-to-non-t/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the Hono upload endpoint that accepts PDF, CSV or an Open Banking callback and routes each to the correct parser
- [ ] Stand up the pdfplumber sidecar and the per-issuer PDF extraction paths with a per-issuer confidence flag
- [ ] Add the CSV in-process parser and the per-bank Open Banking adapter in the Tinkoff and YooMoney sandboxes
- [ ] Define the Postgres schema for parsed statements, findings, tariff references and the per-user audit log
- [ ] Implement the normaliser that turns parsed lines into structured spend rows with a recurring-charge marker
- [ ] Wire the findings engine: recurring fees, tariff mismatches, late-payment patterns and unused-feature detection, each with a confidence flag
- [ ] Render the fixed Markdown report with the advocate-not-adviser banner and the tariff reference date on every finding
- [ ] Build the per-finding dispute-letter template library in Russian and the user-editable draft flow
- [ ] Pin the Postgres volume to the Russian-jurisdiction region with encryption at rest and the per-user deletion path
- [ ] Add an audit log that records where any user data has flowed, with jurisdiction markers on every entry

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
