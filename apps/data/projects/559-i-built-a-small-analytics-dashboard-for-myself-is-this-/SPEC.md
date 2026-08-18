---
id: "559"
slug: i-built-a-small-analytics-dashboard-for-myself-is-this-
title: I built a small analytics dashboard for myself. Is this actually useful to anyone else?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo5vt6/i_built_a_small_analytics_dashboard_for_myself_is/"
category: saas
date: "2026-08-14"
tags: [saas, analytics, indie, dashboard]
tech: [Next.js, TypeScript, Supabase, PostHog API, Stripe API, RevenueCat API, Resend]
---
# I built a small analytics dashboard for myself, is this actually useful to anyone else?

## Problem

A founder was tired of switching between PostHog, Supabase, RevenueCat, Stripe, etc. just to get a quick idea of how their products were doing. They randomly started building a personal dashboard that pulls the important metrics from these tools into one place: active and new users, returning users, top events, revenue / subscriptions, signups, basic trends, daily / weekly / monthly views, a daily notification with the most important changes. Originally for themselves; posted a screenshot on X and a couple of people said an "all your analytics at a glance" tool could be useful. The founder is asking if anyone would actually use this and what the existing solutions are. The implicit product: a single-pane personal analytics dashboard that aggregates PostHog + Supabase + RevenueCat + Stripe into one screen.

## Objective

Define the MVP scope for a single-pane personal analytics dashboard that aggregates the four most common indie-SaaS data sources (PostHog, Supabase, RevenueCat, Stripe) into one daily / weekly / monthly view, with a daily notification of the most important changes.

## Target Users

- **Primary:** indie SaaS founders running 1-3 small products who want a daily check-in without logging into 4 tools.
- **Secondary:** small SaaS teams (2-5 engineers) who want a shared daily metrics surface.
- **Tertiary:** solo creators who sell subscriptions via Stripe and want a single revenue + signups view.

## MVP Scope

- Connectors: PostHog, Supabase, RevenueCat, Stripe (OAuth where available, API key where not).
- A single dashboard: active users, new users, returning users, top events, revenue, signups, trends, daily / weekly / monthly views.
- A daily notification (email + Slack) with the most important changes vs yesterday.
- Per-product workspace; one personal workspace supports up to 5 products.
- Free tier: 1 product, 2 connectors. Pro at $19/month: 5 products, all 4 connectors, Slack notifications.
- Excluded in v1: custom connectors, BI-style dashboards, team workspace, alerts / thresholds, SQL.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single dashboard surface — KPI cards at the top, a daily-trend chart in the centre, the change-feed at the bottom. No marketing-site chrome; the product is the KPI.

## Constraints

- Each connector must respect the upstream rate limits; the daily aggregation runs at a fixed time per connector.
- The free tier must work for a single product without paying the upstream cost; per-connector caching is mandatory.
- The daily notification must surface only the most important changes; a noisy notification is the failure mode.
