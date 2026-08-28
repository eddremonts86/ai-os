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

## Problem

Faiyr helps roommates, couples, and groups track shared expenses and settle up without hassle. Create groups for any situation, log bills in seconds, split equally or by custom amounts, and see live balances so everyone knows who owes what. You can record payments, set reminders, and keep a transparent history with comments and receipts. Faiyr offers core features for free and stays ad-free, with a Pro upgrade for unlimited groups, AI receipt scanning, multi-currency, and flexible recurring expenses. View startup

## Objective

Build a shared-expense app that lets roommates, couples, and other groups log bills, split them equally or by custom amounts, see live balances, record payments, set reminders, and keep a transparent history with comments and receipts — free with no ads at the core, and a paid Pro upgrade for unlimited groups, AI receipt scanning, multi-currency, and flexible recurring expenses.

## Target Users

1. Roommates and couples who share bills regularly and want a running live balance so nobody has to ask "who owes what" in person.
2. Groups of friends or travel companions who split one-off costs and want a transparent history with comments and receipts that survive the trip.

## MVP Scope

- Free core: groups, equal split, custom-amount split, live balances, payment recording, reminders, comments, receipt attachments.
- Ad-free at the core per the source.
- A paid Pro upgrade that unlocks unlimited groups, AI receipt scanning, multi-currency, and flexible recurring expenses — kept behind an explicit upgrade path, not bundled into the free tier.
- A transparent history per group so every entry is visible to every member.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Core features stay free and ad-free; the source is explicit that the ad-free promise is part of the product.
- The four named Pro features (unlimited groups, AI receipt scanning, multi-currency, flexible recurring expenses) are the only paid features — do not invent additional paid features the source does not name.
- The free tier has a group limit; the source does not state the limit, so the MVP must pick one and document it.
- No payments, billing, or compliance requirements beyond the standard app-store / web-billing scope are stated; treat those as out of scope until the source says otherwise.
