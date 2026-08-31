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

## Value Proposition

Expense tracking that fills itself in. Instead of typing every purchase, Masareef reads the bank's own transaction alerts on the phone — the SMS or notification a bank sends anyway — parses amount, merchant and time locally, and builds the ledger from them. Because parsing runs on-device, no account linking, no bank credentials and no data leaving the phone are required, which is the privacy answer the title advertises. The name (Arabic for "expenses") and the author's handle suggest the product starts with Arabic-speaking users whose banks are chatty with SMS alerts.

**One-liner:** An Android expense tracker that turns on-device bank alerts into a ledger with no manual entry and no cloud.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Android users with SMS-alerting banks | Automatic capture of every transaction without linking an account. |
| Privacy-conscious trackers | On-device parsing means transactions never leave the phone. |
| Arabic-speaking users | A native-name product aimed at markets where SMS banking alerts are standard. |
| Manual-entry avoiders | The ledger forms from alerts; typing is only for corrections. |

The post states no commercial market; the audience is everyday Android users who want a passive ledger.

## Jobs To Be Done

1. **Functional job** — Ingest transaction alerts from SMS and notifications as they arrive.
2. **Functional job** — Parse amount, merchant and timestamp from varied bank message formats on the device.
3. **Functional job** — Keep a categorized local ledger with monthly totals the user can review and correct.
4. **Emotional job** — Know where the money went without the chore (or the privacy cost) of manual or cloud tracking.

## Success Metrics

- **Capture rate:** share of bank alerts that parse into a correct transaction without user correction.
- **Review burden:** median corrections per transaction — the lower, the closer the product is to its promise.
- **Retention:** users still receiving parsed alerts weekly after a month (a passive tracker only survives if it stays useful without effort).
- **Format coverage:** number of distinct bank message formats the parser handles correctly.

## Pricing & Monetization

None stated. The capture is a URL-only post with no pricing information.

## Competitive Landscape

The post does not name competitors. The category is mobile expense trackers, where the mainstream answer is manual entry or open-banking account linking; Masareef's stated position is the SMS-alert niche — passive capture via the messages the bank already sends, with on-device processing as the privacy boundary. Manual trackers require discipline, and account-linked trackers require trust; this product claims to need neither.

## Risks & Open Questions

- [ ] SMS access on modern Android is permission-sensitive; Play policy and OS changes can restrict the core intake channel.
- [ ] Bank alert formats differ widely; parser coverage across banks and countries is unproven in the capture.
- [ ] Wrongly parsed amounts are worse than none — trust collapses fast if the ledger silently misreads a transaction.
- [ ] Notification alerts (versus SMS) require additional permission handling and vary by bank app.
- [ ] A URL-only capture: nothing is known about the actual feature set, screenshots or maturity of the listed app.
