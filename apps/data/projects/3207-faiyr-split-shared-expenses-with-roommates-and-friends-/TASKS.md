---
id: "3207"
slug: faiyr-split-shared-expenses-with-roommates-and-friends-
title: Faiyr – Split shared expenses with roommates and friends without awkwardness
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/faiyr?utm_campaign=startup-184481&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Faiyr – Split shared expenses with roommates and friends without awkwardness

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3207-faiyr-split-shared-expenses-with-roommates-and-friends-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Stand up the TanStack Start skeleton with a Drizzle + SQLite connection

## Phase 1: Core

- [ ] Define the typed data model: Group, Bill, Split, Payment, Comment, Receipt
- [ ] Implement group creation and member invites
- [ ] Implement bill logging with equal split and custom-amount split
- [ ] Implement live balances derived from the bill + payment ledger (no separate balance row)
- [ ] Implement payment recording so a settled bill updates the live balance
- [ ] Implement comments and receipt attachments per bill
- [ ] Add reminders that surface when a bill is overdue
- [ ] Implement the Pro entitlement gate with Stripe-backed upgrade
- [ ] Implement the AI receipt scanner (LLM vision) behind the Pro gate, always requiring user confirmation before saving
- [ ] Implement multi-currency conversion with explicit per-entry currency labels and a base-currency rollup view
- [ ] Implement the recurring-expense scheduler that generates bills on the user-defined schedule
- [ ] Write tests for the split math, the live-balance derivation, the Pro entitlement gate, and the AI receipt-scanner confirmation flow

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
- [ ] Smoke-test: a two-person group logs three bills, settles one, leaves two open, attaches a receipt, sets a reminder; confirm live balances are correct on both members' views

---

_Generated automatically by Lúa on 2026-08-26_
