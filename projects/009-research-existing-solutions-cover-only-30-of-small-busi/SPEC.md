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

## Problem

Independent research in the ProblemHunt brief found that existing legal-tech products for small businesses address roughly 30% of the legal risks a 10–50-person business actually worries about (employment classification, vendor contracts, data processing, intellectual-property basics, lease renewals). The other 70% either require a $400/hour lawyer or get ignored until they become a crisis.

## Objective

Ship a scenario-driven legal-risk checker that walks a small business through ten high-frequency scenarios (the 70%), produces a risk score, a checklist of documents to have on file, and a one-click hand-off to a vetted lawyer if the business wants one.

## Target Users

- Primary: owners of 10–50-person businesses with no in-house counsel and a one-time-a-year relationship with a lawyer.
- Secondary: fractional CFOs and bookkeepers who want a tool to hand clients that is more useful than a generic terms-of-service generator.

## MVP Scope

- Ten pre-built scenarios (employment classification, vendor MSAs, customer terms, data processing agreements, IP assignment, lease renewals, equity grants, tax elections, dispute clauses, regulatory filings).
- Per-scenario questionnaire with 5–10 yes/no questions; produces a risk score and a "what good looks like" checklist.
- Document draft generator for the four most common gaps (employee IP assignment, vendor MSA, customer DPA, equity grant).
- One-click hand-off to a vetted lawyer per scenario, with a pre-filled brief.
- No legal advice. Every output has an explicit "this is not legal advice" disclaimer and a link to a real lawyer.
- No retainer, no subscription legal services, no jurisdiction-specific advice in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- All scenario content must be reviewed by at least one licensed lawyer per supported jurisdiction before launch.
- The platform never stores client-confidential information beyond the questionnaire answers; documents are generated client-side and stored in the user's own DocuSign envelope.
- "Risk score" must be explained in plain language, never presented as a probability that implies more certainty than the underlying methodology supports.
- Pricing must be transparent; no hidden fees for the lawyer hand-off (the lawyer pays a referral fee, the user does not pay extra).