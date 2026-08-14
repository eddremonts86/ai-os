---
id: "227"
slug: a-3-year-search-for-a-simple-tool-to-track-both-persona
title: "A 3-year search for a simple tool to track both personal and business finances in one place. Nothing matches because the reports are split, the UX is heavy, or the price is wrong."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-01-29"
tags: [Fintech, Personal Finance, Small Business]
country: USA
tech: [Python, FastAPI, PostgreSQL, React, Plaid, Stripe]
---
# A 3-year search for a simple tool to track both personal and business finances in one place. Nothing matches because the reports are split, the UX is heavy, or the price is wrong.

## Tech Stack

Python + FastAPI for the orchestration. PostgreSQL for the ledger. React for the web UI. Plaid for the bank linking. Stripe for the subscription. S3 for the receipt storage.

## Architecture

Plaid pull → personal ledger + business ledger → unified reconciliation job → tax-relevant summary. Per-user categories. Single export-to-accountant format.

## Milestones

M0 — Plaid linking + two ledgers. M1 — unified reconciliation. M2 — Schedule C summary. M3 — 1000 users in pilot. M4 — public launch with a clear we are not a tax service stance.

## Risks

Plaid is a single point of failure. Schedule C logic must be defensible. Bank-linking UX can lose users if the flow is slow. Tax-relevant summary must be honest about its limitations.

## Data Model

## Integrations

Python + FastAPI for the orchestration. PostgreSQL for the ledger. React for the web UI. Plaid for the bank linking. Stripe for the subscription. S3 for the receipt storage.
