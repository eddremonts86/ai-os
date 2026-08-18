---
id: "249"
slug: its-impossible-to-donate-to-animal-shelters-due-to-comp
title: "It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/1adxzgi7b1-its-impossible-to-donate-to-animal-shelt"
category: other
date: "2026-01-17"
tags: [Other]
country: Russia
---
# It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit

## Tech Stack

- Python 3.11 + Django for the application server; the data model (donations, shelters, line items, receipts, audit reports) is relational and Django's ORM is a clean fit, and Django admin gives the operator a usable back-office without building one from scratch.
- PostgreSQL for donors, shelters, donations, line items, receipts, and audit reports.
- Object storage (S3-compatible, self-hosted MinIO) for receipt files; receipts are public-by-default in the MVP because the donor's distrust is solved by visibility, not by access requests.
- YooKassa (or Tinkoff Payments) for Russian ruble donations; PCI scope is minimized by tokenization, since the service holds funds but does not store card data.
- A scheduled worker (Celery beat) for monthly audit reminders and the disbursement-on-receipt-approval flow.
- A small static site (Next.js) for the public shelter profiles and donor dashboards; chosen because the public surface is read-heavy and SEO matters for donors who Google a shelter name.

## Architecture

Three pieces:

1. **Donor surface** — public shelter profile pages and a donor dashboard showing the donor's contributions and the underlying receipts and audit confirmations.
2. **Shelter console** — a logged-in area where shelter staff upload receipts tagged against line items (feed, vet, utilities) and view the status of pending disbursements.
3. **Auditor console + disbursement worker** — the auditor reviews uploaded receipts against the line items and confirms or rejects. Confirmed receipts trigger a disbursement to the shelter for the verified amount. The chain is recorded as a public event on the donation.

Funds are held by the service, not transferred in bulk. The donor sees each disbursement as a separate event with the receipt that triggered it.

## Milestones

- **M1 — Shelter profile + line items.** Operator onboards three to five partner shelters; each gets a profile page with line items and a target monthly amount.
- **M2 — Donation flow.** Donor picks shelter + line item, pays via YooKassa; donation is recorded and visible in the donor dashboard.
- **M3 — Receipt upload.** Shelter staff upload receipts tagged against line items; receipts are public on the donor dashboard.
- **M4 — Auditor console.** Independent auditor reviews receipts, confirms or rejects, and publishes a monthly audit report per shelter.
- **M5 — Disbursement.** Confirmed receipts trigger a ruble disbursement to the shelter via bank transfer; the disbursement event is public.

## Risks

- Audit capacity bottleneck: the model depends on a human auditor. If the auditor cannot review receipts on a monthly cadence, the chain stalls and donors see stale confirmations.
- Receipt quality varies wildly: a vet's tax invoice is strong evidence; a hand-written kennel note is weak. The auditor must judge case-by-case; the MVP must surface the auditor's confidence, not pretend all receipts are equal.
- Money-holding regulatory scope: holding donor funds and disbursing on receipt requires charity / payment regulation compliance in Russia. This must be confirmed before taking real money.
- Donor drop-off after first gift: most first-time donors do not return. The MVP's metric (recurring donors per shelter at month six) is honest about that; chasing virality would dilute the trust signal.
- Shelter onboarding risk: shelters with poor record-keeping cannot pass the audit even if their work is good. The MVP needs a lightweight receipt-helper (templates, photo-to-PDF) so onboarding is not gated on back-office sophistication.
