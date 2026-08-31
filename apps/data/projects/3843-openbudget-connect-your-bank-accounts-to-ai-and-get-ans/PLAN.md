---
id: "3843"
slug: openbudget-connect-your-bank-accounts-to-ai-and-get-ans
title: OpenBudget – Connect your bank accounts to AI and get answers about your money
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/openbudget?utm_campaign=startup-174483&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-29"
tags: [BetaList, Beta, Product]
tech: [Plaid account connectivity, MCP server for AI clients, Transaction categorization, Rules engine for notes and split charges, Google Sheets and Excel sync, Credential-free tokenized access]
---
# OpenBudget – Connect your bank accounts to AI and get answers about your money

## Tech Stack

- **Plaid account connectivity:** bank and card linking with tokenized access.
- **MCP server for AI clients:** exposes finance data to ChatGPT, Claude and other MCP clients.
- **Transaction categorization:** automatic categories, editable through the assistant.
- **Rules engine for notes and split charges:** user-saved rules applied to transactions.
- **Google Sheets and Excel sync:** scheduled export of financial data to spreadsheets.
- **Credential-free tokenized access:** Plaid tokens with revocation handling; no credentials stored.

## Architecture

- **Connection layer:** the Plaid link flow produces tokens; the platform stores only tokens and metadata.
- **Data sync:** transaction and balance ingestion into the platform store.
- **MCP server:** typed resources and tools for transactions, balances, debts, subscriptions and budgets.
- **Rules engine:** notes, splits and categorization rules applied on ingestion and edit.
- **Export workers:** push updated data to Google Sheets and Excel targets.

## Milestones

1. **M0 — Read-only Q&A.** Plaid connection plus an MCP server answering balance and transaction questions.
2. **M1 — Write paths.** Categorization, notes, split charges and saved rules through the assistant.
3. **M2 — Subscriptions and budgets.** Derived views for subscriptions and budgets from transaction data.
4. **M3 — Spreadsheet sync.** Google Sheets and Excel export with refresh scheduling.

## Risks

- **Data freshness:** stale balances erode trust faster than any other defect.
- **MCP ecosystem churn:** clients evolve; the server must track their capabilities.
- **Plaid is a dependency** with its own coverage, cost and outage profile.
- **The security bar is the product's credibility:** token storage and revocation handling must be airtight.
