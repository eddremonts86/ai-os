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

## Problem

The capture is a category-level problem statement from ProblemHunt: the `## Problem` body carries only the country name Philippines, and the title — "Retail store profitability problem" — is the entire problem statement. Nothing else in the capture adds detail: no description, no quoted persona, no specific retail category, no store size, no current system named, no margin cited. The honest ground truth is therefore the title plus the `Retail, Other` tags plus the country.

The problem the title names is real and recurring for small retail stores in the Philippines: a sari-sari store, a small supermarket, a bakery, a hardware store, a convenience-store franchisee, a pharmacy, a small apparel shop — the owner-operator makes decisions every day about what to stock, what to reorder, what to discount, what to discontinue, and how to price, on intuition and on a notebook. The friction is not that small retailers cannot imagine an analytics dashboard, it is that the tools that exist are either too expensive (an enterprise POS suite with a monthly licence), too English-centric (a generic dashboard that ignores Filipino retail categories and Filipino peso pricing), or too data-heavy (a BI tool that requires the owner to type in the day's transactions to get a number out). The result is that the most consequential decisions in the store — what to reorder and what to discount — are made by feel.

The product implication, without inventing specifics, is that a Filipino small-retail owner-operator needs a way to capture point-of-sale data as it happens (or in a short evening reconciliation), see per-product margin and per-day profitability without a spreadsheet, and act on a small set of concrete signals (slow-moving stock to discount, fast-moving stock to reorder, category-level margin drift) without becoming a data analyst. The MVP is a profitability surface for small retail; it is not a full POS, it is not an enterprise BI tool, and it does not require the owner to migrate from their existing cash-register or notebook workflow. Country-specific facts the capture does not state — specific Filipino retail category taxonomies (sari-sari staples, Filipino snack brands, sachet-everything pricing), current Bangko Sentral ng Pilipinas rules on cash float reconciliation, the specific Filipino payment processors available for any paid tier, or the Filipino-language versus English-language UI expectation — are flagged as open questions rather than asserted.

## Objective

Ship a profitability surface for Filipino small-retail owner-operators that captures point-of-sale data through a low-friction daily reconciliation flow (or, where available, a payment-processor integration), turns that data into per-product margin and per-day profitability without requiring a spreadsheet, and surfaces a small set of concrete signals (slow-moving stock to discount, fast-moving stock to reorder, category-level margin drift) the owner can act on in the same day. The MVP must work on a phone, must not require the owner to migrate from their existing cash-register workflow, and must be priced for Filipino small-retail economics rather than for an enterprise POS market.

## Target Users

- Filipino sari-sari store owner-operators who currently run their store on a notebook and a cash float, and want per-product margin without a spreadsheet.
- Filipino small-supermarket and convenience-store owner-operators who already use a basic POS or a tablet-based register and want profitability signals layered on top.
- Filipino bakery and food-retail owner-operators with a small daily product mix where margin drift and slow-moving stock are visible only at the end of the month.
- Filipino hardware and construction-supply store owner-operators dealing with low-velocity but high-value inventory, where reorder timing is the margin lever.
- Filipino pharmacy and health-product store owner-operators where category-level margin drift matters more than per-product volume.
- Filipino franchisees of regional retail chains who report margin to a head office and want to see the same numbers the head office sees.

## MVP Scope

- A mobile app (Flutter) that accepts a daily reconciliation flow: total sales for the day, total cash, and a short list of items sold by name and quantity, with the option to scan a barcode or pick from a maintained product catalogue.
- A payment-processor integration (where available) that captures point-of-sale data automatically for any transaction that runs through the integrated processor, reducing the daily reconciliation to a few taps.
- A product catalogue the owner can populate once and reuse, with category tags that match common Filipino retail categories, and a per-product cost and price the owner enters.
- A per-product margin view that shows the day's margin per product, with a running weekly and monthly aggregate, sorted by margin contribution.
- A per-day profitability view that shows the day's gross margin, with a running weekly and monthly aggregate and a category breakdown.
- A signal panel that surfaces three concrete actions: slow-moving stock to discount, fast-moving stock to reorder, and category-level margin drift in the last seven days.
- A weekly summary message (in-app and optionally SMS) that lists the three signals in plain language the owner can act on.
- An export of the day's and the week's numbers as a CSV the owner can hand to an accountant or a head office.
- An explicit non-POS-replacement disclaimer on every screen, naming that the app does not replace the owner's existing cash register or POS, it sits alongside it.
- Audit logging of every reconciliation, signal generation and export, with the data version referenced.
- An operator-facing product-taxonomy editor where new categories and common-product entries can be added, edited and retired without app update.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The app is a profitability surface only; it is not a POS, it does not replace the owner's existing cash register or POS, and the disclaimer must be visible on every screen.
- The MVP must work on a phone, must work on low-bandwidth Filipino mobile connections, and must not require a desktop or a tablet to be useful.
- Daily reconciliation must be completable in a few minutes; a flow that requires the owner to type in every transaction by hand is not the MVP.
- The product taxonomy is curated by the operator rather than typed in by the owner from scratch; common Filipino retail categories and common-product entries are pre-loaded.
- Personal data (sales, cost, supplier relationships) is sensitive in the Filipino small-business context; a documented retention policy must exist before any pilot user is onboarded.
- Margin and profitability signals are descriptive, not advisory; the app does not tell the owner what price to set, what to reorder or what to discount, it surfaces the signal and lets the owner act.
- The MVP is priced for Filipino small-retail economics; a paid tier that is meaningful only in a US SMB market is the wrong pricing for the day-one product.
