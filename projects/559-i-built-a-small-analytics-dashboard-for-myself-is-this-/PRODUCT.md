---
tags: ["saas", "analytics", "indie", "dashboard"]
tech: ["Next.js", "TypeScript", "Supabase", "PostHog API", "Stripe API", "RevenueCat API", "Resend"]
id: "559"
slug: i-built-a-small-analytics-dashboard-for-myself-is-this-
title: I built a small analytics dashboard for myself. Is this actually useful to anyone else?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo5vt6/i_built_a_small_analytics_dashboard_for_myself_is/"
category: saas
date: "2026-08-14"
---
# I built a small analytics dashboard for myself, is this actually useful to anyone else?

> Product brief for the single-pane personal analytics dashboard scoped in the source post.

## Value Proposition

An indie SaaS founder can see active users, new users, returning users, top events, revenue, signups, and trends from PostHog + Supabase + RevenueCat + Stripe in one daily view — without logging into four tools.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Indie SaaS founders (1-3 products) | Want a daily check-in without 4 logins. |
| Small SaaS teams (2-5 engineers) | Want a shared daily metrics surface. |
| Solo creators selling subscriptions | Want a single revenue + signups view. |

## Jobs To Be Done

1. **Functional job** — Connect PostHog + Supabase + RevenueCat + Stripe to a single dashboard.
2. **Functional job** — See the day's KPI without leaving the dashboard.
3. **Functional job** — Get a daily notification with the most important changes.

## Success Metrics

- **Activation:** first connector linked and first KPI rendered within 7 days of signup.
- **Retention:** at least 5 dashboard opens per active user per week.
- **Conversion:** ≥ 8% free-to-paid conversion within 90 days.

## Pricing & Monetization

Free tier: 1 product, 2 connectors. Pro at $19/month: 5 products, all 4 connectors, Slack notifications.

## Competitive Landscape

- **Grafana / Metabase** — BI tools; too heavy for a daily personal check-in.
- **Baremetrics / ChartMogul** — Stripe-only dashboards; ignore the PostHog / Supabase side.
- **The four tools themselves** — what founders do today; the switching cost is real.

## Risks & Open Questions

- [ ] The four connectors are the MVP; a fifth connector (Mixpanel, Amplitude) is roadmap.
- [ ] The daily notification is the sticky feature; a noisy notification will lose trust fast.
