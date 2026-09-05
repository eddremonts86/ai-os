---
id: "3893"
slug: time-tracking-for-solo-consultants-that-ends-in-a-pdf-i
title: Time tracking for solo consultants that ends in a PDF invoice
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497476"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [timer engine, PDF generation, local-first storage, offline PWA, currency formatting, client management]
---
# Time tracking for solo consultants that ends in a PDF invoice

## Phase 0: Scaffold

- [x] Read the Show HN capture and confirm it is URL-only
- [x] Write SPEC.md, PRODUCT.md, PLAN.md and TASKS.md
- [x] Scaffold the app shell and the demo route
- [x] Choose the local persistence layer and the PDF library

## Phase 1: Core

- [ ] Implement the timer state machine with pause and resume
- [ ] Add clients with rate and currency
- [ ] Build the hours ledger from sessions
- [ ] Add manual entry for forgotten sessions

## Phase 2: Deploy

- [ ] Generate a PDF invoice from a selected period
- [ ] Polish the default invoice layout
- [ ] Make the demo path complete a tracker-to-invoice run in minutes
- [ ] Deploy and collect first-user feedback on the loop
