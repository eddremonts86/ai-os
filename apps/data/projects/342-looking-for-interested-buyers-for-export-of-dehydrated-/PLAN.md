---
id: "342"
slug: looking-for-interested-buyers-for-export-of-dehydrated-
title: Looking for interested buyers for export of dehydrated products from India
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/marketing/p158tshc81-looking-for-interested-buyers-for-export"
category: marketing
date: "2025-10-29"
tags: [Marketing, Business]
country: India
tech: ["Next.js (multi-language: EN/AR/ES)", Postgres, Stripe (invoice + payment), PDF export (react-pdf), WhatsApp Cloud API]
---
# Looking for interested buyers for export of dehydrated products from India

## Tech Stack

- Next.js (multi-language: EN/AR/ES)
- Postgres
- Stripe (invoice + payment)
- PDF export (react-pdf)
- WhatsApp Cloud API

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for marketing runs as a single backend service on the stack (EN/AR/ES), Postgres, Stripe (invoice + payment)) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/marketing/p158tshc81-looking-for-interested-buyers-fo` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in India, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (EN/AR/ES), Postgres, Stripe (invoice + payment)) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For India, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/marketing/p158tshc81-looking-for-interested-buyers-fo`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`342-looking-for-interested-buyers-for-e`), pin dependencies for EN/AR/ES), Postgres, Stripe (invoice + payment), and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/marketing/p158tshc81-looking-for-interested-buyers-fo` with no feature creep. A single user from India can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for India, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from India test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Verified-exporter gate depth.** A weak verification lets bad actors through; a strong gate slows supply growth. The verification tier is staged (basic / full).
- **Importer trust in new origin.** A buyer in Saudi Arabia needs to see a sample + a COA before switching from China; sample shipment must be easy.
- **Currency settlement friction.** Indian exporters want INR; importers want USD; the escrow partner covers both but FX risk is on the exporter.
