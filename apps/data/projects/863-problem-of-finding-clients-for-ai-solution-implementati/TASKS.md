---
id: "863"
slug: problem-of-finding-clients-for-ai-solution-implementati
title: Problem of finding clients for AI solution implementation in Europe and Eastern Europe
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/ab9rnnoja1-problem-of-finding-clients-for-ai-soluti"
category: ai
date: "2025-10-29"
tags: [AI, Marketing, Business, Other]
country: UK
tech: [Go, chi, PostgreSQL, pgvector, Redis, Stripe, Tauri]
---
# Problem of finding clients for AI solution implementation in Europe and Eastern Europe

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/863-problem-of-finding-clients-for-ai-solution-implementati/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Go chi API and the PostgreSQL schema for builder profiles, buyer accounts, signals and outreach logs
- [ ] Build the builder profile form and the rule-based buyer ranking for the UK as the first market
- [ ] Add the scheduled scraper pipeline for job boards, press and public RFP feeds with per-account timestamped signal storage
- [ ] Layer the pgvector outcome-to-buyer similarity score on top of the rule-based score with a per-builder weight slider
- [ ] Extend the buyer lists to at least three Western European and three Eastern European markets with per-market language and procurement-norm hints
- [ ] Build the builder-facing outreach log and the calibration job that recomputes the fit score against observed conversions
- [ ] Implement the CSV export with the buyer account, contact-path hint, language preference and signal references as columns
- [ ] Ship the Tauri desktop client that runs against the same API with a private signal cache
- [ ] Wire Stripe billing for the paid tier with the account-cap boundary and multi-user access for studios
- [ ] Write the unit tests for the rule-based filter and the integration tests for the calibration job

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
