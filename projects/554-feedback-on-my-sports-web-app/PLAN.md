---
tags: ["saas", "sports", "analytics", "consumer"]
tech: ["Next.js", "TypeScript", "Supabase", "nflfastR", "Stripe"]
id: "554"
slug: feedback-on-my-sports-web-app
title: Feedback on my sports web app
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6lsh/feedback_on_my_sports_web_app/"
category: saas
date: "2026-08-14"
---
# Feedback on my sports web app

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **NFL data:** a weekly ingestion job from a public NFL data source (nflfastR or Pro-Football-Reference scrape, per ToS).
- **Backend:** Supabase (auth, the game database, the saved models, the per-pick confidence).
- **Record tracker:** a weekly cron that computes per-model win/loss against closing lines.
- **Payments:** Stripe.

## Architecture

Single web app + a weekly ingestion job. The model-builder runs in the browser (small filters, small dataset); the historical-performance and record-tracking run server-side.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-model demo with one filter. End of week 1.
2. **M1 — NFL data ingestion + filter variables.** Weather, location, performance, trends, team, coach, referee, travel, rest. End of week 4.
3. **M2 — Model-builder UI + historical performance chart.** End of week 6.
4. **M3 — Weekly picks + per-pick confidence.** End of week 8.
5. **M4 — Record tracker + Stripe paywall.** End of week 10.

## Risks

- **NFL data licensing** — public-data scraping is fragile; nflfastR is the safest source but limits to play-by-play.
- **State gambling regulations** — explicit disclaimer required; the tool is analytics, not betting advice.
