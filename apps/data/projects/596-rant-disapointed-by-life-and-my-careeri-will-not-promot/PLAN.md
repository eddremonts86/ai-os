---
id: "596"
slug: rant-disapointed-by-life-and-my-careeri-will-not-promot
title: (rant) Disapointed By Life and my career(I will not promote)
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1voq62g/rant_disapointed_by_life_and_my_careeri_will_not/"
category: startups
date: "2026-08-15"
tags: [saas, trading, ai, consumer]
tech: [Next.js, TypeScript, Polygon, Alpha Vantage, Supabase, Stripe]
---
# rant: disappointed by life and my career (and what I will do next)

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Market data:** Polygon or Alpha Vantage for daily ingest.
- **Model:** the founder's existing trading system, ported to TypeScript.
- **Storage:** Supabase (auth, the personal-style profile, the daily signals, the per-user customisations).
- **Payments:** Stripe.

## Architecture

Single web app + a daily ingest job that produces a signal per user per day. The personal-style profile is trained on the founder's past trades and serves as the baseline.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the founder's existing trading system re-documented. End of week 1.
2. **M1 — Daily signal + paper-trading mode.** End of week 4.
3. **M2 — Personal-style profile + per-user customisation.** End of week 6.
4. **M3 — Live-trading mode + Stripe paywall.** End of week 8.

## Risks

- **Backtest vs live honesty** — the signal must be honest about which mode produced the headline number.
- **Founder audience fit** — the medium audience is the first cohort; alienating them is the failure mode.
