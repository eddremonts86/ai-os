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

## Tech Stack

- **Go with the Chi router** for the donation API and the audit API, because the audit path needs to handle high-volume read traffic from independent auditors without pulling the donation-write path down with it.
- **PostgreSQL with the TimescaleDB extension** for the donation and disbursement ledger, so per-campaign and per-donor queries that scan time ranges stay cheap as the corpus grows.
- **A Rust receipt-verifier service** for the document-matching workload (declared expense category against uploaded document type and amount), because the verification is the load-bearing claim of the service and benefits from Rust's predictable latency.
- **Open Banking API integration** with a licensed Russian payment processor for the donation flow itself, so the service is the ledger and audit layer rather than the funds-holder.
- **S3-compatible cold storage** for uploaded documents, versioned and retention-tagged, so an auditor replaying a trail two years later sees the same document the audit layer saw.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The service has three surfaces — a donor-facing flow, a shelter-facing flow, and an auditor-facing read-only API — and one ledger underneath. The ledger is the source of truth: every donation, every disbursement, every uploaded document, and every audit-flag event lives in PostgreSQL with TimescaleDB so per-campaign and per-donor queries scan time ranges cheaply. The Rust verifier reads the ledger, compares declared expense categories against uploaded documents, and writes back a flag for any mismatch.

A shelter completes onboarding by submitting its legal name, registration details, the bank account that will receive funds, and the expense categories it intends to fundraise against. Onboarding produces a shelter record and a per-shelter public page. A shelter starts a campaign by naming a declared use (a specific veterinary bill, a specific month's food supply), a target amount, and the expense category the campaign falls into. The campaign is published and is visible on the shelter's page immediately.

A donor lands on a campaign page, sees the declared use, the current total, and the campaign's audit status, and chooses a donation amount. The donation flow hands off to a licensed payment processor via Open Banking; on confirmed payment, the service writes a donation record tied to the campaign, the donor's chosen visibility, and the processor's transaction reference. The donor then sees a per-donor receipt page that names the campaign, the declared use, and the date the contribution was logged — and that page will be updated later when the campaign's expenses are reported and audited.

The audit layer is independent of the shelter. When a shelter reports an expense against a campaign, it uploads the document and the declared expense category. The Rust verifier compares the document type, amount and date against the declared use and flags mismatches. Every flag event is recorded in the ledger; the shelter sees the flag, the auditor sees the flag, and the donor's receipt page reflects the flag rather than silently showing the expense as audited. The receipt page is the donor's durable evidence — it is the thing a donor can show a friend who asks whether the shelter is honest.

The auditor API is read-only and gated by an auditor role. An auditor can pull the full donation trail, the disbursement trail, the document set, and the flag events for any shelter, and can request the same trail for a specific campaign or a specific donor's contribution. The API does not expose private donations beyond the aggregate count, and it does not let an auditor modify any state. That is what makes the audit independent rather than cooperative.

## Milestones

1. **M1 — Shelter onboarding and campaign model** — schema, onboarding flow, public shelter page, campaign creation, declared-use field.
2. **M2 — Donation flow** — licensed payment-processor integration, donation record, donor visibility choice, per-donor receipt page skeleton.
3. **M3 — Disbursement and document upload** — shelter-reported expenses, document upload to cold storage, declared-category selection.
4. **M4 — Independent audit layer** — Rust verifier, mismatch flagging, ledger entries for every flag event, dashboard for shelter and auditor to see flags.
5. **M5 — Per-donor receipt finalisation** — receipt page shows the trail end-to-end (donation → disbursement → document → audit verdict).
6. **M6 — Auditor API** — read-only endpoints for donation trail, disbursement trail, document retrieval, flag events; gated by auditor role.
7. **M7 — Regulatory confirmation and launch** — sign-off on Russian charity-fundraising and personal-data handling before live donations.

## Risks

- **Audit independence erosion** — the service becomes too friendly with a shelter and lets a flag be silently cleared. Mitigation: every flag-clear event requires a second reviewer and is itself logged.
- **Document forgery** — a shelter uploads a forged document the verifier cannot catch. Mitigation: verifier scope is explicitly bounded, and a known limitation is published rather than hidden.
- **Donor visibility leak** — a private donation is surfaced through an aggregate query that exposes more than the count. Mitigation: aggregate queries tested for visibility leakage before any new aggregate is shipped.
- **Regulatory gate** — Russian charity-fundraising and personal-data rules can block the launch. Mitigation: regulatory review is its own milestone before live donations, not a launch-day scramble.
- **Cold-storage cost growth** — every document kept forever multiplies storage cost. Mitigation: retention policy stated upfront, with a documented deletion path that does not break the audit trail.
- **Processor outage** — the payment processor goes down and donors cannot give. Mitigation: processor-status surfaced on the campaign page and outage messaging routed to a status page rather than a broken donation button.
- **Shelter onboarding drop-off** — onboarding is too heavy and shelters abandon before publishing a first campaign. Mitigation: minimum-viable-onboarding gate measured weekly, with a lighter path documented for very small shelters.
