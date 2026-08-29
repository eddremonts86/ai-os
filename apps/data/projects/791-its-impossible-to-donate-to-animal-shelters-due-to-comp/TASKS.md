---
id: "791"
slug: its-impossible-to-donate-to-animal-shelters-due-to-comp
title: "It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/1adxzgi7b1-its-impossible-to-donate-to-animal-shelt"
category: other
date: "2026-01-17"
tags: [Other]
country: Russia
tech: [Go, Chi router, PostgreSQL, TimescaleDB extension, Open Banking API integration, Rust receipt-verifier service, S3-compatible cold storage, Docker, Coolify]
---
# It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/791-its-impossible-to-donate-to-animal-shelters-due-to-comp/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the shelter record, campaign record, donation record, disbursement record, document record, and flag event in PostgreSQL with TimescaleDB on the time-series tables.
- [ ] Build the shelter onboarding flow (legal name, registration, bank account, expense categories) and the public shelter page.
- [ ] Implement campaign creation with the declared-use field, the target amount, the expense category, and the publication gate.
- [ ] Wire the licensed payment processor via Open Banking for the donation flow, with the donation record written on confirmed payment.
- [ ] Implement the donor visibility choice (public, named-anonymous, private) and the per-donor receipt page skeleton.
- [ ] Build the shelter-reported-expense upload path to S3-compatible cold storage, with the declared-category selection per expense.
- [ ] Implement the Rust receipt-verifier service: document type, amount and date compared against declared use; flag event written on mismatch.
- [ ] Surface audit flags to the shelter, to the auditor API, and to the per-donor receipt page so the verdict is durable.
- [ ] Build the auditor API endpoints (donation trail, disbursement trail, document retrieval, flag events) with read-only enforcement and the auditor role gate.
- [ ] Add aggregate queries tested for visibility leakage so private donations are not surfaced beyond the aggregate count.
- [ ] Add the documented data-retention policy and the deletion path that does not break the audit trail.
- [ ] Add the regulatory-confirmation milestone before live donations: charity-fundraising rules, personal-data handling, payment-processor licensing.
- [ ] Wire Russian-language copy throughout donor, shelter and auditor surfaces; keep English out of scope at MVP.
- [ ] Run an end-to-end test: a shelter onboards, a donor gives to a campaign, a disbursement is reported, a document is uploaded, the verifier either passes or flags, and the donor's receipt page reflects the verdict.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
