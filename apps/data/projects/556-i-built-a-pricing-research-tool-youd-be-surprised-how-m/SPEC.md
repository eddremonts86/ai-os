---
id: "556"
slug: i-built-a-pricing-research-tool-youd-be-surprised-how-m
title: "I built a pricing research tool, you'd be surprised how many people initially set their pricing just based on a competitor"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6270/i_built_a_pricing_research_tool_youd_be_surprised/"
category: saas
date: "2026-08-14"
tags: [saas, pricing, research, b2b]
tech: [Next.js, TypeScript, Supabase, Resend, Stripe]
---
# I built a pricing research tool, you'd be surprised how many founders don't actually research their first price

## Problem

A founder noticed that founders they spoke to did barely any pricing research: opened three competitor pages, saw the $29/49/99 pattern, picked a number, and moved on. The founder built a pricing research tool around Van Westendorp's Price Sensitivity Meter, paired with a revenue-impact model that runs the candidate price against retention, surfaces the break-even retention needed, and tests the price against a panel of the founder's existing users. The tool logs the decision. The implicit product: a focused pricing-research service that combines the Van Westendorp survey with a revenue-impact model, runs against the founder's own user list, and exports a signed pricing decision for the audit trail.

## Objective

Define the MVP scope for Kinetic Pricing as a focused pricing-research service that runs the Van Westendorp survey against the founder's user list, pairs it with a revenue-impact model, and exports a signed decision log. The MVP has to demonstrate the round-trip: upload the user list, run the survey, model the price change, log the decision.

## Target Users

- **Primary:** indie SaaS founders setting their first or second price.
- **Secondary:** small SaaS teams considering a price change (raise or restructure).
- **Tertiary:** pricing consultants who want a structured tool to run with their clients.

## MVP Scope

- Van Westendorp survey (4 questions per respondent) sent to the founder's user list.
- Revenue-impact model: candidate price × projected retention × existing conversion → projected MRR.
- Break-even retention: the retention rate the founder needs to clear the current MRR at the new price.
- Decision log: signed export of the survey results, the model inputs, and the chosen price.
- Free tier: 50 respondents, 1 candidate price. Pro at $99/month: 500 respondents, 5 candidate prices, decision-log export.
- Excluded in v1: conjoint analysis, Gabor-Granger, willingness-to-pay scoring, multi-product.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single pricing-research surface — the survey setup on the left, the model output in the centre, the decision log on the right. No marketing-site chrome; the product is the decision log.

## Constraints

- The survey must be sent from the founder's own email (or a Sender domain they own); the tool is not a survey vendor, it is a pricing-research tool.
- The decision log must be tamper-evident (signed with a per-engagement key) so the audit trail holds up.
- Per-engagement data isolation: one founder's user list must never leak to another.
