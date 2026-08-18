---
id: "542"
slug: got-my-first-sale-a-month-ago-where-to-go-from-here
title: "Got my first sale a month ago, where to go from here..?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9tvt/got_my_first_sale_a_month_ago_where_to_go_from/"
category: saas
date: "2026-08-14"
tags: [saas, b2b, food, inventory]
tech: [Next.js, TypeScript, Supabase, Stripe]
---
# Got my first sale a month ago, where to go from here

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS, mobile-first.
- **Backend:** Supabase (auth, inventory, recipes, supplier list).
- **Reporting:** a daily cron that aggregates stock movement and recipe margins into a weekly report.
- **Payments:** Stripe.

## Architecture

Single web app, mobile-first UI, Supabase backend. Stock counts are taken on the phone during the day; recipes and supplier lists are managed from a desktop.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-cafe stock-count demo. End of week 1.
2. **M1 — Inventory + supplier list.** Stock counts, par levels, reorder alerts. End of week 3.
3. **M2 — Recipes + cost-per-portion + margin.** End of week 5.
4. **M3 — Weekly margin report + email digest.** End of week 7.
5. **M4 — Free / Pro pricing + Stripe.** End of week 9.

## Risks

- **Mobile data entry quality** — a cafe owner counting stock on a phone at 7am will make mistakes; the UI must minimise them (barcode scan, last-value prefills).
- **Founder bottleneck** — the weekly product meetings will not scale; the founder must adopt a structured 5-user interview cadence before the second customer.
