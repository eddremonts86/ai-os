---
id: "612"
slug: i-validated-the-problem-and-still-built-the-wrong-saas
title: I validated the problem... and still built the wrong SaaS
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp1lpo/i_validated_the_problem_and_still_built_the_wrong/"
category: saas
date: "2026-08-15"
tags: [saas, validation, indie, methodology]
tech: [Next.js, TypeScript, Supabase, libsodium, Stripe]
---
# I validated the problem and still built the wrong SaaS

## Problem

A founder in the SEO space threw away 3 months of work on a SaaS. They HAD validated the idea before building (or thought they had): they talked with people about how they handled SEO, and the same problem kept coming up — there are not enough reliable data sources to back up SEO claims. So they built a tool that aggregated SEO data sources. Three months in, they realised they had built a "more reliable aggregator" rather than a tool that actually changed the SEO workflow. The validation was real but the wedge was wrong. The implicit product: a validation-to-wedge gap analysis tool for indie SaaS founders — a checklist that forces the founder to name what the user will do differently with the tool, not just the data they will see.

## Objective

Define the MVP scope for a validation-to-wedge gap analysis tool: a structured checklist that takes a "validated problem" and forces the founder to name the specific workflow change, the specific user action, and the specific outcome. The MVP has to demonstrate the round-trip: paste the problem statement → fill the gap checklist → get a verdict (build / pivot / kill).

## Target Users

- **Primary:** indie SaaS founders who have validated a problem but are unsure whether to build.
- **Secondary:** small SaaS teams considering a new product line.
- **Tertiary:** startup mentors and advisors who want a structured tool to use with their mentees.

## MVP Scope

- A structured checklist: 5 questions that force the founder to name the workflow change, the user action, the outcome, the wedge, and the validation depth.
- A verdict engine: build / pivot / kill based on the founder's answers.
- A saved log of past verdicts, signed and exportable.
- Free tier: 1 saved verdict. Pro at $19/month: unlimited verdicts, structured weekly review.
- Excluded in v1: collaborative validation, mentor / mentee matching, market-size data.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single checklist surface — the 5 questions stacked, the verdict engine output below, the saved log on the right. No marketing-site chrome; the product is the checklist.

## Constraints

- The 5 questions must be specific enough to surface the validation-to-wedge gap; vague questions produce vague verdicts.
- The verdict engine must be transparent; the founder must see which question drove the verdict.
- The signed verdict log must be tamper-evident (a per-engagement signature) so the audit trail holds up.
