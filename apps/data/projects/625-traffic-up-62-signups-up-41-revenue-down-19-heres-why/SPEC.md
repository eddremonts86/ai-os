---
id: "625"
slug: traffic-up-62-signups-up-41-revenue-down-19-heres-why
title: "traffic up 62%, signups up 41%, revenue down 19%. heres why"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozoil/traffic_up_62_signups_up_41_revenue_down_19_heres/"
category: saas
date: "2026-08-15"
tags: [saas, analytics, revenue, indie]
tech: [Next.js, TypeScript, Stripe API, Supabase, Stripe]
---
# Traffic up 62%, signups up 41%, revenue down 19%, here's why

## Problem

A UserMaven founder noticed a client case where paid social drove traffic up 62%, signups up 41%, but revenue down 19%. The client spent time looking in the wrong places and checked the funnel at the wrong stage. The implicit product: a UserMaven-style analytics tool focused on the revenue-impact stage of the funnel, not just the top-of-funnel traffic / signup metrics.

## Objective

Define the MVP scope for a revenue-impact analytics tool: the same product surface UserMaven offers, but with the revenue-impact stage of the funnel surfaced as a first-class metric, not a buried tab.

## Target Users

- **Primary:** indie SaaS founders running paid social who need to know whether the signups are converting to revenue.
- **Secondary:** small SaaS teams optimising the revenue stage of the funnel.
- **Tertiary:** growth marketers who report on revenue impact, not just signups.

## MVP Scope

- Revenue-impact stage of the funnel: per-channel, per-cohort, per-plan revenue contribution.
- A "revenue down, signups up" alert: when signup growth outpaces revenue growth beyond a threshold, surface an alert.
- Cohort retention by acquisition channel.
- Free tier: 1 site, 30-day retention. Pro at $29/month: 5 sites, unlimited retention, the alert.
- Excluded in v1: BI-style dashboards, SQL access, team collaboration.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single revenue-impact surface — the funnel with the revenue stage front and centre, the alert panel below, the per-channel cohort retention on the right. No marketing-site chrome; the product is the funnel.

## Constraints

- The revenue-impact stage must be a first-class metric, not a buried tab.
- The "revenue down, signups up" alert must be specific; a generic "your metrics changed" alert is the failure mode.
- Per-channel cohort retention must respect the user's privacy settings (no third-party tracking).
