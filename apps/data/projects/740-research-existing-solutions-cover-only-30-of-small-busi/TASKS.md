---
id: "740"
slug: research-existing-solutions-cover-only-30-of-small-busi
title: "Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/validated/hmj0kxg8c1-research-existing-solutions-cover-only-3"
  captured: "2026-05-15"
category: validated
date: "2026-05-15"
tags: [Validated, Legal, Business, Other]
wtp:
  raw: $99 one-time for the research document
  currency: USD
  min: 99
  max: 99
  period: one-shot
tech: [Next.js, Postgres, Playwright site crawler, LLM risk-classification pipeline, Resend, Stripe]
---
# Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product.

## Phase 0: Scaffold

- [x] Capture the ProblemHunt research summary and its stated claims
- [ ] Acquire the $99 research document, or complete the free-access path, before scoping further
- [ ] Next.js app shell with per-finding report routes
- [ ] Postgres schema: sites, scans, evidence, findings, jurisdiction rules, remediation state
- [ ] Write DESIGN.md (report page, finding card, severity and jurisdiction treatment)
- [ ] Set up the development environment with a Playwright runner

## Phase 1: Core

- [ ] Playwright crawler: render pages, capture network requests, cookies before and after consent, forms and checkout steps
- [ ] Evidence store that every finding must reference, so a finding can be traced to what was observed
- [ ] Jurisdiction model: no rule may exist without a jurisdiction scope
- [ ] Deterministic rule set for the risk categories the respondents named, scoped to one jurisdiction first
- [ ] Plain-language explanation per finding: what the risk is, what triggers it, what a fine would attach to
- [ ] Remediation guidance split into self-fixable and needs-a-lawyer
- [ ] Finding ranking, and a cap or grouping strategy so a report does not hand back an unbounded list
- [ ] Model pass for risk categories that resist rules, with inferred findings labelled as inferred
- [ ] False-positive measurement on the model layer before its findings are shown to any owner
- [ ] Remediation state persisted across scans, so a returning finding is reported as returning
- [ ] Scheduled re-scan with email alerts on new or returned findings
- [ ] Informational framing and disclaimer on every finding, reviewed before the first external scan
- [ ] Coverage measurement: map produced findings against the respondents' named concerns
- [ ] Present the working MVP to the interviewed owners and record which findings they call relevant

## Phase 2: Deploy

- [ ] Set pricing from the research document's stated monetization model, not from a guess
- [ ] Add a second jurisdiction's rule scope
- [ ] Deploy to Coolify
- [ ] Verify in production
