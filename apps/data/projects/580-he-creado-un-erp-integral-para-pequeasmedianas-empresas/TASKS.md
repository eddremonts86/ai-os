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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise git repo
- [ ] Copy `edd-app-template` → `apps/580-he-creado-un-erp-integral-para-pequeasmedianas-empresas/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Map the cross-module data model: sales, collections, purchases, payments, inventory, warehouses, treasury, cash flow.
- [ ] Build the consistency rules so a single sale touches inventory, receivables, treasury, and the dashboard in one transaction.
- [ ] Ship the document export so the ERP can produce invoices, receipts, and reports directly.
- [ ] Wire the AI dashboard component (the source names "dashboard e IA" as a module).
- [ ] Set up a demo dataset that exercises every module end-to-end so the demo the author already offers is reproducible.

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
