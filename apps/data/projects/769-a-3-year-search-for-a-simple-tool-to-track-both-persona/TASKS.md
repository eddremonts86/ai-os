---
id: "769"
slug: a-3-year-search-for-a-simple-tool-to-track-both-persona
title: A 3-year search for a simple tool to track both personal and business finances in one place. Nothing fits.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/mc8mvksu31-a-3-year-search-for-a-simple-tool-to-tra"
category: finance
date: "2026-01-29"
tags: [Finance, Freelance, Other]
country: USA
tech: [Next.js (App Router), TypeScript, Postgres, Drizzle ORM, Plaid, Stripe, Plausible]
---
# A 3-year search for a simple tool to track both personal and business finances in one place. Nothing fits.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/769-a-3-year-search-for-a-simple-tool-to-track-both-persona/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up Next.js (App Router) + TypeScript + Postgres + Drizzle
- [ ] Build the sign-in that lands in one workspace with personal and business surfaces
- [ ] Implement the transaction feed with a per-transaction personal/business/transfer flag
- [ ] Wire Plaid for US bank and credit-card linking with a daily refresh and a visible refresh status
- [ ] Build the counterparty-remembered override model and the rules engine that applies it on refresh
- [ ] Implement personal budget and business cash-flow views sharing the one transaction feed
- [ ] Add CSV import paths for common bank and credit-card exports, routed through the same flagging logic
- [ ] Add CSV export at any time without a paid tier
- [ ] Build the schedule-C-structured tax-year summary with a one-page export
- [ ] Wire the receipts surface with per-transaction attachments and correct surfacing on either side of the flag
- [ ] Add Plausible for meta-only product analytics with no financial event ingestion
- [ ] Write an integration test that covers a flag override remembered across refreshes, a transfer detected between personal and business, and a one-page tax-year export

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
