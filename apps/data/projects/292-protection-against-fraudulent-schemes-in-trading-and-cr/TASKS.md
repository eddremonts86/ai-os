---
id: "292"
slug: protection-against-fraudulent-schemes-in-trading-and-cr
title: Protection against fraudulent schemes in trading and cryptocurrency investments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/3ix68wvr71-protection-against-fraudulent-schemes-in-tra"
category: finance
date: "2025-10-29"
tags: [Finance, Security, AI]
country: Madagascar
tech: [Next.js 14, TypeScript, Postgres, Chainalysis / TRM Labs (txn risk), WhatsApp Business API, Orange Money / MVola payment APIs]
---
# Protection against fraudulent schemes in trading and cryptocurrency investments

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/protection-against-fraudulent-schemes-in-trading-and-cr/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] WhatsApp bot with verified-template onboarding in French.
- [ ] Scheme-pattern DB seed: 50 patterns curated from local reports (guaranteed returns, unlicensed broker, copy-trade pressure, MLM disguised as trading).
- [ ] Verdict engine: pattern match + crypto-address risk lookup (Chainalysis/TRM) + confidence score.
- [ ] Verdict card rendering: green/amber/red + 2-line explanation + 'what to do next'.
- [ ] Malagasy language verdict templates for the top 10 scheme patterns.
- [ ] Mobile-money receipt OCR for fraud-report intake (Orange Money + MVola).
- [ ] Fraud-report queue with operator console; legal-aid partner hand-off workflow.
- [ ] Central-bank / BCMM dashboard: anonymised pattern trends, monthly report export.
- [ ] Per-phone-number rate limit; verified-user gating.
- [ ] Right-to-erasure flow per Madagascar data protection law.
- [ ] Launch in Antananarivo via partner legal-aid clinic; expand to Toamasina + Antsirabe.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 292-protection-against-fraudulent-schem MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Madagascar completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
