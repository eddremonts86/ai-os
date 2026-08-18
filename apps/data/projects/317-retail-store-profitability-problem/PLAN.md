---
id: "317"
slug: retail-store-profitability-problem
title: Retail store profitability problem
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/retail/a8z3g4sod1-retail-store-profitability-problem"
category: retail
date: "2025-10-29"
tags: [Retail, Finance, Business]
country: Philippines
tech: [Next.js 14, TypeScript, Postgres, Stripe + PayMongo (PH cards + GCash), Xero / QuickBooks integration, Twilio SMS]
---
# Retail store profitability problem

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the shop console.
- Postgres on Hetzner for sales, purchases, SKUs, profitability records.
- Stripe + PayMongo (PH cards + GCash) for PHP billing.
- Twilio for SMS delivery in Tagalog.
- OpenAI Vision API + Whisper for receipt OCR.
- Xero / QuickBooks API for accounting export.
- Cloudflare for ingress.

## Architecture

Two Next.js surfaces on one backend: shop console at /shop (mobile-web first) and chain rollup at /chain. Sales entry via photo OCR (OpenAI Vision) → suggested entries the operator approves. Purchase entry with supplier and unit cost. Per-SKU profitability recomputed nightly: revenue minus cost minus waste minus shelf-time depreciation. Weekly report is rendered to a Tagalog SMS template + English fallback, plus an in-app dashboard.

## Milestones

1. **M0** — Spec freeze, single-shop MVP, manual sales entry, weekly SMS digest. End of week 1.
2. **M1** — Receipt photo OCR + LLM extraction with operator approval. End of week 4.
3. **M2** — Per-SKU profitability + top-3-action generator. End of week 7.
4. **M3** — Chain tier (2–5 shops) + supplier comparison. End of week 10.
5. **M4** — Xero / QuickBooks export + PayMongo GCash billing. End of week 14.

## Risks

- **Data entry burden** — Mitigation: photo OCR + LLM extraction; suggested entries.
- **Tagalog SMS nuance** — Mitigation: A/B copy with 5 sari-sari owners; culturally-tuned advisor.
- **Waste / shrink tracking burden** — Mitigation: optional simple waste entry; default low-burden flow.
