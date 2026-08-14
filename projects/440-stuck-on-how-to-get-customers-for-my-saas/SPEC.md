---
id: "440"
slug: stuck-on-how-to-get-customers-for-my-saas
title: Stuck on how to get customers for my SaaS
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0ki6/stuck_on_how_to_get_customers_for_my_saas/"
category: saas
date: "2026-08-14"
tech: [Next.js, TypeScript, PostgreSQL, PostHog, Resend, Stripe, Vercel]
---
# Stuck on how to get customers for my SaaS

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vo0ki6/stuck_on_how_to_get_customers_for_my_saas/

Original post:

> Over the past two months, I have been developing my Software as a Service (SaaS) product and successfully acquired one paid customer last week. However, I am uncertain about the best strategies for attracting additional customers. Should I consider hiring a marketing agency, or explore alternative options? Any feedback or constructive criticism would be greatly appreciated. I have validated the concept and completed the development, and I have also engaged several agency owners to test the product. It's not a job posting or any job seeking post, I am asking for guidance from those who have built and launched SaaS. submitted by /u/Tabissh [link] [comments]

---

What this plan addresses: A "first 10 customers" playbook tool for SaaS founders stuck on customer acquisition after months of building.

## Objective

A 30-task playbook for the first 10 paying customers, written for a solo technical founder with no marketing background. When I have shipped a SaaS and have 0-5 paying customers, I want a 30-task playbook with definitions of done, so I stop guessing what to try next.

## Target Users

- SaaS founders 2-6 months into launch with a working product and 0-5 paying customers
- Solo technical founders whose go-to-market instinct is weaker than their build instinct
- Founders who have tried "post on Twitter / Reddit / LinkedIn" and seen no traction

## MVP Scope

- Self-paced playbook with 30 tasks (15 paid, 15 free) covering positioning, outreach, pricing, retention
- Each task has a "definition of done" and a worked example
- Public task log where founders share results (anonymised)
- No fake testimonials; only logged task-completion data

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vo0ki6/stuck_on_how_to_get_customers_for` follows the constraints in `440-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says "stuck on how to get customers for my SaaS"
- No niche, ICP, or pricing stated
- Plan keeps the playbook generic to early-stage SaaS
