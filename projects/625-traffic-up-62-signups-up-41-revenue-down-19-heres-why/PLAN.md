---
tags: ["saas", "analytics", "revenue", "indie"]
tech: ["Next.js", "TypeScript", "Stripe API", "Supabase", "Stripe"]
id: "625"
slug: traffic-up-62-signups-up-41-revenue-down-19-heres-why
title: "traffic up 62%, signups up 41%, revenue down 19%. heres why"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozoil/traffic_up_62_signups_up_41_revenue_down_19_heres/"
category: saas
date: "2026-08-15"
---
# Traffic up 62%, signups up 41%, revenue down 19%, here's why

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Backend:** Supabase (auth, per-site revenue-impact data, cohort retention).
- **Data ingest:** Stripe API + the host app's own events (via a lightweight SDK).
- **Alert engine:** a TypeScript rules engine that compares signup growth vs revenue growth per channel.
- **Payments:** Stripe.

## Architecture

Single web app + a daily ingest job that pulls Stripe data and the host app's events. The alert engine runs on the daily job.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the funnel with the revenue-impact stage front and centre. End of week 1.
2. **M1 — Stripe ingest + per-channel revenue-impact.** End of week 3.
3. **M2 — Cohort retention + alert engine.** End of week 5.
4. **M3 — Stripe paywall + Pro tier.** End of week 7.

## Risks

- **First-class metric** — the revenue-impact stage must be a first-class metric, not a buried tab.
- **Alert specificity** — a generic "your metrics changed" alert is the failure mode; the alert must name the channel.
