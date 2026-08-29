---
id: "898"
slug: peer-to-peer-platform-for-verified-generic-drugs
title: Peer-to-peer platform for verified generic drugs
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/tp6dgyysf1-peer-to-peer-platform-for-verified-gener"
category: health
date: "2025-10-10"
tags: [Health]
country: India
wtp:
  raw: $55-165/month
  currency: USD
  min: 55
  max: 165
  period: month
  mrrMid: 110
tech: [Next.js, TypeScript, Postgres + Drizzle ORM, TLC / HPLC portable chromatograph integration (Python), Escrow.com or USDC smart-contract escrow, KYC via Persona, telemedicine partner API, Coolify]
---
# Peer-to-peer platform for verified generic drugs

## Tech Stack

- **Web app:** Next.js (App Router) + TypeScript + Tailwind CSS, served from a single Coolify instance behind Docker.
- **Backend:** Next.js server actions + Route Handlers; Postgres via Drizzle ORM for users, prescriptions, supply routes, orders, verification certificates, escrow state.
- **KYC:** Persona (identity verification) + a manual prescription review by a licensed pharmacist on staff before any order is matched.
- **Escrow:** Escrow.com API for fiat (USD / EUR / GBP); USDC smart-contract escrow as a fallback for jurisdictions where Escrow.com is unavailable or for patients who prefer crypto.
- **Verification integration:** Python service that ingests chromatograph output (PDF + CSV from the agent's TLC / HPLC device), parses the assay, generates a signed certificate PDF, and uploads it to the order record.
- **Telemedicine partner (deferrable):** REST integration with a contracted telemedicine partner for prescription issuance where the patient has no local prescriber.
- **Compliance:** jurisdiction-specific import-allowance rules encoded as a per-molecule / per-patient-jurisdiction rule engine; an order is blocked at checkout if the route is not legally importable.

## Architecture

A single Next.js app serves the patient flow (signup → KYC → prescription upload → supply-route match → checkout) and the supplier / agent / carrier dashboards. Orders move through a state machine: `pending_kyc → prescription_review → matched → awaiting_origin_verification → in_transit → awaiting_patient_confirmation → completed` (with `disputed` and `refunded` branches). Escrow funds are released to the supplier + agent + carrier only on `completed`.

```
Patient ─▶ KYC (Persona) + prescription upload (PDF + photo)
                                  │
                                  ├─▶ pharmacist review
                                  │
                                  └─▶ supply-route match (per molecule + jurisdiction)
                                              │
                                              ▼
                                  Patient checkout ─▶ Escrow funds held
                                              │
                                              ▼
                                  Origin agent ─▶ chromatograph assay
                                              │
                                              ├─▶ pass ─▶ signed certificate uploaded
                                              │
                                              └─▶ fail ─▶ order canceled, refund

Vetted carrier ─▶ documented cold-chain + customs ─▶ patient receives
                                              │
                                              ▼
                                  Patient confirms receipt ─▶ escrow release
                                              │
                                              ├─▶ supplier payout ($200–250)
                                              ├─▶ agent fee ($40–60)
                                              ├─▶ carrier fee (variable)
                                              └─▶ platform subscription ($110/mo)
```

## Milestones

1. **M0 — Spec + legal freeze.** SPEC.md, DESIGN.md, jurisdiction import-allowance rule engine, pharmacist-on-staff contract approved. End of week 2.
2. **M1 — Patient flow.** Signup, KYC, prescription upload, pharmacist review dashboard. End of week 5.
3. **M2 — Supply routes.** Curated catalog of v1 molecules (start with 3–5 well-characterized molecules with clear personal-use legality) + supplier onboarding. End of week 8.
4. **M3 — Verification integration.** Python service that ingests chromatograph output, parses the assay, generates the signed certificate. End of week 11.
5. **M4 — Escrow + logistics.** Escrow.com integration, vetted-carrier onboarding, customs documentation templates. End of week 14.
6. **M5 — Telemedicine partner (deferrable).** Contracted telemedicine partner for patients with no local prescriber. End of week 18.
7. **M6 — Pilot.** 30 patients across 3 jurisdictions, 3 molecules, 2 supply routes; weekly verification + customs-outcome review. End of week 30.

## Risks

- **Regulatory misclassification.** The platform's legal classification (marketplace vs. logistics coordinator vs. importer of record vs. pharmaceutical distributor) carries different licensing in every jurisdiction; the wrong classification exposes operators personally and can shut the platform down. Legal opinion per launch jurisdiction is non-negotiable before v1 ships.
- **Customs seizure risk.** Personal-use allowances cap a 90-day supply and require specific documentation (original prescription, doctor letter, original packaging); if the carrier fails the documentation check, the batch is seized and the patient has no recourse. v1 must enforce documentation completeness at checkout, not at the border.
- **Verification certificate forgery.** A bad-actor supplier could fabricate a chromatogram and a signed certificate; the verification agent's identity must be independently attested (Persona-style KYC + professional license cross-check) and the certificate must be signed with a key that only the platform issues to verified agents.
- **Personal-use limit enforcement.** A patient ordering 6 months of supply exceeds the FDA / EU personal-use cap and triggers seizure; the platform must enforce per-jurisdiction limits at the route level, not trust the patient to self-report.
- **Counterfeit assay false-positive.** Even a legitimate chromatograph can be fooled by a sophisticated counterfeit that matches the branded reference; an HPLC assay + a mass-spectroscopy pass (deferred to v2) is the only realistic defense. The v1 launch must be honest about the assay's limits in the certificate.
- **Telemedicine-partner gap.** If the v1 launch assumes every patient has a local prescriber, the cohort is small; if it ships without a telemedicine partner, the platform excludes patients who cannot get a local prescription for a chronic-condition generic. The partner contracting timeline must be tracked in parallel with M3.
