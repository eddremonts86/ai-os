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

## Tech Stack

- **Frontend:** React + TypeScript with TanStack Start, mobile-first because the use case (log a bill in seconds) is mostly in-the-moment.
- **Backend:** Node.js API on TanStack Start handling groups, bills, splits, balances, payments, reminders, and comments.
- **DB:** SQLite with Drizzle ORM. Groups, bills, splits, payments, receipts (as binary blobs or object-store references), and comments.
- **AI receipt scanning (Pro):** an LLM-vision call that reads a receipt photo and extracts line items + total. Wrapped behind a Pro entitlement check.
- **Multi-currency (Pro):** currency conversion handled against a daily-rate source; balances are kept in the transaction currency with an explicit base-currency rollup view.
- **Recurring expenses (Pro):** a job queue that generates bills on the schedule the user picked.
- **Payments:** Stripe (or equivalent) for the Pro upgrade path; no in-app settlement of debts between users is implied by the source.
- **Deployment:** Coolify + Docker.

## Architecture

```
Mobile / web client (React + TanStack Start)
    │
    ▼
Node.js API
    ├─ Group / bill / split / balance engine
    ├─ Comments + receipts store (SQLite + object store)
    ├─ Reminders scheduler
    ├─ Pro entitlement gate
    │     ├─ AI receipt scanner (LLM vision)
    │     ├─ Multi-currency conversion service
    │     └─ Recurring expense scheduler
    └─ Stripe for Pro upgrade
```

- The bill engine is the same code path for free and Pro users; the Pro features are entitlements on top, not a parallel app.
- Balances are computed from the bill + payment ledger; there is no separate "balance" row to drift out of sync.

## Milestones

1. **M0 — Spec + design tokens + data model.** Existing SPEC.md and DESIGN.md approved; group / bill / split / payment tables are stable.
2. **M1 — Free core.** Create group, log bill, equal split, custom split, live balance, payment recording, comments, receipt attachments.
3. **M2 — Reminders.** Bills can have a reminder attached; users get notified.
4. **M3 — Pro entitlement gate.** Stripe-backed Pro upgrade unlocks unlimited groups, AI receipt scanning, multi-currency, and flexible recurring expenses.
5. **M4 — AI receipt scanner.** A user with Pro on can snap a receipt; the LLM extracts line items and the user confirms before the bill is saved.
6. **M5 — Multi-currency + recurring expenses.** Multi-currency rollups and the recurring-expense scheduler ship behind the Pro gate.

## Risks

- AI receipt-scanning correctness: bad scans that misread the total will cause real-world disputes. The MVP must always show the extracted bill for confirmation before saving.
- Multi-currency drift: balances stored in mixed currencies are easy to miscommunicate; the UI must make the currency explicit on every entry.
- Free-tier group limit backlash: if the limit is too low, users feel nickel-and-dimed; if too high, the Pro upgrade story weakens. Pick a number and revisit based on real conversion data.
- Ad-free promise: any future ad SDK would break the explicit promise; the MVP must keep ad SDKs out of the bundle and review dependencies for ad components.
