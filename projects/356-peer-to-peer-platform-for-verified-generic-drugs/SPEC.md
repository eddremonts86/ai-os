---
id: "356"
slug: peer-to-peer-platform-for-verified-generic-drugs
title: Peer-to-peer platform for verified generic drugs
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/health/tp6dgyysf1-peer-to-peer-platform-for-verified-gener"
category: health
date: "2025-10-10"
tags: [Health]
country: India
---
# Peer-to-peer platform for verified generic drugs

## Problem

In India, branded originator medicines cost substantially more than their generic equivalents, and patients — particularly those paying out-of-pocket in cities and towns without strong public insurance — routinely pay the brand price because they do not trust the supply chain of unbranded generics or cannot identify a verified substitute at the chemist. The source post on ProblemHunt frames the gap as a peer-to-peer marketplace that would let verified suppliers and verified buyers of generic drugs transact with provenance guarantees. The problem is fundamentally a trust problem: the named objects (generics) already exist in the supply chain, but the buyer cannot tell which tablets in front of them are the same drug, from a licensed facility, stored correctly, and within expiry. The deeper suffering is dual: patients overpay for branded versions of drugs they could afford as generics, and small licensed generic manufacturers struggle to reach buyers who distrust the category.

## Objective

Build a peer-to-peer marketplace that lets verified sellers of generic drugs list lots with verifiable provenance (manufacturer license, batch number, expiry, lab certificate) and lets verified buyers purchase those lots with confidence that the product matches what the listing claims. The MVP should produce a single end-to-end transaction in which a buyer can identify a generic substitute for a branded drug, verify the seller's credentials and the batch's provenance, place a small order, and receive a delivery with a receipt that ties the batch back to the named manufacturer. Success means a buyer who would otherwise have paid the brand price for a thirty-day course can instead buy the verified generic at a measurable discount and report that they trust the substitute is the drug they were prescribed.

## Target Users

- **Uninsured or underinsured patients in India** who pay out-of-pocket for chronic-disease medication (e.g., diabetes, hypertension, asthma) and currently choose brand-name drugs because they believe generics are unreliable.
- **Small licensed generic manufacturers and licensed distributors** in India who can produce verified batches but lack a direct channel to end buyers who will accept their product over a brand.
- **Pharmacists and small chemist shops** who want to stock verified generic inventory with traceable provenance and pass that trust to walk-in customers.
- **Caregivers buying on behalf of a family member**, who need to verify a substitute is safe before substituting.

## MVP Scope

- A catalog where every listed batch shows: manufacturer name, drug name and strength, batch number, manufacturing date, expiry, license ID, and an optional lab certificate (PDF/photo).
- A peer-to-peer listing flow where a verified seller (manual license check at MVP stage) can create a lot listing with the above provenance fields and a unit price.
- A buyer search by drug name or by photographing a branded strip (the common Indian context: patient has a strip of the brand and wants the generic equivalent).
- A simple order flow: buyer reserves a lot, seller confirms, buyer pays, seller dispatches, buyer receives with a delivery receipt that carries the batch number.
- A verification layer where, before the first transaction, a human reviewer checks the seller's license number against the regulator's database and flips the seller to "verified."
- A receipt page that, given a batch number, shows the chain: manufacturer → distributor → seller → buyer.

## Constraints

- **Regulatory**: any product handling in India requires compliance with the Drugs and Cosmetics Act and state drug controller rules; the platform MVP must not handle Schedule X or narcotics, and must keep all transactions traceable for at least 24 months.
- **Verification cost**: license verification is manual at MVP and is a real human cost; the unit economics of a single ₹90 generics order cannot absorb a full-time reviewer, so the MVP must concentrate on a small number of high-volume sellers, not a long tail.
- **Cold-chain integrity**: most generic drugs the audience cares about are oral solids (no cold chain), but the platform must still require sellers to declare storage conditions and refuse to list lots that require temperature control the seller cannot document.
- **Trust without a brand**: the system has no equivalent of a brand-name trusted seller; provenance must be earned per-listing, not inherited.
- **No prescription marketplace**: the platform sells generic drugs, not medical advice; it must route buyers who need a prescription or a substitution decision to a licensed pharmacist rather than recommending replacements on its own.
