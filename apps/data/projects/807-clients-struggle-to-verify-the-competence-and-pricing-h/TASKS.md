---
id: "807"
slug: clients-struggle-to-verify-the-competence-and-pricing-h
title: Clients struggle to verify the competence and pricing honesty of freelancers when creating websites — there is no AI tool for real-time proposal analysis.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/8zqy6g4g71-clients-struggle-to-verify-the-compet"
  captured: "2026-01-03"
category: freelance
date: "2026-01-03"
tags: [Freelance, AI, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Clients struggle to verify the competence and pricing honesty of freelancers when creating websites — there is no AI tool for real-time proposal analysis.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Coolify app + Drizzle migrations + percentile-data repo
- [ ] Proposal parser (paste-in + PDF + DOCX)
- [ ] Deliverable-type percentile data v1 (8 deliverable types, public rate surveys)
- [ ] Polite fetcher for public-work-mismatch (robots.txt respect, rate limit, opt-out list)

## Phase 1: Core

- [ ] Paste-in proposal flow → parsed line items, hours, deliverables, price
- [ ] PDF + DOCX upload + parse
- [ ] Side-by-side comparison view (up to 5 proposals)
- [ ] Line-item matching on similarity (TF-IDF + manual override)
- [ ] Hours-vs-scope ratio per deliverable
- [ ] Deliverable specificity score (presence of acceptance criteria)
- [ ] Red-flag callouts: hours-per-deliverable 90th-percentile, brief-mismatch line items
- [ ] Per-niche band override (e-commerce / SaaS / media site)
- [ ] Public-work-mismatch check: fetch claimed URLs, compare against freelancer's portfolio
- [ ] PDF export of comparison for co-founder/board sharing
- [ ] End-to-end test: 4 proposals → parsed → compared → red-flagged → exported

## Phase 2: Deploy

- [ ] Coolify production deploy with daily SQLite backup
- [ ] Free-1 + $29 + $99 Stripe plans wired
- [ ] Per-domain rate limit + opt-out list for public-work-mismatch
- [ ] Quarterly percentile-data review (calendar reminder + GitHub issue template)
- [ ] Post-mortem at week 14: did red-flag callouts actually change which proposal the client picked?
