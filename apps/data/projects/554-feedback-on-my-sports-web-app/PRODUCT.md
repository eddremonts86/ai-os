---
id: "554"
slug: feedback-on-my-sports-web-app
title: Feedback on my sports web app
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6lsh/feedback_on_my_sports_web_app/"
category: saas
date: "2026-08-14"
tags: [saas, sports, analytics, consumer]
tech: [Next.js, TypeScript, Supabase, nflfastR, Stripe]
---
# Feedback on my sports web app

> Product brief for TrendLine, the NFL model-builder scoped in the source post.

## Value Proposition

A sports bettor can build their own NFL model by combining the variables they care about (weather, location, performance, trends, team, coach, referee, travel, rest), see the model's historical performance, and get the week's matching picks with per-pick confidence.

## Target Users

| Stakeholder | Why they care |
|---|---|
| US sports bettors | Want to build their own models rather than follow handicappers. |
| NFL analytics enthusiasts | Track NFL data for fun but do not bet. |
| Sports-betting Discord communities | Want a shared model. |

## Jobs To Be Done

1. **Functional job** — Combine filter variables into a model and see its historical performance.
2. **Functional job** — Get the week's matching games as picks.
3. **Functional job** — Track the model's record over time.

## Success Metrics

- **Activation:** first model saved within 7 days of signup.
- **Retention:** at least 1 model revision per active user per month.
- **Conversion:** ≥ 4% free-to-paid conversion within 90 days.

## Pricing & Monetization

Free tier: 1 saved model, weekly picks read-only. Pro at $19/month: unlimited models, per-pick confidence, record-tracking export.

## Competitive Landscape

- **Action Network / OddsJam** — betting picks, no model-builder.
- **Bet Labs (formerly Sports Insights)** — trend tools, no model-builder.
- **Spreadsheet + Reddit** — what most serious bettors do today.

## Risks & Open Questions

- [ ] Per-state gambling regulations: the tool must disclaim "analytics, not betting advice".
- [ ] The model's historical performance must be honest about backtest vs live; a backtest that looks great but fails live is the failure mode.
