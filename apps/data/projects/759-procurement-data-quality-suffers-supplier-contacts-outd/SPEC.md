---
id: "759"
slug: procurement-data-quality-suffers-supplier-contacts-outd
title: "Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing solutions too expensive or don't fix data quality. Need a simple tool for $10/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/1xuloij3k1-procurement-data-quality-suffers-supplie"
  captured: "2026-03-10"
category: business
date: "2026-03-10"
tags: [Business, Finance, Other]
country: Brazil
wtp:
  raw: $10/month
  currency: USD
  min: 10
  max: 10
  period: month
  mrrMid: 10
tech: [React + Vite, Node.js (Fastify) API, Postgres, scheduled enrichment workers (Node.js cron), CSV / Google Sheets import-export]
---
# Procurement data quality suffers — supplier contacts outdated, prices stale, history lost. Existing solutions too expensive or don't fix data quality. Need a simple tool for $10/month.

## Problem

The poster works in procurement and the supplier database lives in Excel / Google Sheets. Contacts go out of date, prices do not get updated, and there is no record of past negotiations — every purchase requires hours of manual verification before placing an order, and the team sometimes ends up overpaying or choosing the wrong supplier because the data they were looking at was stale. They have tried the obvious commercial procurement suites; some are too expensive and complex for their scale, and the ones that are affordable do not actually solve data quality — they digitise the workflow but still leave the supplier database rotting. The poster explicitly wants a $10/month tool that keeps supplier data up to date, automatically refreshes contacts and prices, stores negotiation and purchase history, and is simple enough to use without a complex implementation.

## Objective

Ship a small-team procurement data tool at $10/month per workspace that fixes supplier data quality rather than digitising the workflow. The MVP must (1) hold the supplier database, (2) automatically refresh contacts and prices on a schedule, (3) capture every negotiation and purchase as a structured history entry, and (4) be importable from the Excel / Google Sheets file the poster is already using, so adoption does not require a migration weekend.

## Target Users

- **Primary:** small procurement teams (1–5 people) at SMBs that today run on Excel / Google Sheets and have a supplier database that visibly rots between purchases.
- **Secondary:** founders and operations leads at SMBs who own purchasing decisions informally and want a lightweight record of "who we bought from, what we paid, what we negotiated" without standing up an enterprise procurement suite.
- **Tertiary:** freelance or contract procurement consultants serving SMB clients, who want a single tool they can deploy per client workspace.

## MVP Scope

- A web app with one workspace per account; the workspace holds a supplier table (name, category, contact, phone, email, website, last verified date).
- A scheduled enrichment worker that, on a weekly cron, refreshes the supplier's public-facing data (website scrape for phone / email / address, domain expiry check, public business-registry lookup where available) and writes back only the changed fields with a confidence score.
- A negotiation log: per supplier, a chronological list of past interactions (quote requested, quote received, counter-offer, accepted) with the final price and the date, so the team can answer "what did we pay them last time?" without digging through email.
- A purchase log: per supplier, a chronological list of completed purchases with quantity, unit price, total, and a free-text note.
- A dashboard widget that surfaces the worst-quality rows: "haven't been verified in N days", "no contact on file", "price not updated since last purchase".
- CSV / Google Sheets import on day one, and export at any time, so the workspace is not a trap.
- Per-row manual edit and verification (mark "verified by me on YYYY-MM-DD") so the team can override what the enrichment worker guessed.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated budget cap is $10/month per workspace. The product must be self-funding at this price with a small-team seat count (3–5 seats typical).
- No enterprise procurement workflow features in v1: no RFQ-to-PO pipeline, no approval chains, no three-way match, no ERP connectors. Those are the features the existing solutions already have and that the poster explicitly says they do not want.
- The enrichment worker must be conservative: a wrong phone number is worse than no phone number. Every auto-refresh writes only if the new value passes a confidence threshold and surfaces the change in the dashboard for human review before overwriting the displayed value.
- Data ownership: the workspace's data must be exportable as CSV at any time, with no proprietary lock-in.
- Import must accept the existing Excel / Google Sheets layout; the importer must surface field-mapping choices ("which column is the supplier name?") rather than guess.
- Privacy: enrichment must only touch public sources; no scraping of private databases, no paid data brokers, no selling of supplier data to a third party.
