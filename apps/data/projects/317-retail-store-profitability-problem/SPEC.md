---
id: "317"
slug: retail-store-profitability-problem
title: Retail store profitability problem
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/a8z3g4sod1-retail-store-profitability-problem"
category: retail
date: "2025-10-29"
tags: [Retail, Finance, Business]
country: Philippines
tech: [Next.js 14, TypeScript, Postgres, Stripe + PayMongo (PH cards + GCash), Xero / QuickBooks integration, Twilio SMS]
---
# Retail store profitability problem

## Problem

Filipino sari-sari store, mini-mart, and small-retail owners — typically running a single shop or a chain of 2–5 — track profitability in their head or in a notebook. The title records the failure as a profitability failure: they cannot tell which products are actually profitable after cost, waste, and shelf-time, which lines are quietly losing money, or where to adjust price or inventory. Stock-outs and over-stocking happen weekly; cashflow is opaque.

## Objective

Ship a sari-sari-store and small-retail profitability product that takes daily sales + purchase data and produces a weekly 'where are you making money, where are you losing' report, with concrete actions (re-price, swap supplier, drop the SKU). Outcome: a Filipino small-retail owner improves weekly margin by a measurable delta within 90 days.

## Target Users

Filipino sari-sari store and small-retail owners (single shop or 2–5 chain) in Metro Manila, Cebu, Davao, and provincial cities. Adults 25–60, smartphone-first, comfortable with GCash and PayMaya, often working in Tagalog or Cebuano. Secondary: small-retail distributors and wholesale suppliers who want a per-store profitability dashboard for their accounts.

## MVP Scope

Daily sales entry via a phone-friendly form or receipt photo (OCR + LLM). Purchase / receiving entry with supplier and unit cost. Per-SKU profitability: revenue minus cost minus waste minus shelf-time depreciation. Weekly report delivered via SMS in Tagalog + English with the top 3 actions: re-price this, swap supplier for that, drop this. Optional PayMongo / GCash top-up reminders. Xero / QuickBooks export for accounting.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/retail/a8z3g4sod1-retail-store-profitability-problem` follows the constraints in `317-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Philippines.

For Philippines, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must run on a low-end Android (PHP 4,000–8,000 device tier). Tagalog + English UI in v1. No barcode scanner requirement — entry can be by SKU name or photo. Data must be exportable to Xero / QuickBooks for any shop with formal accounting. SMS in Tagalog must be tested with real users before launch.
