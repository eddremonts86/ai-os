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

## Problem

A patient on lifelong therapy for a critical medication faces a brutal cost problem: the original branded drug costs about $5,000/month in Russia and in his country of residence, and subsidized access is effectively impossible. He has found a workaround — buying a generic in India for $500/month and personally transporting it across two countries — which works and is roughly 10× cheaper. There is an option to buy in bulk for $250/month, but the risk of receiving counterfeit product is high, and a bad batch of a critical medication is not an acceptable failure mode. The author explicitly proposes the solution shape: a peer-to-peer service with a quality verification system, with (1) agents in India / China equipped with portable chromatographs (the technology is real and familiar to doctors) to check each batch, and (2) a logistics + legal platform that connects buyers, carriers, and verification agents. The author is willing to pay $55–$165/month for guaranteed quality and to remove the personal-transport headache.

## Objective

Ship a regulated peer-to-peer platform that connects patients who need affordable verified generic medication with verified buyers in low-cost source countries (India, China), independent quality-verification agents equipped with portable chromatographs, and vetted carriers — with payment escrowed until the batch passes an independent chromatograph verification at both origin and destination. The patient gets the $250/month price point of bulk generic supply without the counterfeit risk, without personally crossing borders, and without trusting a single seller's claim.

## Target Users

- Primary: patients on lifelong critical-disease therapy (cancer, HIV, hepatitis C, autoimmune conditions, transplant immunosuppressants) in high-cost-of-drug countries (US, EU, Russia, UK) who cannot afford the branded medication and are willing to use generics from regulated manufacturers in India / China if quality is independently verified.
- Secondary: caregivers and patient-advocacy organizations coordinating generic procurement for multiple patients (treatment cohorts, mutual-aid groups).
- Tertiary: independent pharmacies and telemedicine clinics that want a verified-generic sourcing channel for patients they serve.

## MVP Scope

- Patient-side flow: prescription upload (PDF + photo), KYC (Persona or equivalent), matching to a verified supply route for the molecule + dose.
- Supply route: a curated catalog of generics from manufacturers in India / China with current regulatory status (WHO prequalification, Indian DCGI approval, US FDA tentative approval where applicable); each route shows the molecule, manufacturer, batch size, and per-month price ($250/month range).
- Quality verification: at origin, an independent agent equipped with a portable TLC / HPLC chromatograph samples the batch, runs the assay against the branded reference, and uploads the chromatogram + a signed verification certificate to the platform. At destination, a second optional verification pass.
- Logistics: vetted carriers handle cross-border transport under documented cold-chain and customs requirements; the platform coordinates handoff between origin agent, carrier, and patient.
- Escrow: payment held until the origin verification certificate is uploaded and the patient confirms receipt; released to seller + agent + carrier on success.
- Telemedicine partner (deferrable to v2): a regulated partner issues the prescription if the patient does not have a local prescriber; out of scope for v1 unless a partner is contracted.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The platform does NOT replace a doctor's prescription and does NOT itself dispense medication; it is a sourcing + verification + logistics layer that operates under each jurisdiction's existing pharmaceutical-import rules (personal-use import allowances in most countries cap a 90-day supply).
- Quality verification is the entire value proposition: the chromatograph agent + the signed certificate is the only thing that justifies the patient's trust and the $55–$165/month fee; the platform must not allow sellers to bypass verification or for buyers to mark "verified" without an actual certificate.
- The author is willing to pay $55–$165/month; the platform's take rate plus verification + logistics costs must fit inside this band or the unit economics break at the stated willingness-to-pay.
- Cross-border pharmaceutical import is heavily regulated (FDA personal-use policy, EU personal-import allowance, Russian 152-FZ on personal medication, Indian export controls on scheduled substances); the v1 launch must operate only on molecules and routes that are legally importable under personal-use rules in the patient's jurisdiction.
- The author has not stated a willingness to pay for verification specifically; the verification fee (chromatograph + agent time) is the largest cost driver and must be visible in the price breakdown or trust evaporates.
- The platform must not facilitate the supply of controlled substances, prescription-only medications without a valid prescription, or any product that the patient cannot legally import under personal-use rules.
- KYC must be real (government ID + prescription verification), not a checkbox; the platform's reputation and legal exposure both depend on it.
