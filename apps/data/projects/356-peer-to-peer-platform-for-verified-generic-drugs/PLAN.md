---
id: "356"
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
---
# Peer-to-peer platform for verified generic drugs

## Tech Stack

Next.js (TypeScript) for the public marketplace and the seller dashboard, with tRPC for type-safe calls between the front end and a Node API. PostgreSQL via Prisma for relational data (sellers, batches, orders, license records). An S3-compatible object store for batch-certificate PDFs and photos. Razorpay for payments (built for Indian sellers, with UPI and NetBanking). A photo-to-text pipeline for the "snap a brand strip" flow: a hosted OCR provider for the initial MVP, with a vendor switch to an open-source model if the per-image cost proves too high. The choice is driven by the particular shape of the problem: the unit of trust is a per-batch record, the buyer is mobile-first, and the seller is a small licensed entity that needs a low-friction dashboard.

## Architecture

- **Public marketplace** — Next.js page per drug, per batch, and per seller; buyer-side search by drug name and by photographed strip.
- **Seller dashboard** — login, license upload, batch listing form, order queue, dispatch confirmation.
- **Verification service** — a small back-office tool that queues newly registered sellers, fetches their license number against the state drug controller's public records, and flips the seller to "verified" on a successful match.
- **Order service** — place order, hold the lot, charge via Razorpay, request dispatch, capture the delivery receipt that carries the batch number.
- **Receipt service** — a public lookup page that, given a batch number, returns the chain: manufacturer → distributor → seller → buyer, with timestamps.
- **Photo-to-strip pipeline** — buyer uploads a photo of a brand strip; OCR pulls the brand name and strength; the system returns the closest verified generic listings.

## Milestones

1. **Phase 0 — Scaffold**: repo, Next.js + TypeScript + Prisma + tRPC skeleton, Razorpay sandbox, design tokens, empty dashboard route.
2. **Phase 1 — Core**: seller registration with license upload, verification queue tool, batch listing, buyer search, photo OCR pipeline, order flow, receipt page.
3. **Phase 2 — Pilot**: recruit 5 verified sellers in one Indian state, run 50 end-to-end orders, capture buyer retention at 30 and 90 days, document a take rate that covers the manual verifier.
4. **Phase 3 — Multi-state**: extend license verification to two adjacent states, add a public read-only API for chemists to look up a batch number.

## Risks

- Manual license verification is a per-order cost; the MVP will lose money below a minimum order size.
- A counterfeit slipping through verification is a category-ending event; the verifier must err on the side of rejecting ambiguous batches.
- The photo-to-strip OCR will produce wrong matches occasionally; the platform must show the extracted brand / strength to the buyer before they commit, not after.
- Indian state drug rules differ; the system must store the license state and refuse to ship a lot across a state border that the seller is not licensed in.
- The "buy a generic you can substitute for the brand" job borders on prescribing; the MVP must keep the recommendation read-only and route the actual substitution decision to a licensed pharmacist.
