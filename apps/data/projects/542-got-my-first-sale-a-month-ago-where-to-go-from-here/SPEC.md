---
tags: ["saas", "b2b", "food", "inventory"]
tech: ["Next.js", "TypeScript", "Supabase", "Stripe"]
id: "542"
slug: got-my-first-sale-a-month-ago-where-to-go-from-here
title: "Got my first sale a month ago, where to go from here..?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9tvt/got_my_first_sale_a_month_ago_where_to_go_from/"
category: saas
date: "2026-08-14"
---
# Got my first sale a month ago, where to go from here

## Problem

Sean owns a cafe and recently launched CafeTally, a tool that helps cafes manage inventory, recipes, supplier costs, and margins without relying on spreadsheets. He got his first sale but it made him realise one sale does not mean a second one is coming. He is considering spending a little on marketing and testing landing-page variants (each page leads with a different pain: reducing stockouts, easier inventory counts, understanding recipe costs and margins). He is also struggling with weekly product meetings to ensure the product works the way he wants, knowing it does not scale. The implicit product: a B2B SaaS for cafe operators focused on inventory + recipe costing + margin visibility, with an experimentation workflow for solo founders after the first sale.

## Objective

Define the MVP scope for CafeTally as a focused cafe-operations tool, plus the experimentation workflow that takes a solo founder from "first sale" to "repeatable second, third, tenth sale" without burning the budget on ads that don't convert.

## Target Users

- **Primary:** independent cafe owners and small cafe chains (1-3 locations) currently managing inventory and recipe costs in spreadsheets or pen-and-paper.
- **Secondary:** cafe managers responsible for daily stock counts and supplier orders who need a tool their owner will adopt.
- **Tertiary:** ghost-kitchen operators and small bakeries with similar inventory pains.

## MVP Scope

- Inventory: stock counts, par levels, reorder alerts, supplier list.
- Recipes: ingredient-level recipes with cost-per-portion and margin %.
- Reporting: weekly stock movement, cost-of-goods-sold, margin trend.
- Single-tenant; one cafe per workspace in v1.
- Excluded in v1: multi-location, POS integration, supplier ordering, payroll, loyalty.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single cafe-operations surface — today's stock counts on the left, recipes on the right, the margin trend at the bottom. No marketing-site chrome; the product is the count.

## Constraints

- The MVP must work for a cafe owner who is not at a desk during the day: a phone-first UI for stock counts is mandatory.
- Per-cafe data isolation: one cafe per workspace, no cross-cafe reporting in v1.
- The founder must replace the weekly product meetings with a structured feedback loop (weekly NPS + 5-user interview cadence) before scaling.
