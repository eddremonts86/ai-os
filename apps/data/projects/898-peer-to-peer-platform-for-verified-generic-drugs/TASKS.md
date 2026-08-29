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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (patient dashboard, order state machine view, verification certificate viewer, supplier / agent / carrier dashboards)
- [ ] Provision Coolify project + Docker image + Postgres + Persona + Escrow.com (or USDC fallback)
- [ ] Contract a licensed pharmacist on staff for prescription review
- [ ] Engage legal counsel per launch jurisdiction (US, EU, UK) for platform classification and import-allowance opinion
- [ ] Curate v1 molecule list (start with 3–5 well-characterized molecules with clear personal-use legality)
- [ ] Build the jurisdiction import-allowance rule engine (per molecule × per patient jurisdiction)

## Phase 1: Core

- [ ] Patient signup + KYC via Persona
- [ ] Prescription upload (PDF + photo) → pharmacist review dashboard → approval / rejection with reason
- [ ] Supply-route catalog: 3–5 v1 molecules, manufacturer + regulatory status per route, $200–$250/month price point
- [ ] Patient matches to a route (per molecule + jurisdiction), sees the full price breakdown (subscription + verification fee + logistics fee + supplier cost)
- [ ] Checkout with Escrow.com (or USDC fallback); funds held in escrow
- [ ] Origin verification: Python service ingests chromatograph output (PDF + CSV), parses the assay, generates a signed certificate PDF, uploads to the order record
- [ ] Verification-agent onboarding: identity + professional-license cross-check; only verified agents can sign certificates
- [ ] Vetted-carrier onboarding with documented cold-chain + customs documentation templates
- [ ] Order state machine: `pending_kyc → prescription_review → matched → awaiting_origin_verification → in_transit → awaiting_patient_confirmation → completed` (with `disputed` and `refunded` branches)
- [ ] On `completed`, escrow release: supplier payout ($200–$250), agent fee ($40–$60), carrier fee (variable), platform subscription ($110/mo)
- [ ] Dispute flow with human-reviewed resolution within 5 business days
- [ ] Jurisdiction-limit enforcement at checkout (no order > 90-day personal-use supply for the patient's jurisdiction)
- [ ] Telemedicine partner integration (deferrable to v2 — track partner contracting in parallel)
- [ ] End-to-end test: patient signs up + uploads prescription, route matches + checkout, origin verification passes, carrier delivers, patient confirms receipt, escrow releases

## Phase 2: Deploy

- [ ] Move Escrow.com to live mode
- [ ] Onboard 30 pilot patients across 3 jurisdictions (US, EU, UK) on 3 molecules via 2 supply routes
- [ ] Weekly verification + customs-outcome review with the pilot cohort for 12 weeks
- [ ] Quarterly molecule-catalog review: monitor regulatory status (WHO prequalification, FDA tentative approvals, DCGI)
- [ ] Set up status page + jurisdiction regulatory-change monitoring
- [ ] Post-mortem after week 30; decide v2 scope (telemedicine partner, mass-spectroscopy verification pass, additional molecules and jurisdictions)
