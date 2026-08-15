---
id: "554"
slug: feedback-on-my-sports-web-app
title: Feedback on my sports web app
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo6lsh/feedback_on_my_sports_web_app/"
category: saas
date: "2026-08-14"
---
# Feedback on my sports web app

## Tech Stack

- **Game + team data:** a Postgres-backed store of NFL games with rich per-game attributes (weather, location, coach, referee, travel distance, rest days) — sourced from a combination of free APIs (nflfastR, weather.gov) and scraped public sources.
- **Filter engine:** a SQL builder that translates user-defined model filters into a parameterised query; the same engine powers the historical-performance replay view.
- **Web app:** Next.js on Vercel; the model builder is a single-page React flow with a sidebar for filter criteria and a main panel for the current week's matching games.
- **Auth + payments:** Clerk (or NextAuth) for login; Stripe subscriptions for the paid tier that unlocks unlimited saved models.
- **Charts:** Recharts for historical performance visualisation.

## Architecture

Trendline lets a user build a sports-betting model by composing filters over NFL games (weather, location, performance, trends, team, coach, referee, travel, rest). The user saves a model and the site replays it against historical games to show hit-rate and ROI, then surfaces the current week's games that match the same filters. The free tier lets users build and replay a small number of models; the paid tier lifts the cap.

```
User picks filters ─▶ Next.js UI ─▶ filter-engine API ─▶ Postgres (games table)
                                              │
                                              ├─▶ historical replay (hit-rate, ROI)
                                              └─▶ current-week matching games
                                                            │
                                                            ▼
                                                       Stripe subscription for unlimited models
```

## Milestones

1. **M0 — Free-tier MVP.** Filter builder + historical replay + current-week match list, single model per user. End of week 4.
2. **M1 — Multi-model support + saved models.** End of week 8.
3. **M2 — Stripe subscription for unlimited saved models.** End of week 11.
4. **M3 — Per-user model sharing (paid tier).** End of week 14.
5. **M4 — Extend to NBA / college football.** End of week 22.

## Risks

- **Data licensing.** NFL data is partly public (game results, weather) and partly restricted (some advanced stats, certain feeds). The free APIs are sufficient for an MVP but limit the depth of the model filters; commercial data deals can be expensive and need to be planned before the user count justifies them.
- **State-by-state sports-betting legality.** US state regulations on sports-betting products differ and change. The MVP should not process wagers or take a position on a bet — it sells model filters and historical-replay views, which is the safer lane.
- **Model ROI overstate risk.** A historical replay that overstates hit-rate (by including half-finished games, by mis-handling pushes, by ignoring closing-line value) will mislead users. The replay engine needs an explicit definition of what counts as a win, push, or void, surfaced in the UI.
