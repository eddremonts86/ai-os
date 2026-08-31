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

## Problem

OpenBudget connects US bank and card accounts to ChatGPT, Claude and other MCP clients so users can ask questions about transactions, balances, debts, subscriptions and budgets in the assistant they already use. The BetaList capture describes categorization of transactions, adding notes, splitting charges and saving rules through the AI assistant, plus sync to Google Sheets or Excel. Two trust claims anchor it: Plaid handles account connections, and OpenBudget never stores bank credentials.

## Objective

Put personal finance Q&A inside the assistant people already use: an MCP layer over US bank and card data that answers questions about transactions, balances, debts, subscriptions and budgets, supports notes, splits and rules, and syncs to spreadsheets — without ever holding bank credentials.

## Target Users

- US bank and card holders who live in ChatGPT or Claude and want money questions answered there.
- MCP-ecosystem tinkerers building their own assistant workflows on top of financial data.
- Spreadsheet budgeters who want transactions synced to Google Sheets or Excel.

## MVP Scope

- Plaid-based connection of US bank and card accounts (credentials never stored).
- An MCP server exposing transactions, balances, debts, subscriptions and budgets to ChatGPT, Claude and other MCP clients.
- Transaction categorization, notes, split charges and saved rules, driven through the AI assistant.
- Sync of financial data to Google Sheets and Excel.

## Constraints

- US accounts only, per the capture.
- Plaid is the named connection layer; scope is bounded by what Plaid exposes.
- "Never stores bank credentials" is the trust claim; token lifecycle and revocation handling must be airtight.
- MCP is the product surface; quality depends on MCP clients' capabilities as much as the server.

## Design Direction

See `DESIGN.md` for this project's design tokens.
