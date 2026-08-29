---
id: "859"
slug: retail-store-profitability-problem
title: Retail store profitability problem
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/r94p9mdzl1-retail-store-profitability-problem"
category: retail
date: "2025-10-31"
tags: [Retail, Other]
country: Philippines
tech: [Flutter (mobile), Dart, Firebase Firestore, Firebase Cloud Functions (Node.js), Cloudflare Workers, Square Reader SDK (sandbox), Xendit (sandbox), Google Cloud Storage, Coolify, Docker]
---
# Retail store profitability problem

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/859-retail-store-profitability-problem/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Flutter mobile app with the daily reconciliation flow, product catalogue picker and Firestore offline persistence
- [ ] Implement per-field sync status surfacing so the owner knows what is and is not yet persisted
- [ ] Build the per-product margin view and the per-day profitability view with weekly and monthly aggregates
- [ ] Implement the scheduled Cloud Function per owner that generates slow-moving, fast-moving and category-drift signals with operator-configurable thresholds
- [ ] Build the signal panel UI showing the three signals with the underlying data version referenced
- [ ] Implement the weekly summary in-app and optional SMS message with the three signals in plain language
- [ ] Build the server-side CSV export with non-POS-replacement disclaimer in the header and per-owner GCS prefixes
- [ ] Wire the Square Reader SDK (sandbox) and Xendit (sandbox) payment-processor integrations behind opt-in consent and per-transaction audit log
- [ ] Add the operator product-taxonomy editor behind admin auth to add, edit and retire common-product entries and categories
- [ ] Add Cloudflare Workers edge caching for the read-heavy signal panel
- [ ] Wire the request-id-tied audit log across reconciliations, signal generations, exports and consent changes
- [ ] Define and document the retention policy for sales, cost and supplier data before any pilot owner is onboarded

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
