---
id: "874"
slug: lack-of-convenient-service-for-buying-and-selling-used-
title: Lack of convenient service for buying and selling used cars
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a40dcs4621-lack-of-convenient-service-for-buying-an"
  captured: "2025-10-28"
category: retail
date: "2025-10-28"
tags: [Retail, Other]
country: USA
wtp:
  raw: fixed one-time fee per transaction (works for both buyers and sellers)
  currency: USD
  min: 0
  max: 0
  period: one-shot
  mrrMid: 0
tech: [Next.js, TypeScript, Go (API), PostgreSQL, Stripe Connect]
---
# Lack of convenient service for buying and selling used cars

## Problem

Guy Roger in the USA reports a recurring pain around buying used cars: existing services are not convenient or transparent for either side of the transaction. He has tried Facebook Marketplace, public auctions, and car dealerships and concluded each has the same drawbacks — lack of transparency, difficulty verifying vehicle history, and inconvenient transaction mechanics. The post does not commit to a dollar amount but signals willingness to pay a fixed one-time fee during a car-buying or selling event, with a model that works for both buyers and sellers. The author is also open to a technical-co-founder collaboration, which signals that the post is early-stage.

The implicit problem the post is naming is that the used-car transaction is structurally a two-sided trust problem: the buyer cannot verify what they are paying for, and the seller cannot easily prove the vehicle's condition. Existing platforms (marketplaces, auctions, dealerships) each fail one side of that trust gap.

## Objective

Ship a used-car transaction service that handles both sides of the trust gap: a transparent vehicle-history bundle on the listing side, and a single fixed-fee transaction on the close. The MVP must prove the loop end-to-end: a buyer sees a listing with a verifiable vehicle history, makes an offer, the transaction clears, and both sides can refer back to a single record of what was inspected and agreed.

## Target Users

- Primary: individual buyers like Guy Roger who have already bought 3–4 used cars in recent years and have hit the same transparency friction each time. They will pay a fixed one-time fee for a smoother transaction.
- Secondary: individual sellers (often the same person across multiple sales in a lifetime) who want to prove their vehicle's condition and history before negotiation starts.
- Tertiary: small independent dealers who buy and sell used cars as a side business and want a workflow that does not require a dealership license to complete a transaction.

## MVP Scope

- A listing surface where a seller uploads the vehicle's VIN, photos, and known history; the system pulls the open NHTSA / NMVTIS vehicle-history record and merges it with the seller's claims.
- A vehicle-history bundle displayed on every listing: title history, odometer readings, accident / damage reports from NMVTIS, recall status, and a clear "this is what the seller claims vs. what the registry says" reconciliation.
- An offer and counter-offer flow on each listing, with the conversation anchored to the vehicle's facts (price relative to mileage and condition) rather than to negotiation tactics.
- A fixed-fee transaction layer (Stripe Connect for the split payment) charged once per closed deal; no subscription, no listing fees in v1.
- A single-record transaction archive that both sides can refer back to: what was inspected, what was agreed, what was paid.

## Design Direction

See `DESIGN.md` for this project's design tokens. The product is a transaction surface, not a discovery surface: listings should be sparse, photos large, vehicle-history bundles prominent. Negotiation lives in a thread anchored to the vehicle, not in messages detached from the listing.

## Constraints

- Pricing is fixed one-time per transaction, not subscription. The unit economics have to close per-deal, which means the per-transaction fee has to cover the NMVTIS pull cost, the Stripe Connect fee, and the operator margin.
- The vehicle-history bundle must be honest about what the registries cover and what they do not. NMVTIS is incomplete for vehicles that have crossed state lines multiple times; the UI must surface that limitation rather than imply a complete record.
- The post says the author is "looking for a technical co-founder." The product's MVP does not need a co-founder to ship — but the early go-to-market conversation should account for the author's role as a design partner, not just a customer.
- The transaction surface must work in every US state, which means dealer-license requirements, title-transfer mechanics, and sales-tax handling vary by state. The MVP should pick a small set of states to launch in and not pretend to be national on day one.
- Stripe Connect's marketplace fee structure is the natural fit for the buyer-seller split; the implementation must handle refunds, partial refunds, and disputes because used-car transactions have a higher dispute rate than typical e-commerce.
