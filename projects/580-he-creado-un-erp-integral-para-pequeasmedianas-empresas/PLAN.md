---
id: "580"
slug: he-creado-un-erp-integral-para-pequeasmedianas-empresas
title: "ERP integral for SMBs — sales, purchasing, inventory, accounting in one platform"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vold0w/he_creado_un_erp_integral_para_peque%C3%B1asmedianas/"
  captured: "2026-08-14"
category: erp
date: "2026-08-14"
tags: [erp, smb, accounting, inventory, spanish, latin-america]
scores:
  money: 5
  learn: 5
  fun: 4
---
# ERP integral for SMBs — sales, purchasing, inventory, accounting in one platform

## Tech Stack

The source does not specify a stack. Pragmatic SMB ERP choices in the Spanish-speaking market tend to be a monolith web app (a single Next.js or Rails app, or a Laravel-style PHP backend) on a managed Postgres database, with a thin mobile or tablet client for warehouse-floor use. The "dashboard and AI" component implies a small LLM call path for queries like "what did we sell last month in this region", but the source does not pin a model.

## Architecture

A single multi-tenant backend with per-tenant isolated data, organised as a series of domain modules the source names: sales, collections, purchases, payments, inventory, warehouses, treasury, cash flow, dashboard, AI, document export. Cross-module consistency is the value prop, so the modules are not isolated services — they share a normalised data model and a single source of truth for transactions, with one module's write triggering the others' updates.

## Milestones

M1: stand up a sandbox and load ten demo transactions that exercise each of the named modules end-to-end (a sale → inventory decrement → a receivable → a cash receipt → a dashboard refresh). M2: harden the cross-module consistency rules so they are testable. M3: ship the document export (the source explicitly names "exportacion de documentos"). M4: ship the demo flow the author is already offering to prospects.

## Risks

Risk: the source does not name a country, so localisation (tax regimes, invoice formats, currency, language) is an open question. Risk: the "sell the ERP outright" model caps the addressable revenue per customer and removes the recurring tail that holds SMB-software valuations together. Risk: a multi-tenant ERP at the SMB scale is a long-support product, and the author is solo. Source lacked: any specific price, country, or active-customer signal.
