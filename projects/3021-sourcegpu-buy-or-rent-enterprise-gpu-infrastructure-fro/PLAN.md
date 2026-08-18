---
id: "3021"
slug: sourcegpu-buy-or-rent-enterprise-gpu-infrastructure-fro
title: SourceGPU – Buy or rent enterprise GPU infrastructure from vetted providers
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/sourcegpu?utm_campaign=startup-182581&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-17"
tags: [BetaList, Beta, Product]
---
# SourceGPU – Buy or rent enterprise GPU infrastructure from vetted providers

## Tech Stack

- **Backend service:** Node.js with Fastify for the marketplace API; TypeScript across the codebase so the supplier, listing, and escrow contracts are typed end to end.
- **Database:** PostgreSQL with Prisma — relational data fits suppliers, listings, reservations, rentals, escrow events, and disputes; Prisma gives typed access without hand-writing SQL across the marketplace tables.
- **Escrow provider:** Integration with a regulated escrow partner (or a banking API where regional regulation permits) so the purchase flow can hold funds until buyer acceptance without inventing a financial product in-house.
- **Supplier verification:** A document-collection pipeline that stores business registration, tax IDs, and reference-customer letters in encrypted object storage, plus an admin review queue where a human verifier approves or returns the application.
- **Rental telemetry:** A small agent (Go or Rust) the supplier installs on the rental host that reports per-GPU uptime, so the uptime-billed contract has a real number to bill against.
- **Frontend:** React with a heavy data-table component (TanStack Table) for the marketplace catalogue and a server-rendered landing page for SEO; both share the same Fastify backend.

## Architecture

```
+-----------------+       +-----------------+       +-----------------+
|  Supplier       |       |  Buyer          |       |  Admin verifier |
|  dashboard      |       |  dashboard      |       |  dashboard      |
+--------+--------+       +--------+--------+       +--------+--------+
         \                          |                         /
          \                         |                        /
           +-----------+------------+-----------------------+
                       |
              +--------v---------+
              |  Fastify API     |
              |  (marketplace)   |
              +---+----+----+----+
                  |    |    |
       +----------+    |    +----------+
       |               |               |
+------v------+ +------v------+ +-------v-------+
| Postgres    | | Escrow API  | | Rental agent  |
| (Prisma)    | | (regulated) | | (uptime       |
|             | |             | |  telemetry)   |
+-------------+ +-------------+ +---------------+
```

The two-sided marketplace has three frontends (supplier, buyer, admin) backed by one Fastify API. The escrow provider is external so the platform does not hold buyer funds directly; the rental agent on the supplier's host feeds uptime into the rental billing pipeline, which is the data source for both the invoice and any dispute resolution.

## Milestones

1. **M0 — Verification pipeline:** Document collection, encrypted storage, and admin review queue for supplier applications; the gate is manual but the pipeline is automated end-to-end so a verifier can approve a clean application in under an hour.
2. **M1 — Listing and catalogue:** Supplier dashboard for uploading inventory across the four categories (servers, clusters, workstations, standalone GPUs), public catalogue with filters for SKU, generation, and region.
3. **M2 — Purchase with escrow:** Buyer purchase flow wired to the external escrow provider, with the funds-held, delivery-confirmed, buyer-accepted lifecycle and a documented dispute path.
4. **M3 — Rental with uptime telemetry:** Rental-agent install guide, hourly reservation flow, and an invoice generated from the agent's uptime feed so the rental contract is genuinely uptime-billed.
5. **M4 — Saved searches and supplier payouts:** Buyer-side saved-search alerts for new inventory in categories they care about; supplier-side payout dashboard with a per-transaction ledger and a payout-schedule summary.
6. **M5 — Blackwell and category expansion:** Blackwell listings as a forward-looking category, with the verification and escrow pipelines already in place from earlier milestones.

## Risks

- **Verification gate that is too slow** — if supplier approvals take weeks, the supply side starves. Mitigation: a documented SLA and a fast path for suppliers with prior delivery history on the platform.
- **Escrow provider downtime or freeze** — a regulated partner can hold funds longer than expected during a compliance review, frustrating both sides. Mitigation: a clear SLA in the partner contract and a status visible in the buyer dashboard.
- **Rental telemetry tampering** — a dishonest supplier could under-report downtime to inflate bills. Mitigation: cross-check the supplier agent's feed against independent probes (cloud-monitor pings, SSH liveness) and treat a divergence as a dispute trigger.
- **GPU price volatility** — a listing priced six weeks ago may be uncompetitive today. Mitigation: a listing-staleness signal in the catalogue UI and a freshness SLA suppliers must honour to stay listed.
