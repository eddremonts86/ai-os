---
id: "899"
slug: need-to-withdraw-cash-from-credit-card-without-high-fee
title: Need to withdraw cash from credit card without high fees
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/6obgkxdbi1-need-to-withdraw-cash-from-credit-card-w"
  captured: "2025-10-10"
category: finance
date: "2025-10-10"
tags: [Finance]
country: Portugal
tech: [Next.js, TypeScript, Node.js API, PostgreSQL, a curated fee-database of Portuguese ATMs and bank cash-advance policies, Plaid / TrueLayer aggregator where available, no transactional money handling in v1]
---
# Need to withdraw cash from credit card without high fees

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/899-need-to-withdraw-cash-from-credit-card-without-high-fee/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Fee database v0: 7 largest Portuguese banks (CGD, BPI, Millennium BCP, Novo Banco, Santander Totta, Activobank, plus one challenger if applicable) plus Multibanco, for Visa and Mastercard
- [ ] Every fee entry has a source link to the bank's published schedule (or Multibanco's surcharge disclosure) and a `last_verified_at` timestamp
- [ ] Next.js lookup form: card network, issuer (free-text autocomplete), city; ranked results for €100 / €200 / €500 withdrawal amounts
- [ ] Plain-English breakdown on every result: issuer cash-advance fee, interest-from-day-one cost, foreign-transaction fee if applicable, ATM-owner fee — surfaced as separate lines so the user can see why the total is what it is
- [ ] Side-by-side comparison: credit-card cash advance vs debit card vs Revolut / Starling / Wise at the same ATM, with effective cost for the chosen amount
- [ ] Shareable result URL: each lookup result has a stable URL the user can send to a friend
- [ ] Affiliate disclosure copy reviewed by counsel; affiliate links for fee-free card products (Revolut, Starling, Wise) appear with the disclosure on the same screen, before the click
- [ ] Quarterly fee-database re-verification workflow documented; last-verified-date visible on every result
- [ ] No card data is ever entered into the product; no PCI-DSS scope; no transactional money handling in v1
- [ ] End-to-end test: user picks Visa + CGD + Lisbon + €200, gets a ranked list with separate fee lines, sees the side-by-side vs fee-free cards, shares the URL, the recipient sees the same result

## Phase 2: Deploy

- [ ] 1,000 Portugal-resident users complete at least one lookup
- [ ] Set up status page + fee-database staleness alerts (entries older than 90 days flagged)
- [ ] Phase 2 evaluation: supporter-tier fee-update email workflow (€19/year)
- [ ] Cross-border expansion deferred until Spain fee database is independently reviewed
- [ ] Post-mortem after week 10 with pilot cohort and fee-database auditor
