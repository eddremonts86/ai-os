---
id: "542"
slug: got-my-first-sale-a-month-ago-where-to-go-from-here
title: "Got my first sale a month ago, where to go from here..?"
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9tvt/got_my_first_sale_a_month_ago_where_to_go_from/"
category: saas
date: "2026-08-14"
---
# Got my first sale a month ago, where to go from here..?

## Tech Stack

- **Inventory + recipe ledger:** Postgres with tables for ingredients, suppliers, recipes (line items per ingredient with current cost), and per-period stock counts.
- **Margin calculator:** deterministic SQL views that join the latest supplier-cost snapshot with recipe lines, so margin is queryable, not a spreadsheet formula.
- **Landing-page variant framework:** Next.js + a feature-flagged hero section that swaps copy based on a query parameter; events fired to Plausible (or PostHog) for variant attribution.
- **Email + onboarding:** Resend for transactional + weekly product update; a 14-day onboarding sequence for new customers.
- **Payments:** Stripe subscriptions, monthly billing, with a 14-day trial.

## Architecture

CafeTally runs as a multi-tenant SaaS: each cafe gets an isolated Postgres row-level scope. The owner logs stock counts on a phone or tablet; the recipe-cost view recomputes margin from the latest supplier prices and flags stockouts against the recipe BOM. Landing-page variants are A/B/n with one headline per pain point (stockouts, inventory-count effort, recipe margins); the owner measures which message drives trial signups, then doubles down.

```
Cafe owner ─▶ mobile-friendly Next.js UI ─▶ Fastify API ─▶ Postgres
                                            │
                                            └─▶ margin view (recipe × supplier cost)
                                            │
Stripe subscriptions ───▶ billing portal ───▶ Resend onboarding drips
```

The OP is the founder of CafeTally and has shipped a first paying customer. The product is real; the bottleneck is repeatable acquisition, not feature gaps.

## Milestones

1. **M0 — Lock the landing-page variant set.** Three headlines, three sub-headlines, one CTA each. Ship behind a query-param feature flag. End of week 1.
2. **M1 — Run paid traffic to two variants.** $200 split budget, track trial signup rate per variant for two weeks. End of week 3.
3. **M2 — Replace the weekly product meeting with an async template.** A 5-question form the owner fills before every release; answers are posted to a customer Slack or email digest. End of week 5.
4. **M3 — Onboarding automation.** Trial → paid conversion drip based on first-week behaviour. End of week 8.
5. **M4 — 10 paying cafes across two metros.** End of week 14.

## Risks

- **Spreadsheet-replacement fatigue.** Cafes that already run on QuickBooks + a Google Sheet may resist switching. The product's only durable advantage is the recipe-margin view; if margin reporting is not visibly better than the sheet, churn will follow the first sale.
- **Self-cannibalisation of weekly meetings.** The OP's weekly meeting is a feedback loop disguised as overhead; replacing it with a form before any release is the right call, but only if the form actually feeds the product, not just the founder's confidence.
- **Variant-test statistical noise.** Two variants and $200 split budget will not reach significance on most B2B SaaS funnels. Plan for at least four weeks of data before picking a winner, and consider holding out one variant as a control.
