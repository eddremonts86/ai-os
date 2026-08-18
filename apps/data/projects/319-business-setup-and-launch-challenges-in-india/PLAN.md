---
id: "319"
slug: business-setup-and-launch-challenges-in-india
title: Business setup and launch challenges in India
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/xnzvy42z31-business-setup-and-launch-challenges-in-indi"
category: ai
date: "2025-10-29"
tags: [Business, Legal, Finance, Other]
country: India
tech: [Next.js 14, TypeScript, Postgres, Zoho / Tally integration, MCA21 (Ministry of Corporate Affairs) API, GSTN API, Razorpay, Hetzner]
---
# Business setup and launch challenges in India

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the guided flow.
- Postgres on Hetzner for entity records, filings, document store, status ledger.
- MCA21 API for company registration; GSTN for GST; Udyam portal for MSME.
- DigiLocker for Aadhaar + PAN + address proof.
- Partner bank APIs for current account (IndusInd, HDFC, ICICI).
- Zoho / Tally integration for accounting handoff.
- Razorpay for INR payments.

## Architecture

Next.js drives a state-machine setup flow: eligibility quiz → entity choice → KYC via DigiLocker → MCA filing (partner-CA executed, status-tracked) → PAN + TAN → current account (parallel-track 2 banks) → GST → Udyam → EPFO/ESIC if hiring → founder dashboard with every step's status and ETA. Zoho/Tally handoff exports the chart of accounts and the first invoice template.

## Milestones

1. **M0** — Spec freeze, eligibility quiz + Pvt Ltd flow + DigiLocker KYC. End of week 1.
2. **M1** — MCA filing via CA partner + PAN + TAN. End of week 4.
3. **M2** — Current account opening + GST + Udyam. End of week 7.
4. **M3** — EPFO/ESIC + Zoho/Tally handoff. End of week 10.
5. **M4** — Founder dashboard + white-label CA partner flow. End of week 14.

## Risks

- **MCA / GSTN API instability** — Mitigation: CA-partner hand-off; status page; manual e-filing fallback.
- **Founder KYC failure** — Mitigation: pre-flight check at signup; explicit re-submit.
- **Bank-account opening delays** — Mitigation: parallel-track 2 bank partners; status visibility.
