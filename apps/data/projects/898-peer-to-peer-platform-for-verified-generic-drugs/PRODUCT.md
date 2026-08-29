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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A patient on lifelong critical-disease therapy gets the $250/month price point of Indian or Chinese generic supply, with an independent portable-chromatograph verification at origin (and optionally at destination) and a signed certificate that proves the batch matches the branded reference — without personally crossing borders, without trusting a single seller's claim, and without the $5,000/month branded price. The platform takes $55–$165/month, escrows the rest until verification passes, and coordinates vetted carriers for the cross-border leg.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Patient on lifelong critical-disease therapy | Cannot afford the $5k/month branded drug; willing to use generics if quality is independently verified. |
| Caregiver / patient-advocacy organization | Coordinates generic procurement for multiple patients; needs an auditable verification trail. |
| Independent pharmacy / telemedicine clinic | Wants a verified-generic sourcing channel for patients they already serve. |
| Chromatograph-equipped verification agent (India / China) | Earns a per-batch fee for running TLC / HPLC assays and signing certificates. |
| Vetted cross-border carrier | Earns per-shipment fees for documented cold-chain + customs-compliant transport. |

## Jobs To Be Done

1. **Functional job** — Source affordable verified generic medication for a critical lifelong condition, without personally traveling to India / China and without trusting an unverified supplier.
2. **Emotional job** — Stop fearing that a bad batch of a critical medication is one missed assay away; stop feeling like the only safe option is the $5k/month branded drug.
3. **Social job** — Be able to tell a doctor or a family member "this batch was independently verified, here's the chromatogram" — defensible when the sourcing is questioned.

## Success Metrics

- **Activation:** ≥ 50% of new patients complete KYC + upload a valid prescription within 14 days of signup.
- **Match rate:** ≥ 70% of matched supply routes result in a confirmed order within 30 days of route activation.
- **Verification success:** ≥ 98% of batches pass the origin chromatograph verification on the first assay (the metric that proves the supplier pre-quality story).
- **Delivery success:** ≥ 95% of verified batches reach the patient within the agreed window without customs seizure.
- **Retention:** ≥ 70% of patients who complete a first order renew for the second month (proves the value outweighs the friction).
- **Patient-reported outcome:** opt-in survey at month 3 shows ≥ 80% of patients report "I trust this sourcing more than my previous generic supplier."

## Pricing & Monetization

- **Patient subscription:** $110/month (mid-band of the author's $55–$165 range), covers the platform access, the escrow coordination, and the supplier / agent / carrier matching.
- **Verification fee:** $40–$60 per batch, paid to the chromatograph agent; passed through to the patient on top of the subscription, visible in the price breakdown.
- **Logistics fee:** variable, passed through to the vetted carrier; visible to the patient before checkout.
- **Supplier payout:** $200–$250/month per patient (the bulk generic cost), released from escrow on verified delivery.
- **Telemedicine partner (v2):** markup on prescription issuance where the patient has no local prescriber.
- Annual plan at $90/month locked. No free tier — the verification infrastructure has fixed cost and a free tier would either be unusable or would subsidize the wrong cohort.

## Competitive Landscape

- **Personal cross-border generic sourcing (the author's current workaround)** — works and is 10× cheaper than branded, but puts the verification burden on the patient and exposes them to counterfeit risk; the platform's value is exactly removing this burden.
- **Online international pharmacies (CanadaDrugs, Israel-based pharmacies, Indian exporters with US storefronts)** — cheaper than branded, but verification is seller-asserted; the platform's value is independent verification.
- **Patient-assistance programs (drug-maker copay assistance, foundation grants)** — exist for some molecules, not all; bureaucratic, slow, and frequently underfunded; do not generalize across conditions.
- **Compounded pharmacies (US)** — legal for some molecules, expensive, do not solve the international price gap.
- **Clinical trials** — free medication for eligible patients, but enrollment is restrictive and temporary; not a lifelong solution.
- **Cross-border medical tourism (going to India for treatment)** — works for one-time procedures; not viable for monthly refills of a chronic-condition drug.

## Risks & Open Questions

- [ ] Confirm that the v1 launch operates only on molecules and routes legally importable under personal-use rules in the patient's jurisdiction (FDA 90-day personal-use policy, EU personal-import allowance, etc.); expanding to molecules without a clear personal-use path is a regulatory exposure the platform cannot absorb.
- [ ] Validate the per-batch verification fee ($40–$60) covers the chromatograph agent's time + assay consumables at realistic Indian / Chinese hourly rates; if it does not, the supply side cannot scale.
- [ ] Decide the escrow provider (Escrow.com vs. USDC smart-contract escrow) for cross-border patient payments; the regulatory and FX-exposure implications are different and the choice must be defensible per jurisdiction.
- [ ] Establish the KYC and prescription-verification depth needed to satisfy each jurisdiction's personal-use import rules; under-verified patients risk customs seizure and over-verified patients churn before the first order.
- [ ] Confirm whether a telemedicine partner is needed for v1 or whether every patient is assumed to have a local prescriber; if the partner is in scope, contracting one adds 6–10 weeks and a regulatory review of the partner's prescribing license.
- [ ] Address the legal classification of the platform itself: is it a marketplace, a logistics coordinator, an importer of record, or a pharmaceutical distributor? Each classification carries different licensing, and the wrong one exposes the operators personally.
