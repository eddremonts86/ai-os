---
id: "759"
slug: procurement-data-quality-suffers-supplier-contacts-outd
title: "Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing solutions too expensive or don't fix data quality. Need a simple tool for $10/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/1xuloij3k1-procurement-data-quality-suffers-supplie"
  captured: "2026-03-10"
category: business
date: "2026-03-10"
tags: [Business, Finance, Other]
country: Brazil
wtp:
  raw: $10/month
  currency: USD
  min: 10
  max: 10
  period: month
  mrrMid: 10
tech: [React + Vite, Node.js (Fastify) API, Postgres, scheduled enrichment workers (Node.js cron), CSV / Google Sheets import-export]
---
# Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing solutions too expensive or don't fix data quality. Need a simple tool for $10/month.

## Phase 0: Scaffold

- [x] Capture ProblemHunt post by Fabiano Menezes (Brazil, 2026-03-10, 1% equity for feedback)
- [ ] Define `suppliers`, `negotiations`, `purchases`, `enrichment_events` tables in Postgres with Drizzle
- [ ] Provision Fastify API + React + Vite SPA on a single Coolify instance
- [ ] Decide enrichment cost ceiling (target ≤ $1 per workspace per month) and pick free / cheap data sources first
- [ ] Decide field-mapping UX for the CSV / XLSX importer (no silent guessing)

## Phase 1: Core

- [ ] Workspace + supplier table UI (inline edit, "verified on" date on every row)
- [ ] CSV / XLSX import with explicit field-mapping step
- [ ] Google Sheets import via share link + Sheets API
- [ ] CSV export from any view (one click, anytime)
- [ ] Negotiation log per supplier (chronological, with quote requested / received / counter / accepted states)
- [ ] Purchase log per supplier (chronological, with quantity / unit price / total / free-text note)
- [ ] Enrichment worker v1: daily cron, CNPJ lookup (Receita Federal), website scrape (phone / email), domain expiry
- [ ] Confidence threshold: only auto-update when confidence passes; otherwise write to `enrichment_events` with `needs_review: true`
- [ ] Dashboard widget: rows stale ≥ N days, no contact, no recent price update
- [ ] Stripe Checkout on $10/month + 14-day trial; workspace status gating
- [ ] End-to-end test: import the poster's spreadsheet, run two enrichment cycles, confirm auto-updates land in the "needs review" surface and stale-data widget trends down

## Phase 2: Deploy

- [ ] Onboard 25 paid workspaces
- [ ] Move Stripe to live mode
- [ ] Cost instrumentation on enrichment per workspace (alert if enrichment cost / workspace / month > $1)
- [ ] Post-mortem at week 12: enrichment coverage, dashboard trends, retention past the third billing cycle
