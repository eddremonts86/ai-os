---
id: "009"
slug: research-existing-solutions-cover-only-30-of-small-busi
title: "Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/validated/hmj0kxg8c1-research-existing-solutions-cover-only-3"
  captured: "2026-07-17"
category: validated
date: "2026-07-17"
tags: [Validated, Legal, Business, Other]
country: Unknown
tech: [Next.js, Postgres, Anthropic Claude, Stripe, DocuSign API]
---
# Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (Q&A-first, plain-language-first)
- [ ] Provision Next.js + Postgres + Stripe + DocuSign sandbox
- [ ] Counsel review of all 10 scenarios (US jurisdiction v1)
- [ ] Vetting rubric for the lawyer directory

## Phase 1: Core

- [ ] Guided Q&A per scenario: 5–10 yes/no questions, deterministic scoring
- [ ] Plain-language explanation per answer (Claude-summarised)
- [ ] Per-business scorecard with the 10 scenarios and risk levels
- [ ] Document draft generator (browser-side template engine) for: IP assignment, MSA, DPA, equity grant
- [ ] DocuSign envelope creation from the generated draft
- [ ] Lawyer directory: per-jurisdiction vetted list, manual curation
- [ ] Lawyer hand-off flow: pre-filled brief, paid engagement, 15% referral fee
- [ ] Per-scenario "this is not legal advice" banner (unmissable)
- [ ] End-to-end test: 10 scenarios, 4 drafts, 1 lawyer hand-off

## Phase 2: Deploy

- [ ] Public launch in 3 US states (CA, NY, TX)
- [ ] Recruit 50 vetted lawyers across the 3 states
- [ ] Stripe billing live with annual prepay
- [ ] Public marketing campaign targeted at SMB owners and fractional CFOs
- [ ] Liability review with counsel before public launch
- [ ] Post-mortem at week 30 with the 100-business cohort
