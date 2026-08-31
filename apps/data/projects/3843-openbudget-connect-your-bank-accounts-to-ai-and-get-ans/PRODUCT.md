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

## Value Proposition

Ask your AI about your money. OpenBudget connects US bank and card accounts to ChatGPT, Claude and other MCP clients, so questions about transactions, balances, debts, subscriptions and budgets get answered where you already work — with categorization, notes, split charges and saved rules you can manage through the assistant, plus sync to Google Sheets and Excel. Plaid handles the connection; OpenBudget never stores your bank credentials.

**One-liner:** Connect your bank accounts to AI and get answers about your money, without handing over credentials.

## Target Users

| Stakeholder | Why they care |
|---|---|
| ChatGPT and Claude users | Money questions answered in the assistant they already use. |
| MCP ecosystem builders | A financial data source for their own agent workflows. |
| Spreadsheet budgeters | Transaction sync into Google Sheets or Excel. |
| Privacy-conscious account holders | Plaid connections and no stored credentials. |

## Jobs To Be Done

1. **Functional job** — Connect US bank and card accounts via Plaid without sharing credentials with the platform.
2. **Functional job** — Ask questions about transactions, balances, debts, subscriptions and budgets from ChatGPT, Claude or another MCP client.
3. **Functional job** — Organize money data through the assistant: categorize, add notes, split charges, save rules.
4. **Functional job** — Sync the data to Google Sheets or Excel for spreadsheet workflows.

## Success Metrics

- **Connected accounts per user:** depth of the Plaid connection.
- **Assistant query volume:** questions asked per connected user per month — the core engagement.
- **Rule reuse:** share of transactions handled by saved rules and splits rather than manual edits.
- **Sync usage:** share of users with an active Google Sheets or Excel sync.

## Pricing & Monetization

None stated. The capture describes functionality and the Plaid relationship only; no price appears.

## Competitive Landscape

The post does not name competitors. The category is personal finance aggregators and AI assistants over financial data; OpenBudget's stated angle is MCP-native distribution — living inside ChatGPT, Claude and other MCP clients — with Plaid as the trusted connection layer.

## Risks & Open Questions

- [ ] MCP client behavior varies; the experience is only as good as the host assistant's support.
- [ ] Financial Q&A errors (wrong balance, missed transaction) are high-trust failures.
- [ ] Plaid coverage and data freshness bound everything the product can answer.
- [ ] "Never stores credentials" must survive token revocation, reconnects and security review.
- [ ] No pricing in the capture; the Plaid cost per connected account is a real expense with no stated revenue model.
