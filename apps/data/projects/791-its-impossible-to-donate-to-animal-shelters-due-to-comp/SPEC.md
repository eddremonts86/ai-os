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

## Problem

Animal shelter fundraisers in Russia cannot collect donations from people who want to give, because the trust required to send money to a shelter has collapsed. The post frames the gap as a structural one: there is no service that combines guaranteed transparency (every contribution traceable to its declared use) with an independent audit (a third party able to verify the claim). The implication is that even donors who want to give are staying on the sideline, and shelters that need the money cannot reach them.

The capture is a one-line problem statement from ProblemHunt, with country listed as Russia and no further detail. The post does not name a specific shelter, a fundraising platform that failed, a regulator, an audit standard, or a fund amount. What it names is the actor (someone who wants to donate to an animal shelter), the pain (complete distrust in charity fundraisers), and the missing thing (a service with guaranteed transparency and audit). The plan treats those bare facts as the ground truth.

What follows from those bare facts is the shape of the problem: any solution has to make the path of a single donation inspectable from the donor's screen to the shelter's bank account, has to produce evidence a third party can verify rather than evidence the shelter itself produces, and has to give the donor a reason to believe the evidence before they press Send. The source does not claim the gap is unprecedented — only that it is unfilled — so the plan scopes the narrowest honest MVP that addresses exactly what is named: transparency per donation plus an audit layer a third party can replay.

## Objective

Build a donation-collection service for Russian animal shelters where every contribution carries a verifiable trail from donor to declared use, the trail is produced by an independent audit layer rather than by the shelter itself, and a donor can inspect the trail before sending money — so a donor who wants to give can do so without trusting the fundraiser on faith.

## Target Users

- Individual donors in Russia who want to give to an animal shelter but will not send money to a fundraiser whose accounts they cannot see.
- Russian animal shelters that have lost donor trust and need an auditable channel to recover it.
- Russian animal shelters that never had donor trust at scale and need a launch surface that earns it.
- Independent auditors — accountants, charity watchdogs, journalists — who need read access to the donation trail to verify a shelter's claims.
- Repeat donors who gave once through the service and need a way to track the specific shelter they supported over time.
- Shelter volunteers who want to publish a transparent report without becoming accountants themselves.

## MVP Scope

- A shelter onboarding flow that records the shelter's legal name, registration details, bank account for receiving funds, and the categories of expense the shelter intends to fund (food, veterinary, shelter maintenance).
- A per-shelter public page listing active fundraising campaigns, each with a declared target, a declared use (what the money is for), and a current total against that target.
- A donation flow that takes a single contribution from a donor, attributes it to a specific campaign, and writes a donation record that includes the donor's chosen visibility (public, named-anonymous, or private).
- A per-campaign audit log that records every donation, every disbursement to the shelter, and every reported expense, each row tied to an external document the shelter uploaded (invoice, receipt, veterinary bill).
- An independent audit layer that verifies the uploaded documents against the declared expense categories and flags mismatches for review — the audit is performed by the service, not by the shelter.
- A per-donor receipt page that shows where their contribution went, what it paid for, and the document the audit layer accepted as proof.
- A read-only audit API that lets an independent auditor pull the donation trail, the disbursement trail, and the document set for any shelter, so the audit is replayable by a third party.
- Russian-language copy throughout, since the source country is Russia and the actors are Russian.
- A documented data-retention policy that states how long donation records and documents are kept, and what happens to them after.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Transparency is per donation, not aggregate. A shelter that publishes only a monthly total does not satisfy the gap the source names — every contribution has to be traceable to its declared use.
- The audit layer is the service's responsibility, not the shelter's. A shelter that uploads its own proof and self-declares it valid is exactly the model the source says has failed.
- Uploaded documents have to be stored in a way that the audit can replay them later — that means durable object storage with versioned retrieval, not a filesystem the shelter controls.
- Donor privacy is real: a donor who chose private visibility cannot be surfaced in any audit API response, even to the shelter.
- The service does not itself hold the donated funds long-term. Funds flow from donor to shelter via a licensed payment processor; the service is the ledger and audit layer, not a bank.
- Russian personal-data and charity-fundraising rules apply. The MVP must confirm what is permissible before launching with real donations, and the documented data-retention policy must reflect that.
- The audit layer cannot promise zero fraud; it can promise that every claim is documented, that mismatches are flagged, and that an independent auditor can replay the trail. That is the threshold the source asks for.
