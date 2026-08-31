---
id: "3811"
slug: masareef-android-expense-tracker-that-reads-bank-alerts
title: Masareef – Android expense tracker that reads bank alerts on-device
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495918"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Android expense tracker, on-device SMS alert parsing, local transaction store, bank notification templates, local expense categorization, Play Store distribution]
---
# Masareef – Android expense tracker that reads bank alerts on-device

## Phase 0: Scaffold

- [x] Read the Show HN post and confirm it is a URL-only capture pointing at the Play listing
- [x] Write SPEC.md (this document)
- [x] Create the Android project with SMS receiver permissions wired
- [x] Set up a local database schema for transactions and categories

## Phase 1: Core

- [ ] Implement alert intake from SMS (and notification access where available)
- [ ] Build the parser extracting amount, merchant and timestamp from a first set of bank formats
- [ ] Add the ledger UI: list, categories, monthly totals
- [ ] Add the review flow (confirm, correct, dismiss) and feed corrections into template matching

## Phase 2: Deploy

- [ ] Expand parser coverage across more banks and message formats
- [ ] Harden the permissions flow for Play policy compliance on SMS access
- [ ] Release to the Play Store and track capture rate and review burden per bank format
