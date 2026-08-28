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

## Value Proposition

Faiyr helps roommates, couples, and groups track shared expenses and settle up without hassle. Create groups for any situation, log bills in seconds, split equally or by custom amounts, and see live balances so everyone knows who owes what. You can record payments, set reminders, and keep a transparent history with comments and receipts. Faiyr offers core features for free and stays ad-free, with a Pro upgrade for unlimited groups, AI receipt scanning, multi-currency, and flexible recurring expenses. View startup

**One-liner:** A shared-expense app for roommates, couples, and groups that logs bills in seconds, splits them equally or by custom amounts, shows live balances so nobody has to ask "who owes what", and keeps a transparent receipt-and-comment history — free and ad-free at the core, with a Pro upgrade for unlimited groups, AI receipt scanning, multi-currency, and flexible recurring expenses.

## Target Users

- Primary: roommates and couples who share bills regularly and want a live running balance so the awkward "who owes what" conversation goes away.
- Secondary: groups of friends or travel companions who split one-off costs and want a transparent receipt-and-comment history that survives the trip.

## Jobs To Be Done

1. Functional — log a bill in seconds, split it equally or by custom amounts, and see live balances across the group.
2. Emotional — remove the "awkwardness" the title calls out: the user no longer has to chase a roommate for their share of the electricity bill.
3. Social — keep the history transparent (comments and receipts) so disputes have a single source of truth the group can refer back to.

## Success Metrics

- Bills logged per active group per week (signals whether the app is actually being used, not just installed).
- Time from "bill happened" to "bill logged": the source calls out "in seconds"; faster is better.
- Pro conversion rate: what fraction of free-tier users upgrade; a low rate may mean the free tier is too generous or the Pro upgrade is not visible.
- Multi-currency activation: how many Pro users turn on multi-currency, since the source names it as a paid feature.

## Pricing & Monetization

The source is explicit: core features are free and ad-free; the Pro upgrade adds unlimited groups, AI receipt scanning, multi-currency, and flexible recurring expenses. No price point is stated.

## Competitive Landscape

Not stated in the source. Splitwise and similar apps exist as a category but the post does not name any specific competitor.

## Risks & Open Questions

- Free-tier group limit: the source does not say how many groups a free user can have. Picking a number (e.g. 3) and being explicit about it is part of the upgrade story.
- AI receipt-scanning quality: receipts vary wildly in quality; bad scans that silently misread amounts will erode trust faster than no scan at all.
- Multi-currency correctness: exchange rates change; the MVP must decide whether balances are stored in the transaction currency or in a base currency, and surface that decision to the user.
- Ad-free promise fragility: any future ad SDK or sponsored suggestion would break the explicit product promise and have to be reverted immediately.
