---
id: "310"
slug: export-procedure-solution-for-pakistan-to-europe-trade
title: Export procedure solution for Pakistan to Europe trade
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/3yrnl32wb1-export-procedure-solution-for-pakistan-to"
category: business
date: "2025-11-12"
tags: [Business, Trade, Other]
country: Pakistan
tech: [Next.js, TypeScript, Postgres, Resend, Anthropic Claude API, Hetzner]
---
# Export procedure solution for Pakistan to Europe trade

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (case card, checklist timeline, document upload)
- [ ] Provision Hetzner VPS + Postgres + Object Storage + Coolify reverse proxy
- [ ] Build reference bundle v1: HS codes, GSP+ list, EU VAT rates, TDAP forms
- [ ] Decide on auth: email magic link or phone OTP

## Phase 1: Core

- [ ] Exporter signup: company name, NTN / STRN, bank account (for downstream payment readiness check, not in MVP)
- [ ] New case wizard: product description, HS code (or "suggest"), destination EU country, incoterm
- [ ] Procedure generator: Claude call with reference bundle → numbered JSON checklist
- [ ] Checklist UI: ordered steps with required documents, agencies, expected days, "last verified" date
- [ ] Document templates: PDFKit-generated fillable PDFs for commercial invoice, packing list, certificate of origin, GSP+ declaration, ATR
- [ ] Document upload per step; case status updates
- [ ] Forwarder share link: read-only view of the case + uploaded docs
- [ ] Disclaimer banner on case creation and on every shared link
- [ ] End-to-end test: 5 products × 5 EU countries, verify checklist completeness

## Phase 2: Deploy

- [ ] Quarterly rebuild cron for the reference bundle, with a visible changelog
- [ ] Recruit 30 pilot exporters in Karachi, Lahore, Sialkot
- [ ] Coolify-side deployment of the console
- [ ] Status page + Claude API quota monitoring
- [ ] Post-mortem after week 10 with the pilot cohort
