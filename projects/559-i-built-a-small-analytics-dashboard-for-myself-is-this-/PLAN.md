---
id: "559"
slug: i-built-a-small-analytics-dashboard-for-myself-is-this-
title: I built a small analytics dashboard for myself. Is this actually useful to anyone else?
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo5vt6/i_built_a_small_analytics_dashboard_for_myself_is/"
category: saas
date: "2026-08-14"
---
# I built a small analytics dashboard for myself. Is this actually useful to anyone else?

## Tech Stack

- **Source connectors:** thin adapters per data source — PostHog (events + persons), Supabase (DB row counts + auth), RevenueCat (subscriptions + churn), Stripe (MRR + charges) — each polls on a 5-minute cadence and writes to a single canonical metrics store.
- **Metrics store:** Postgres with one row per `(user_id, metric_key, day)` and a small set of pre-computed rollups (daily/weekly/monthly); the dashboard reads from the rollups, not the raw events.
- **Web app:** Next.js with a per-user dashboard page (active users, new users, returning users, top events, MRR, signups, trend lines) and a daily email digest.
- **Daily digest:** a Resend-driven email at the user's configured hour; the digest highlights only the metrics that moved more than a configurable threshold since yesterday.
- **Auth:** Clerk (or NextAuth) with row-level scoping per user.

## Architecture

The OP is a solo developer who built a personal analytics dashboard to stop switching between PostHog, Supabase, RevenueCat, and Stripe. The product's value is the consolidation, not new analytics — every metric on the dashboard already exists somewhere else. The wedge is "one page, every morning" plus a daily email that only fires when something actually moved.

```
Source APIs ───▶ connector cron (5-min cadence) ───▶ Postgres metrics store
                                                         │
                                                         ├─▶ dashboard rollups (daily/weekly/monthly)
                                                         │
                                                         └─▶ delta detector ──▶ daily Resend digest
                                                                                      (only on movement)
```

## Milestones

1. **M0 — Single-user MVP.** Connect PostHog + Stripe, build the dashboard page for one user. End of week 2.
2. **M1 — Supabase + RevenueCat connectors; threshold-based digest.** End of week 5.
3. **M2 — Multi-user auth + per-user connectors.** End of week 8.
4. **M3 — Paid tier with additional connectors (Mixpanel, Plausible, ChartMogul).** End of week 12.
5. **M4 — Cohort + funnel views built on top of the same metrics store.** End of week 18.

## Risks

- **The OP explicitly questions whether the pain is real.** The product must validate before building the multi-tenant path; if the early-access signups do not convert, the right answer is "this was just my problem" and the project should be parked, not pushed.
- **Connector drift.** PostHog, Stripe, and RevenueCat change their API surfaces regularly. Each connector needs a versioned client and a daily health check that surfaces breakage in a status page before a customer notices.
- **Daily digest fatigue.** A daily email that fires even on quiet days gets muted. The threshold detector is the make-or-break of the digest; without it the digest becomes noise.
