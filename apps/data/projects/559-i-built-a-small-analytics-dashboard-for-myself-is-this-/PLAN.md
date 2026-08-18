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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Connectors:** PostHog (HTTP API), Supabase (Postgres direct read with a service-role key), RevenueCat (HTTP API), Stripe (Stripe API).
- **Storage:** Supabase (auth, the per-product workspace, the daily KPI snapshots, the connector credentials).
- **Daily notification:** a cron that runs at 09:00 per workspace timezone; Resend for email, Slack webhook for Slack.
- **Payments:** Stripe.

## Architecture

Single web app + a daily cron. The connectors pull the upstream data on the cron schedule; the dashboard reads the snapshots; the daily notification compares yesterday vs today and surfaces the most important deltas.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-connector demo. End of week 1.
2. **M1 — PostHog + Stripe connectors + KPI cards.** End of week 3.
3. **M2 — Supabase + RevenueCat connectors.** End of week 5.
4. **M3 — Daily notification + Slack integration.** End of week 7.
5. **M4 — Stripe paywall + Pro tier.** End of week 9.

## Risks

- **Upstream rate limits** — each connector must respect the upstream's rate limit; per-connector caching is mandatory.
- **Noisy daily notification** — if the notification surfaces every change, it loses trust; the change-feed must rank by importance.
