---
id: "604"
slug: launching-first-ads-today-thought-i-would-feel-more-exc
title: Launching first ads today. Thought I would feel more excited
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vovwm0/launching_first_ads_today_thought_i_would_feel/"
category: saas
date: "2026-08-15"
tags: [saas, growth, paid-acquisition, indie]
tech: [Next.js, TypeScript, Meta Ads API, Google Ads API, Reddit Ads API, Supabase, Stripe]
---
# Launching my first ad today for my little SaaS

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Ad-platform connectors:** Meta Ads API, Google Ads API, Reddit Ads API (read-only for the post-mortem workflow).
- **Storage:** Supabase (auth, per-ad spend, CTR, conversion, retention).
- **Payments:** Stripe.

## Architecture

Single web app + a weekly cron that pulls ad-platform metrics and assembles the post-mortem. The founder's SaaS itself is out of scope for this plan; the plan covers the launch workflow.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the first-ad playbook + the post-mortem template. End of week 1.
2. **M1 — Ad-platform connectors (read-only) + weekly cron.** End of week 4.
3. **M2 — Post-mortem workflow + per-channel advisor (Pro tier).** End of week 6.
4. **M3 — Stripe paywall.** End of week 8.

## Risks

- **First-ad budget blowout** — the founder must cap the first-ad budget before launch; a 100% loss must be acceptable.
- **Perfectionism** — the weekly post-mortem ritual is the safety net; without it the founder will keep editing the ad instead of shipping.
