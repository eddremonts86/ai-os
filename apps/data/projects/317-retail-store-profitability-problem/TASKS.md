---
id: "317"
slug: retail-store-profitability-problem
title: Retail store profitability problem
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/a8z3g4sod1-retail-store-profitability-problem"
category: retail
date: "2025-10-29"
tags: [Retail, Finance, Business]
country: Philippines
tech: [Next.js 14, TypeScript, Postgres, Stripe + PayMongo (PH cards + GCash), Xero / QuickBooks integration, Twilio SMS]
---
# Retail store profitability problem

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/retail-store-profitability-problem/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Daily sales entry: photo OCR (OpenAI Vision) + LLM extraction + operator approval.
- [ ] Purchase / receiving entry with supplier and unit cost.
- [ ] Per-SKU profitability calculation: revenue − cost − waste − shelf-time depreciation.
- [ ] Weekly report generator with top-3 actions: re-price, swap supplier, drop SKU.
- [ ] SMS delivery in Tagalog + English fallback via Twilio.
- [ ] Mobile-web shop console, low-end Android tested.
- [ ] Chain rollup for 2–5 shops with per-shop and aggregate profitability.
- [ ] Supplier comparison view: same SKU across suppliers, margin delta.
- [ ] Xero / QuickBooks export for shops with formal accounting.
- [ ] PayMongo GCash billing (PHP).
- [ ] Pilot with 30 sari-sari + 5 chain operators in Metro Manila; measure margin delta at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 317-retail-store-profitability-problem MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Philippines completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
