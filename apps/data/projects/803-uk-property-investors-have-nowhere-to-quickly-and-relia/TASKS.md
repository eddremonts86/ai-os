---
id: "803"
slug: uk-property-investors-have-nowhere-to-quickly-and-relia
title: "UK property investors have nowhere to quickly and reliably assess refurbishment costs and find verified contractors, leading to weeks of delays and financial risks."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/pu341olhc1-uk-property-investors-have-nowhere-to-qu"
  captured: "2026-01-03"
category: business
date: "2026-01-03"
tags: [Business, Other]
country: UK
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# UK property investors have nowhere to quickly and reliably assess refurbishment costs and find verified contractors, leading to weeks of delays and financial risks.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Coolify app + Drizzle migrations + reference-data repo
- [ ] Author v1 reference data: 8 trade categories × 12 UK regions
- [ ] Trade-credential batch job (NICEIC + Gas Safe + FMB lookups)
- [ ] Condition-grade reference gallery (photos of grade 1–5 properties)

## Phase 1: Core

- [ ] Property-spec input form: type, sq ft, condition grade (1–5), scope of works, postcode
- [ ] Estimator: low/mid/high range output with line-by-line calculation breakdown
- [ ] Source citation on every line (BCIS average + regional factor + trade band)
- [ ] Contractor profile ingest: trade, region, credentials, prior-job count
- [ ] Contractor shortlist: trade + region filter, credential badges, prior-job ratings
- [ ] RFQ template: estimator output pre-fills scope, investor sends to one or all shortlisted contractors
- [ ] Saved properties + saved shortlists per investor account
- [ ] End-to-end test: 3 property specs → 3 cost ranges → 3 shortlists → 3 RFQs sent

## Phase 2: Deploy

- [ ] Coolify production deploy with daily SQLite backup
- [ ] Trade-credential refresh cron: weekly NICEIC / Gas Safe / FMB lookups, 30-day cache
- [ ] Free-3-runs + £29 + £99 Stripe plans wired
- [ ] Quarterly reference-data review cadence (calendar reminder + GitHub issue template)
- [ ] Post-mortem at week 14: did estimator outputs land within ±15% of actual refurb costs on a sample of 5 closed deals?
